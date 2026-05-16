// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'providers/transaction_provider.dart';
import 'providers/pokemon_provider.dart';
import 'screens/home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('vi_VN', null);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider( // ✅ Đổi sang MultiProvider
      providers: [
        ChangeNotifierProvider(create: (_) => TransactionProvider()),
        ChangeNotifierProvider(create: (_) => PokemonProvider()), // ✅ Thêm
      ],
      child: MaterialApp(
        title: 'CapMoney',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('vi', 'VN'), Locale('en', 'US')],
        locale: const Locale('vi', 'VN'),
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF6C63FF),
            brightness: Brightness.dark,
          ),
        ),
        home: const AppInitializer(),
      ),
    );
  }
}

class AppInitializer extends StatefulWidget {
  const AppInitializer({super.key});

  @override
  State<AppInitializer> createState() => _AppInitializerState();
}

class _AppInitializerState extends State<AppInitializer> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _initializeData());
  }

  Future<void> _initializeData() async {
    if (!mounted) return;
    // ✅ Load song song cả hai provider
    await Future.wait([
      context.read<TransactionProvider>().loadAllData(),
      context.read<PokemonProvider>().loadAllData(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    // ✅ Lắng nghe cả hai provider — chỉ show HomeScreen khi cả hai đã load xong
    return Consumer2<TransactionProvider, PokemonProvider>(
      builder: (context, txProvider, pokemonProvider, child) {
        // Đang load (một trong hai)
        if (txProvider.isLoading || pokemonProvider.isLoading) {
          return const Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Đang tải dữ liệu...'),
                ],
              ),
            ),
          );
        }

        // Có lỗi (ưu tiên hiện lỗi transaction trước, rồi đến pokemon)
        final error = txProvider.loadError ?? pokemonProvider.loadError;
        if (error != null) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 64, color: Colors.red),
                  const SizedBox(height: 16),
                  Text(
                    'Lỗi: $error',
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.red),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      txProvider.retryLoad();
                      pokemonProvider.retryLoad();
                    },
                    child: const Text('Thử lại'),
                  ),
                ],
              ),
            ),
          );
        }

        // Thành công → Show HomeScreen
        return const HomeScreen();
      },
    );
  }
}