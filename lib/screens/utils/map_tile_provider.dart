import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/foundation.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_file_store/dio_cache_interceptor_file_store.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/painting.dart';

/// TileProvider tự build dùng Dio + FileCacheStore.
/// Gọi [CachedTileProvider.create()] để lấy singleton instance.
class CachedTileProvider extends TileProvider {
  CachedTileProvider._(this._dio);

  final Dio _dio;

  static CachedTileProvider? _instance;
  static FileCacheStore? _cacheStore;

  /// Singleton — khởi tạo 1 lần, tái sử dụng toàn app.
  static Future<CachedTileProvider> create() async {
    if (_instance != null) return _instance!;

    final cacheDir = await getTemporaryDirectory();
    final tileCacheDir = Directory('${cacheDir.path}/map_tiles');
    await tileCacheDir.create(recursive: true);

    _cacheStore = FileCacheStore(tileCacheDir.path);

    final cacheOptions = CacheOptions(
      store: _cacheStore!,
      policy: CachePolicy.forceCache,
      maxStale: const Duration(days: 30),
      hitCacheOnErrorExcept: [401, 403],
    );

    final dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 15),
      ),
    )..interceptors.add(DioCacheInterceptor(options: cacheOptions));

    _instance = CachedTileProvider._(dio);
    return _instance!;
  }

  /// Xóa toàn bộ tile cache.
  static Future<void> clearCache() async {
    await _cacheStore?.clean();
    _instance = null;
    _cacheStore = null;
  }

  @override
  ImageProvider getImage(TileCoordinates coordinates, TileLayer options) {
    return _DioTileImageProvider(
      url: getTileUrl(coordinates, options),
      dio: _dio,
    );
  }
}

// ---------------------------------------------------------------------------

class _DioTileImageProvider extends ImageProvider<_DioTileImageProvider> {
  const _DioTileImageProvider({required this.url, required this.dio});

  final String url;
  final Dio dio;

  @override
  Future<_DioTileImageProvider> obtainKey(ImageConfiguration configuration) =>
      Future.value(this);

  @override
  ImageStreamCompleter loadImage(
    _DioTileImageProvider key,
    ImageDecoderCallback decode,
  ) {
    return MultiFrameImageStreamCompleter(
      codec: _fetchAndDecode(key, decode),
      scale: 1.0,
    );
  }

  Future<ui.Codec> _fetchAndDecode(
    _DioTileImageProvider key,
    ImageDecoderCallback decode,
  ) async {
    try {
      final response = await dio.get<List<int>>(
        key.url,
        options: Options(responseType: ResponseType.bytes),
      );
      final bytes = Uint8List.fromList(response.data!);
      final buffer = await ui.ImmutableBuffer.fromUint8List(bytes);
      return decode(buffer);
    } catch (_) {
      // 1x1 transparent PNG fallback khi offline / lỗi mạng
      final buffer = await ui.ImmutableBuffer.fromUint8List(
        Uint8List.fromList(const [
          0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A,
          0x00, 0x00, 0x00, 0x0D, 0x49, 0x48, 0x44, 0x52,
          0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01,
          0x08, 0x06, 0x00, 0x00, 0x00, 0x1F, 0x15, 0xC4,
          0x89, 0x00, 0x00, 0x00, 0x0A, 0x49, 0x44, 0x41,
          0x54, 0x78, 0x9C, 0x62, 0x00, 0x00, 0x00, 0x02,
          0x00, 0x01, 0xE2, 0x21, 0xBC, 0x33, 0x00, 0x00,
          0x00, 0x00, 0x49, 0x45, 0x4E, 0x44, 0xAE, 0x42,
          0x60, 0x82,
        ]),
      );
      return decode(buffer);
    }
  }

  @override
  bool operator ==(Object other) =>
      other is _DioTileImageProvider && url == other.url;

  @override
  int get hashCode => url.hashCode;
}