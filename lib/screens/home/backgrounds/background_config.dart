import 'package:flutter/material.dart';
import 'aurora_background.dart';
import 'constellation_background.dart';
import 'deer_forest_background.dart';
import 'fireflies_background.dart';
import 'floating_leaves_background.dart';
import 'fluid_simulation_background.dart';
import 'geometric_shapes_background.dart';
import 'jellyfish_background.dart';
import 'koi_fish_background.dart';
import 'orbital_rings_background.dart';
import 'peacock_background.dart';
import 'star_field_background.dart';
import 'wave_background.dart';
import 'gradient_blobs_background.dart';
import 'sunrise_background.dart';
import 'dart:math';

class BackgroundConfig {
  final String id;
  final String name;
  final Widget Function() builder;
  final List<Color> primaryColors;
  final Duration animationDuration;
  final BackgroundType type;

  const BackgroundConfig({
    required this.id,
    required this.name,
    required this.builder,
    required this.primaryColors,
    required this.animationDuration,
    required this.type,
  });
}

enum BackgroundType { nature, animal, abstract, space, water }

enum TimeOfDay {
  earlyMorning, // 5:00 - 8:00
  morning, // 8:00 - 12:00
  noon, // 12:00 - 14:00
  afternoon, // 14:00 - 18:00
  evening, // 18:00 - 22:00
  night, // 22:00 - 5:00
}

class BackgroundTimeManager {
  static TimeOfDay getCurrentTimeOfDay() {
    final hour = DateTime.now().hour;

    if (hour >= 5 && hour < 8) return TimeOfDay.earlyMorning;
    if (hour >= 8 && hour < 12) return TimeOfDay.morning;
    if (hour >= 12 && hour < 14) return TimeOfDay.noon;
    if (hour >= 14 && hour < 18) return TimeOfDay.afternoon;
    if (hour >= 18 && hour < 22) return TimeOfDay.evening;
    return TimeOfDay.night;
  }

  static int? _cachedHour;
  static BackgroundConfig? _cachedBackground;

  static BackgroundConfig getBackground() {
    // 🧪 KIỂM TRA TEST MODE
    if (testBackgroundId != null) {
      final testBg = BackgroundRegistry.getById(testBackgroundId!);
      if (testBg != null) {
        return testBg;
      }
    }

    final now = DateTime.now();
    final currentHour = now.hour;

    if (_cachedHour == currentHour && _cachedBackground != null) {
      return _cachedBackground!;
    }

    final timeOfDay = getCurrentTimeOfDay();
    final list = _timeBackgroundMap[timeOfDay]!;

    final random = Random();
    BackgroundConfig next;

    do {
      next = list[random.nextInt(list.length)];
    } while (_cachedBackground != null && next.id == _cachedBackground!.id);

    _cachedHour = currentHour;
    _cachedBackground = next;

    return next;
  }

  static List<BackgroundConfig> getAllBackgrounds() {
    return BackgroundRegistry.all;
  }

  static final Map<TimeOfDay, List<BackgroundConfig>> _timeBackgroundMap = {
    TimeOfDay.earlyMorning: [
      BackgroundRegistry.sunrise,
      BackgroundRegistry.floatingLeaves,
      BackgroundRegistry.deerForest,
    ],

    TimeOfDay.morning: [
      BackgroundRegistry.koiFish,
      BackgroundRegistry.peacock,
      BackgroundRegistry.wave,
    ],

    TimeOfDay.noon: [
      BackgroundRegistry.gradientBlobs,
      BackgroundRegistry.fluidSimulation,
      BackgroundRegistry.geometricShapes,
    ],

    TimeOfDay.afternoon: [
      BackgroundRegistry.wave,
      BackgroundRegistry.jellyfish,
      BackgroundRegistry.koiFish,
    ],

    TimeOfDay.evening: [
      BackgroundRegistry.fireflies,
      BackgroundRegistry.floatingLeaves,
      BackgroundRegistry.sunrise,
    ],

    TimeOfDay.night: [
      BackgroundRegistry.starField,
      BackgroundRegistry.constellation,
      BackgroundRegistry.orbitalRings,
      BackgroundRegistry.aurora,
    ],
  };
}

class BackgroundRegistry {
  static const wave = BackgroundConfig(
    id: 'wave',
    name: 'Sóng Biển',
    builder: WaveBackground.new,
    primaryColors: [Color(0xFF0077B6), Color(0xFF00B4D8), Color(0xFF90E0EF)],
    animationDuration: Duration(seconds: 10),
    type: BackgroundType.water,
  );

  static const aurora = BackgroundConfig(
    id: 'aurora',
    name: 'Cực Quang',
    builder: AuroraBackground.new,
    primaryColors: [Color(0xFF00FF87), Color(0xFF60EFF3), Color(0xFF9D4EDD)],
    animationDuration: Duration(seconds: 15),
    type: BackgroundType.nature,
  );

  static const fireflies = BackgroundConfig(
    id: 'fireflies',
    name: 'Đom Đóm',
    builder: OptimizedFirefliesBackground.new,
    primaryColors: [Color(0xFFFFE66D), Color(0xFFFF9E00), Color(0xFF3D5A80)],
    animationDuration: Duration(seconds: 10),
    type: BackgroundType.nature,
  );

  static const floatingLeaves = BackgroundConfig(
    id: 'floatingLeaves',
    name: 'Lá Rơi',
    builder: FloatingLeavesBackground.new,
    primaryColors: [Color(0xFFD4A574), Color(0xFFA67C52), Color(0xFF6B4423)],
    animationDuration: Duration(seconds: 12),
    type: BackgroundType.nature,
  );

  static const constellation = BackgroundConfig(
    id: 'constellation',
    name: 'Chòm Sao',
    builder: ZodiacConstellationBackground.new,
    primaryColors: [Color(0xFFE8E8E8), Color(0xFF6C63FF), Color(0xFF00D9FF)],
    animationDuration: Duration(seconds: 20),
    type: BackgroundType.space,
  );

  static const starField = BackgroundConfig(
    id: 'starField',
    name: 'Bầu Trời Sao',
    builder: StarFieldBackground.new,
    primaryColors: [Color(0xFFFFD700), Color(0xFFE8E8E8), Color(0xFF0B0F19)],
    animationDuration: Duration(seconds: 25),
    type: BackgroundType.space,
  );

  static const orbitalRings = BackgroundConfig(
    id: 'orbitalRings',
    name: 'Vòng Quỹ Đạo',
    builder: OrbitalRingsBackground.new,
    primaryColors: [Color(0xFF00D9FF), Color(0xFF6C63FF), Color(0xFF1B1B3A)],
    animationDuration: Duration(seconds: 30),
    type: BackgroundType.space,
  );

  static const fluidSimulation = BackgroundConfig(
    id: 'fluidSimulation',
    name: 'Chất Lỏng',
    builder: FluidSimulationBackground.new,
    primaryColors: [Color(0xFF6C63FF), Color(0xFF00D9FF), Color(0xFFFF6B6B)],
    animationDuration: Duration(seconds: 20),
    type: BackgroundType.abstract,
  );

  static const geometricShapes = BackgroundConfig(
    id: 'geometricShapes',
    name: 'Hình Học',
    builder: GeometricShapesBackground.new,
    primaryColors: [Color(0xFFF4D35E), Color(0xFFEE964B), Color(0xFF1B1B3A)],
    animationDuration: Duration(seconds: 18),
    type: BackgroundType.abstract,
  );

  static const jellyfish = BackgroundConfig(
    id: 'jellyfish',
    name: 'Sứa Biển',
    builder: JellyfishUltraBackground.new,
    primaryColors: [Color(0xFFFF9E00), Color(0xFF00D9FF), Color(0xFF3D5A80)],
    animationDuration: Duration(seconds: 5),
    type: BackgroundType.animal,
  );

  static const koiFish = BackgroundConfig(
    id: 'koiFish',
    name: 'Cá Koi',
    builder: KoiFishUltraBackground.new,
    primaryColors: [Color(0xFFFF6B35), Color(0xFFF7C548), Color(0xFF1B1B3A)],
    animationDuration: Duration(seconds: 15),
    type: BackgroundType.animal,
  );

  static const deerForest = BackgroundConfig(
    id: 'deerForest',
    name: 'Hươu Trong Rừng',
    builder: DeerForestBackground.new,
    primaryColors: [Color(0xFF8B7355), Color(0xFF5D7A5F), Color(0xFF2C3E2C)],
    animationDuration: Duration(seconds: 20),
    type: BackgroundType.animal,
  );

  static const peacock = BackgroundConfig(
    id: 'peacock',
    name: 'Công Múa',
    builder: PeacockBackground.new,
    primaryColors: [Color(0xFF00A896), Color(0xFF028090), Color(0xFFF4D35E)],
    animationDuration: Duration(seconds: 14),
    type: BackgroundType.animal,
  );

  static const sunrise = BackgroundConfig(
    id: 'sunrise',
    name: 'Bình Minh',
    builder: SunriseBackground.new,
    primaryColors: [Color(0xFFFF9E00), Color(0xFFFF6B35), Color(0xFF0077B6)],
    animationDuration: Duration(seconds: 15),
    type: BackgroundType.nature,
  );

  static const gradientBlobs = BackgroundConfig(
    id: 'gradientBlobs',
    name: '3 Quả Bóng Gradient',
    builder: GradientBlobsBackground.new,
    primaryColors: [Color(0xFF6C63FF), Color(0xFF00D9FF), Color(0xFFFF6B6B)],
    animationDuration: Duration(seconds: 10),
    type: BackgroundType.abstract,
  );

  static const List<BackgroundConfig> all = [
    gradientBlobs,
    wave,
    aurora,
    fireflies,
    floatingLeaves,
    constellation,
    starField,
    orbitalRings,
    fluidSimulation,
    geometricShapes,
    jellyfish,
    koiFish,
    deerForest,
    peacock,
    sunrise,
  ];

  static BackgroundConfig? getById(String id) {
    try {
      return all.firstWhere((bg) => bg.id == id);
    } catch (e) {
      return null;
    }
  }
}

// ============================================
// 🧪 BIẾN TEST - CHỈ CẦN SỬA GIÁ TRỊ Ở ĐÂY
// ============================================
const String? testBackgroundId = null;
// ============================================
