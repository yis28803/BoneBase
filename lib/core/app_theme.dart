import 'package:flutter/material.dart';

class AppColors {
  // Backgrounds
  static const Color bgDeep = Color(0xFF080B14);
  static const Color bgCard = Color(0xFF0F1420);
  static const Color bgSurface = Color(0xFF151C2E);
  static const Color bgElevated = Color(0xFF1C2540);

  // Accent
  static const Color accentGold = Color(0xFFFFD700);
  static const Color accentGoldDim = Color(0xFFB8960C);
  static const Color accentBlue = Color(0xFF4A9EFF);
  static const Color accentPurple = Color(0xFF9B6BFF);
  //Cập Nhật
  static const Color accentPink = Color(0xFFFF4FD8);

  // Rarity colors
  static const Color rarityCommon = Color(0xFF8A9BB0);
  static const Color rarityRare = Color(0xFF4A9EFF);
  static const Color rarityEpic = Color(0xFF9B6BFF);
  static const Color rarityLegendary = Color(0xFFFFD700);
  //Cập Nhật
  static const Color rarityMythical = Color(0xFFFF4FD8);

  // Text
  static const Color textPrimary = Color(0xFFEEF2FF);
  static const Color textSecondary = Color(0xFF8A9BB0);
  static const Color textMuted = Color(0xFF4A5568);

  // Progress / UI
  static const Color progressBg = Color(0xFF1C2540);
  static const Color progressFill = Color(0xFF4A9EFF);
  static const Color divider = Color(0xFF1C2540);

  static Color rarityColor(String rarity) {
    switch (rarity.toLowerCase()) {
      case 'mythical':
        return rarityMythical;

      case 'legendary':
        return rarityLegendary;

      case 'epic':
        return rarityEpic;

      case 'rare':
        return rarityRare;

      default:
        return rarityCommon;
    }
  }

  static List<Color> rarityGradient(String rarity) {
    switch (rarity.toLowerCase()) {
      case 'mythical':
        return [Color(0xFFFF4FD8), Color(0xFF7A5CFF)];

      case 'legendary':
        return [Color(0xFFFFD700), Color(0xFFFF8C00)];

      case 'epic':
        return [Color(0xFF9B6BFF), Color(0xFF6B3FD4)];

      case 'rare':
        return [Color(0xFF4A9EFF), Color(0xFF1A6FCC)];

      default:
        return [Color(0xFF8A9BB0), Color(0xFF4A5568)];
    }
  }
}

class AppTheme {
  static ThemeData get dark {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.bgDeep,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.accentBlue,
        secondary: AppColors.accentGold,
        surface: AppColors.bgSurface,
        background: AppColors.bgDeep,
      ),
      fontFamily: 'SF Pro Display',
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          color: AppColors.textPrimary,
          fontSize: 32,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.5,
        ),
        displayMedium: TextStyle(
          color: AppColors.textPrimary,
          fontSize: 24,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.3,
        ),
        titleLarge: TextStyle(
          color: AppColors.textPrimary,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        titleMedium: TextStyle(
          color: AppColors.textPrimary,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        bodyLarge: TextStyle(
          color: AppColors.textPrimary,
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: AppColors.textSecondary,
          fontSize: 13,
          fontWeight: FontWeight.w400,
        ),
        labelSmall: TextStyle(
          color: AppColors.textMuted,
          fontSize: 11,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.8,
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.bgDeep,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: AppColors.textPrimary,
          fontSize: 17,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.2,
        ),
        iconTheme: IconThemeData(color: AppColors.textPrimary),
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        },
      ),
    );
  }
}
