import 'package:flutter/material.dart';
import 'dart:math' as math;

class ZodiacConstellationBackground extends StatefulWidget {
  const ZodiacConstellationBackground({super.key});

  @override
  State<ZodiacConstellationBackground> createState() =>
      _ZodiacConstellationBackgroundState();
}

class _ZodiacConstellationBackgroundState
    extends State<ZodiacConstellationBackground>
    with TickerProviderStateMixin {
  late List<_ZodiacConstellation> _zodiacConstellations;
  late List<_ZodiacConstellation> _activeConstellations;
  late AnimationController _controller;

  final int _activeConstellationCount = 4;
  final double _connectionDistance = 120;

  @override
  void initState() {
    super.initState();
    _initZodiacConstellations();
    _selectActiveConstellations();

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 25))
          ..repeat()
          ..addListener(() {
            setState(_updateConstellations);
          });
  }

  // Danh sách 12 chòm sao cung hoàng đạo với tọa độ tương đối CHÍNH XÁC HƠN
  // Danh sách 12 chòm sao cung hoàng đạo với tọa độ tương đối CHI TIẾT
  void _initZodiacConstellations() {
    _zodiacConstellations = [
      // ♈ ARIES - Bạch Dương (Con Cừu Đực) - 35 sao
      _ZodiacConstellation(
        name: 'Aries',
        stars: [
          // Đầu cừu
          _Star(x: 0.50, y: 0.50, size: 3.2), // α Arietis (Hamal)
          _Star(x: 0.58, y: 0.48, size: 2.6), // β Arietis (Sheratan)
          _Star(x: 0.65, y: 0.50, size: 2.2), // γ Arietis (Mesarthim)
          _Star(x: 0.72, y: 0.52, size: 1.8), // 41 Arietis
          _Star(x: 0.78, y: 0.55, size: 1.5), // 35 Arietis
          _Star(x: 0.82, y: 0.58, size: 1.3), // 39 Arietis
          // Sừng trái
          _Star(x: 0.43, y: 0.55, size: 2.0), // δ Arietis
          _Star(x: 0.38, y: 0.58, size: 1.7), // ε Arietis
          _Star(x: 0.32, y: 0.60, size: 1.5), // 14 Arietis
          _Star(x: 0.28, y: 0.62, size: 1.3), // 20 Arietis
          _Star(x: 0.25, y: 0.65, size: 1.2), // 25 Arietis
          // Sừng phải
          _Star(x: 0.55, y: 0.42, size: 1.8), // ζ Arietis
          _Star(x: 0.58, y: 0.38, size: 1.6), // 30 Arietis
          _Star(x: 0.62, y: 0.35, size: 1.4), // 33 Arietis
          _Star(x: 0.66, y: 0.32, size: 1.3), // 37 Arietis
          // Mặt và mũi
          _Star(x: 0.48, y: 0.38, size: 1.5), // η Arietis
          _Star(x: 0.45, y: 0.35, size: 1.4), // 27 Arietis
          _Star(x: 0.42, y: 0.32, size: 1.3), // 29 Arietis
          _Star(x: 0.52, y: 0.35, size: 1.4), // ι Arietis
          // Cổ và thân trên
          _Star(x: 0.35, y: 0.52, size: 1.6), // θ Arietis
          _Star(x: 0.30, y: 0.55, size: 1.4), // 19 Arietis
          _Star(x: 0.25, y: 0.58, size: 1.3), // 17 Arietis
          _Star(x: 0.45, y: 0.60, size: 1.5), // 23 Arietis
          _Star(x: 0.40, y: 0.65, size: 1.3), // 24 Arietis
          _Star(x: 0.35, y: 0.68, size: 1.2), // 26 Arietis
          // Thân dưới
          _Star(x: 0.55, y: 0.65, size: 1.4), // 45 Arietis
          _Star(x: 0.60, y: 0.68, size: 1.3), // 47 Arietis
          _Star(x: 0.65, y: 0.70, size: 1.2), // 51 Arietis
          _Star(x: 0.70, y: 0.72, size: 1.1), // 53 Arietis
          // Chân
          _Star(x: 0.48, y: 0.72, size: 1.3), // 55 Arietis
          _Star(x: 0.52, y: 0.75, size: 1.2), // 57 Arietis
          _Star(x: 0.45, y: 0.78, size: 1.1), // 59 Arietis
          _Star(x: 0.42, y: 0.82, size: 1.0), // 61 Arietis
          // Đuôi
          _Star(x: 0.75, y: 0.65, size: 1.2), // 63 Arietis
          _Star(x: 0.78, y: 0.68, size: 1.1), // 65 Arietis
        ],
        connections: [
          // Đường cong chính của đầu
          [0, 1], [1, 2], [2, 3], [3, 4], [4, 5],
          // Sừng trái
          [0, 6], [6, 7], [7, 8], [8, 9], [9, 10],
          // Sừng phải
          [0, 11], [11, 12], [12, 13], [13, 14],
          // Mặt
          [1, 15], [15, 16], [16, 17], [1, 18],
          // Cổ
          [0, 19], [19, 20], [20, 21], [6, 22], [22, 23], [23, 24],
          // Thân
          [19, 25], [25, 26], [26, 27], [27, 28],
          // Chân
          [25, 29], [29, 30], [30, 31], [31, 32],
          // Đuôi
          [27, 33], [33, 34],
        ],
        color: const Color(0xFFFF6B6B),
      ),

      // ♉ TAURUS - Kim Ngưu (Con Bò Đực) - 45 sao
      _ZodiacConstellation(
        name: 'Taurus',
        stars: [
          // Mặt bò và chữ V (Hyades)
          _Star(x: 0.50, y: 0.52, size: 3.5), // α Tauri (Aldebaran) - mắt
          _Star(x: 0.44, y: 0.48, size: 2.4), // γ Tauri
          _Star(x: 0.48, y: 0.44, size: 2.3), // δ Tauri
          _Star(x: 0.54, y: 0.45, size: 2.2), // ε Tauri
          _Star(x: 0.58, y: 0.50, size: 2.0), // ζ Tauri
          _Star(x: 0.55, y: 0.55, size: 1.8), // θ Tauri
          _Star(x: 0.48, y: 0.58, size: 1.7), // 71 Tauri
          _Star(x: 0.42, y: 0.55, size: 1.6), // ρ Tauri
          // Sừng bắc (dài)
          _Star(x: 0.40, y: 0.42, size: 2.5), // β Tauri (Elnath)
          _Star(x: 0.35, y: 0.38, size: 2.0), // ζ Tauri 2
          _Star(x: 0.30, y: 0.35, size: 1.7), // 118 Tauri
          _Star(x: 0.25, y: 0.32, size: 1.5), // 120 Tauri
          _Star(x: 0.20, y: 0.30, size: 1.3), // 122 Tauri
          // Sừng nam
          _Star(x: 0.38, y: 0.60, size: 2.2), // ξ Tauri
          _Star(x: 0.32, y: 0.62, size: 1.9), // ο Tauri
          _Star(x: 0.28, y: 0.65, size: 1.6), // 90 Tauri
          _Star(x: 0.24, y: 0.68, size: 1.4), // 88 Tauri
          // Pleiades (7 chị em) - cụm sao nổi tiếng
          _Star(x: 0.30, y: 0.30, size: 1.8), // η Tauri (Alcyone)
          _Star(x: 0.28, y: 0.32, size: 1.6), // η Tauri 2
          _Star(x: 0.32, y: 0.28, size: 1.5), // η Tauri 3
          _Star(x: 0.29, y: 0.29, size: 1.4), // η Tauri 4
          _Star(x: 0.31, y: 0.31, size: 1.3), // η Tauri 5
          _Star(x: 0.27, y: 0.30, size: 1.2), // η Tauri 6
          _Star(x: 0.33, y: 0.29, size: 1.2), // η Tauri 7
          // Vai và thân trên
          _Star(x: 0.62, y: 0.48, size: 1.9), // λ Tauri
          _Star(x: 0.65, y: 0.52, size: 1.7), // κ Tauri
          _Star(x: 0.68, y: 0.55, size: 1.5), // υ Tauri
          _Star(x: 0.70, y: 0.58, size: 1.4), // 10 Tauri
          // Thân giữa
          _Star(x: 0.60, y: 0.60, size: 1.6), // χ Tauri
          _Star(x: 0.63, y: 0.64, size: 1.5), // φ Tauri
          _Star(x: 0.66, y: 0.67, size: 1.4), // 111 Tauri
          // Thân dưới
          _Star(x: 0.58, y: 0.68, size: 1.5), // 109 Tauri
          _Star(x: 0.62, y: 0.72, size: 1.4), // 107 Tauri
          _Star(x: 0.65, y: 0.75, size: 1.3), // 105 Tauri
          // Chân trước
          _Star(x: 0.55, y: 0.75, size: 1.4), // 99 Tauri
          _Star(x: 0.52, y: 0.78, size: 1.3), // 97 Tauri
          _Star(x: 0.50, y: 0.82, size: 1.2), // 95 Tauri
          // Chân sau
          _Star(x: 0.70, y: 0.75, size: 1.4), // 103 Tauri
          _Star(x: 0.72, y: 0.78, size: 1.3), // 101 Tauri
          _Star(x: 0.75, y: 0.82, size: 1.2), // 100 Tauri
          // Đuôi
          _Star(x: 0.75, y: 0.70, size: 1.3), // 93 Tauri
          _Star(x: 0.78, y: 0.72, size: 1.2), // 91 Tauri
          _Star(x: 0.80, y: 0.75, size: 1.1), // 89 Tauri
          // Đầu trên
          _Star(x: 0.45, y: 0.40, size: 1.5), // 104 Tauri
          _Star(x: 0.48, y: 0.38, size: 1.4), // 102 Tauri
          _Star(x: 0.52, y: 0.38, size: 1.4), // 106 Tauri
          _Star(x: 0.55, y: 0.40, size: 1.5), // 108 Tauri
          // Tai
          _Star(x: 0.42, y: 0.45, size: 1.3), // 110 Tauri
          _Star(x: 0.58, y: 0.45, size: 1.3), // 112 Tauri
          // Mũi
          _Star(x: 0.52, y: 0.55, size: 1.4), // 114 Tauri
          _Star(x: 0.54, y: 0.58, size: 1.3), // 116 Tauri
        ],
        connections: [
          // Chữ V Hyades
          [0, 1], [1, 2], [2, 3], [3, 4], [4, 0],
          [0, 5], [5, 6], [6, 7], [7, 0],
          // Sừng bắc
          [1, 8], [8, 9], [9, 10], [10, 11], [11, 12],
          // Sừng nam
          [0, 13], [13, 14], [14, 15], [15, 16],
          // Pleiades cluster
          [17, 18], [18, 19], [19, 20], [20, 21], [21, 22], [22, 17],
          [9, 17], // Nối sừng với Pleiades
          // Thân
          [4, 23], [23, 24], [24, 25], [25, 26],
          [26, 27], [27, 28], [28, 29],
          // Chân trước
          [27, 30], [30, 31], [31, 32],
          // Chân sau
          [28, 33], [33, 34], [34, 35],
          // Đuôi
          [28, 36], [36, 37], [37, 38],
          // Đầu trên
          [1, 39], [39, 40], [40, 41], [41, 3],
          // Tai
          [1, 42], [3, 43],
          // Mũi
          [0, 44], [44, 45],
        ],
        color: const Color(0xFFFFD93D),
      ),

      // ♊ GEMINI - Song Tử (Hai Anh Em) - 42 sao
      _ZodiacConstellation(
        name: 'Gemini',
        stars: [
          // Castor (người bên trái)
          _Star(x: 0.42, y: 0.25, size: 2.8), // α Geminorum (Castor) - đầu
          _Star(x: 0.40, y: 0.32, size: 2.2), // γ Geminorum (Alhena) - cổ
          _Star(x: 0.38, y: 0.40, size: 1.9), // μ Geminorum - vai
          _Star(x: 0.36, y: 0.48, size: 1.7), // η Geminorum - thân trên
          _Star(x: 0.34, y: 0.56, size: 1.6), // ζ Geminorum - thân giữa
          _Star(x: 0.32, y: 0.64, size: 1.5), // ε Geminorum - thân dưới
          _Star(x: 0.30, y: 0.72, size: 1.4), // δ Geminorum - chân
          _Star(x: 0.28, y: 0.80, size: 1.3), // 64 Geminorum - bàn chân
          // Pollux (người bên phải)
          _Star(x: 0.58, y: 0.25, size: 3.0), // β Geminorum (Pollux) - đầu
          _Star(x: 0.60, y: 0.32, size: 2.1), // δ Geminorum (Wasat) - cổ
          _Star(x: 0.62, y: 0.40, size: 1.8), // ο Geminorum - vai
          _Star(x: 0.64, y: 0.48, size: 1.6), // κ Geminorum - thân trên
          _Star(x: 0.66, y: 0.56, size: 1.5), // υ Geminorum - thân giữa
          _Star(x: 0.68, y: 0.64, size: 1.4), // ρ Geminorum - thân dưới
          _Star(x: 0.70, y: 0.72, size: 1.3), // τ Geminorum - chân
          _Star(x: 0.72, y: 0.80, size: 1.2), // 70 Geminorum - bàn chân
          // Tay trái Castor
          _Star(x: 0.35, y: 0.42, size: 1.5), // 56 Geminorum
          _Star(x: 0.32, y: 0.45, size: 1.4), // 58 Geminorum
          _Star(x: 0.30, y: 0.50, size: 1.3), // 60 Geminorum
          _Star(x: 0.28, y: 0.55, size: 1.2), // 62 Geminorum
          // Tay phải Castor
          _Star(x: 0.45, y: 0.42, size: 1.5), // 52 Geminorum
          _Star(x: 0.48, y: 0.45, size: 1.4), // 50 Geminorum
          _Star(x: 0.50, y: 0.50, size: 1.3), // 48 Geminorum
          // Tay trái Pollux
          _Star(x: 0.65, y: 0.42, size: 1.5), // 74 Geminorum
          _Star(x: 0.68, y: 0.45, size: 1.4), // 76 Geminorum
          _Star(x: 0.70, y: 0.50, size: 1.3), // 78 Geminorum
          // Tay phải Pollux
          _Star(x: 0.55, y: 0.42, size: 1.5), // 72 Geminorum
          _Star(x: 0.52, y: 0.45, size: 1.4), // 68 Geminorum
          _Star(x: 0.50, y: 0.50, size: 1.3), // 66 Geminorum
          // Kết nối giữa hai người
          _Star(x: 0.48, y: 0.30, size: 1.6), // ν Geminorum
          _Star(x: 0.50, y: 0.35, size: 1.5), // 54 Geminorum
          _Star(x: 0.52, y: 0.40, size: 1.4), // 53 Geminorum
          // Đầu Castor chi tiết
          _Star(x: 0.40, y: 0.22, size: 1.3), // 44 Geminorum
          _Star(x: 0.44, y: 0.22, size: 1.3), // 46 Geminorum
          _Star(x: 0.42, y: 0.20, size: 1.2), // 42 Geminorum
          // Đầu Pollux chi tiết
          _Star(x: 0.56, y: 0.22, size: 1.3), // 80 Geminorum
          _Star(x: 0.60, y: 0.22, size: 1.3), // 82 Geminorum
          _Star(x: 0.58, y: 0.20, size: 1.2), // 84 Geminorum
          // Vũ khí/gậy
          _Star(x: 0.25, y: 0.50, size: 1.4), // 38 Geminorum
          _Star(x: 0.22, y: 0.52, size: 1.3), // 36 Geminorum
          _Star(x: 0.75, y: 0.50, size: 1.4), // 86 Geminorum
          _Star(x: 0.78, y: 0.52, size: 1.3), // 88 Geminorum
        ],
        connections: [
          // Castor - đường chính
          [0, 1], [1, 2], [2, 3], [3, 4], [4, 5], [5, 6], [6, 7],
          // Pollux - đường chính
          [8, 9], [9, 10], [10, 11], [11, 12], [12, 13], [13, 14], [14, 15],
          // Tay Castor trái
          [2, 16], [16, 17], [17, 18], [18, 19],
          // Tay Castor phải
          [2, 20], [20, 21], [21, 22],
          // Tay Pollux trái
          [10, 23], [23, 24], [24, 25],
          // Tay Pollux phải
          [10, 26], [26, 27], [27, 28],
          // Kết nối giữa
          [0, 29], [29, 30], [30, 31], [31, 8],
          // Đầu Castor
          [0, 32], [0, 33], [32, 34], [33, 34],
          // Đầu Pollux
          [8, 35], [8, 36], [35, 37], [36, 37],
          // Vũ khí
          [3, 38], [38, 39], [11, 40], [40, 41],
        ],
        color: const Color(0xFF6BCB77),
      ),

      // ♋ CANCER - Cự Giải (Con Cua) - 38 sao
      _ZodiacConstellation(
        name: 'Cancer',
        stars: [
          // Thân cua (chữ Y ngược)
          _Star(x: 0.50, y: 0.50, size: 2.6), // β Cancri (Al Tarf)
          _Star(x: 0.45, y: 0.45, size: 2.2), // α Cancri (Acubens)
          _Star(x: 0.55, y: 0.45, size: 2.0), // δ Cancri
          _Star(x: 0.48, y: 0.55, size: 1.9), // γ Cancri
          _Star(x: 0.52, y: 0.55, size: 1.9), // ι Cancri
          // Càng trái
          _Star(x: 0.40, y: 0.42, size: 1.8), // 49 Cancri
          _Star(x: 0.35, y: 0.40, size: 1.7), // 47 Cancri
          _Star(x: 0.30, y: 0.38, size: 1.6), // 45 Cancri
          _Star(x: 0.28, y: 0.42, size: 1.5), // 43 Cancri
          _Star(x: 0.32, y: 0.45, size: 1.4), // 41 Cancri
          // Càng phải
          _Star(x: 0.60, y: 0.42, size: 1.8), // 55 Cancri
          _Star(x: 0.65, y: 0.40, size: 1.7), // 57 Cancri
          _Star(x: 0.70, y: 0.38, size: 1.6), // 59 Cancri
          _Star(x: 0.72, y: 0.42, size: 1.5), // 61 Cancri
          _Star(x: 0.68, y: 0.45, size: 1.4), // 63 Cancri
          // Beehive Cluster (M44) - trung tâm
          _Star(x: 0.50, y: 0.62, size: 1.7), // ε Cancri
          _Star(x: 0.48, y: 0.64, size: 1.5), // Beehive 2
          _Star(x: 0.52, y: 0.64, size: 1.5), // Beehive 3
          _Star(x: 0.49, y: 0.66, size: 1.4), // Beehive 4
          _Star(x: 0.51, y: 0.66, size: 1.4), // Beehive 5
          _Star(x: 0.50, y: 0.68, size: 1.3), // Beehive 6
          _Star(x: 0.48, y: 0.68, size: 1.3), // Beehive 7
          _Star(x: 0.52, y: 0.68, size: 1.3), // Beehive 8
          // Chân trái trước
          _Star(x: 0.42, y: 0.52, size: 1.6), // ζ Cancri
          _Star(x: 0.40, y: 0.56, size: 1.5), // 65 Cancri
          _Star(x: 0.38, y: 0.60, size: 1.4), // 67 Cancri
          _Star(x: 0.36, y: 0.64, size: 1.3), // 69 Cancri
          // Chân phải trước
          _Star(x: 0.58, y: 0.52, size: 1.6), // η Cancri
          _Star(x: 0.60, y: 0.56, size: 1.5), // 71 Cancri
          _Star(x: 0.62, y: 0.60, size: 1.4), // 73 Cancri
          _Star(x: 0.64, y: 0.64, size: 1.3), // 75 Cancri
          // Chân trái sau
          _Star(x: 0.45, y: 0.70, size: 1.5), // 77 Cancri
          _Star(x: 0.43, y: 0.74, size: 1.4), // 79 Cancri
          _Star(x: 0.40, y: 0.78, size: 1.3), // 81 Cancri
          // Chân phải sau
          _Star(x: 0.55, y: 0.70, size: 1.5), // 83 Cancri
          _Star(x: 0.57, y: 0.74, size: 1.4), // 85 Cancri
          _Star(x: 0.60, y: 0.78, size: 1.3), // 87 Cancri
          // Mai cua trên
          _Star(x: 0.48, y: 0.48, size: 1.4), // 35 Cancri
          _Star(x: 0.52, y: 0.48, size: 1.4), // 37 Cancri
          _Star(x: 0.50, y: 0.45, size: 1.3), // 39 Cancri
          // Mắt
          _Star(x: 0.47, y: 0.48, size: 1.3), // 33 Cancri
          _Star(x: 0.53, y: 0.48, size: 1.3), // 31 Cancri
        ],
        connections: [
          // Thân chính
          [0, 1], [0, 2], [0, 3], [0, 4],
          [3, 4], [1, 3], [2, 4],
          // Càng trái
          [1, 5], [5, 6], [6, 7], [7, 8], [8, 9], [9, 1],
          // Càng phải
          [2, 10], [10, 11], [11, 12], [12, 13], [13, 14], [14, 2],
          // Beehive Cluster
          [3, 15], [4, 15],
          [15, 16],
          [16, 17],
          [17, 18],
          [18, 19],
          [19, 20],
          [20, 21],
          [21, 22],
          [22, 15],
          // Chân trái trước
          [1, 23], [23, 24], [24, 25], [25, 26],
          // Chân phải trước
          [2, 27], [27, 28], [28, 29], [29, 30],
          // Chân trái sau
          [3, 31], [31, 32], [32, 33],
          // Chân phải sau
          [4, 34], [34, 35], [35, 36],
          // Mai cua
          [1, 37], [37, 38], [38, 2], [37, 39], [38, 39],
          // Mắt
          [39, 40], [39, 41],
        ],
        color: const Color(0xFF4D96FF),
      ),

      // ♌ LEO - Sư Tử (Con Sư Tử) - 45 sao
      _ZodiacConstellation(
        name: 'Leo',
        stars: [
          // Sickle (dấu hỏi ngược) - đầu và bờm
          _Star(x: 0.50, y: 0.38, size: 3.2), // α Leonis (Regulus) - tim
          _Star(x: 0.48, y: 0.45, size: 2.6), // γ Leonis (Algieba) - trán
          _Star(x: 0.46, y: 0.52, size: 2.3), // ζ Leonis (Adhafera) - bờm
          _Star(x: 0.44, y: 0.58, size: 2.0), // μ Leonis (Rasalas) - đỉnh đầu
          _Star(x: 0.43, y: 0.64, size: 1.9), // ε Leonis - tai trái
          _Star(x: 0.45, y: 0.68, size: 1.7), // 31 Leonis
          _Star(x: 0.47, y: 0.72, size: 1.6), // 33 Leonis
          // Mặt sư tử
          _Star(x: 0.52, y: 0.42, size: 1.8), // η Leonis
          _Star(x: 0.54, y: 0.45, size: 1.7), // 35 Leonis
          _Star(x: 0.50, y: 0.48, size: 1.6), // 37 Leonis
          _Star(x: 0.48, y: 0.50, size: 1.5), // 39 Leonis
          // Bờm sư tử (phía sau)
          _Star(x: 0.42, y: 0.60, size: 1.7), // 41 Leonis
          _Star(x: 0.40, y: 0.64, size: 1.6), // 43 Leonis
          _Star(x: 0.38, y: 0.68, size: 1.5), // 45 Leonis
          _Star(x: 0.36, y: 0.72, size: 1.4), // 47 Leonis
          _Star(x: 0.40, y: 0.56, size: 1.5), // 49 Leonis
          _Star(x: 0.38, y: 0.60, size: 1.4), // 51 Leonis
          // Đuôi
          _Star(x: 0.58, y: 0.40, size: 2.4), // β Leonis (Denebola)
          _Star(x: 0.62, y: 0.42, size: 1.8), // θ Leonis
          _Star(x: 0.66, y: 0.44, size: 1.6), // 53 Leonis
          _Star(x: 0.70, y: 0.46, size: 1.5), // 55 Leonis
          // Thân
          _Star(x: 0.55, y: 0.48, size: 1.9), // 57 Leonis
          _Star(x: 0.58, y: 0.52, size: 1.8), // 59 Leonis
          _Star(x: 0.60, y: 0.56, size: 1.7), // 61 Leonis
          _Star(x: 0.62, y: 0.60, size: 1.6), // 63 Leonis
          _Star(x: 0.64, y: 0.64, size: 1.5), // 65 Leonis
          // Chân trước
          _Star(x: 0.52, y: 0.55, size: 1.7), // 67 Leonis
          _Star(x: 0.50, y: 0.60, size: 1.6), // 69 Leonis
          _Star(x: 0.48, y: 0.65, size: 1.5), // 71 Leonis
          _Star(x: 0.46, y: 0.70, size: 1.4), // 73 Leonis
          // Chân sau
          _Star(x: 0.65, y: 0.55, size: 1.7), // 75 Leonis
          _Star(x: 0.68, y: 0.60, size: 1.6), // 77 Leonis
          _Star(x: 0.70, y: 0.65, size: 1.5), // 79 Leonis
          _Star(x: 0.72, y: 0.70, size: 1.4), // 81 Leonis
          // Ngực
          _Star(x: 0.53, y: 0.50, size: 1.6), // 83 Leonis
          _Star(x: 0.55, y: 0.54, size: 1.5), // 85 Leonis
          _Star(x: 0.57, y: 0.58, size: 1.4), // 87 Leonis
          // Bụng
          _Star(x: 0.60, y: 0.66, size: 1.5), // 89 Leonis
          _Star(x: 0.62, y: 0.70, size: 1.4), // 91 Leonis
          _Star(x: 0.64, y: 0.74, size: 1.3), // 93 Leonis
          // Tai phải
          _Star(x: 0.54, y: 0.35, size: 1.5), // 95 Leonis
          _Star(x: 0.56, y: 0.33, size: 1.4), // 97 Leonis
          // Mũi
          _Star(x: 0.51, y: 0.40, size: 1.4), // 99 Leonis
          _Star(x: 0.52, y: 0.43, size: 1.3), // 101 Leonis
          // Râu
          _Star(x: 0.49, y: 0.52, size: 1.3), // 103 Leonis
          _Star(x: 0.53, y: 0.52, size: 1.3), // 105 Leonis
        ],
        connections: [
          // Sickle
          [0, 1], [1, 2], [2, 3], [3, 4], [4, 5], [5, 6],
          // Mặt
          [0, 7], [7, 8], [8, 9], [9, 10], [10, 1],
          // Bờm
          [3, 11], [11, 12], [12, 13], [13, 14],
          [2, 15], [15, 16], [16, 12],
          // Đuôi
          [0, 17], [17, 18], [18, 19], [19, 20],
          // Thân
          [17, 21], [21, 22], [22, 23], [23, 24], [24, 25],
          // Chân trước
          [21, 26], [26, 27], [27, 28], [28, 29],
          // Chân sau
          [23, 30], [30, 31], [31, 32], [32, 33],
          // Ngực
          [21, 34], [34, 35], [35, 36],
          // Bụng
          [24, 37], [37, 38], [38, 39],
          // Tai
          [1, 40], [40, 41],
          // Mũi
          [0, 42], [42, 43],
          // Râu
          [9, 44], [9, 45],
        ],
        color: const Color(0xFFFF9F45),
      ),

      // ♍ VIRGO - Xử Nữ (Trinh Nữ) - 50 sao
      _ZodiacConstellation(
        name: 'Virgo',
        stars: [
          // Đầu
          _Star(x: 0.50, y: 0.28, size: 2.2), // η Virginis (Zaniah)
          _Star(x: 0.48, y: 0.25, size: 1.7), // τ Virginis
          _Star(x: 0.52, y: 0.25, size: 1.7), // χ Virginis
          _Star(x: 0.49, y: 0.22, size: 1.5), // 84 Virginis
          _Star(x: 0.51, y: 0.22, size: 1.5), // 86 Virginis
          // Tóc
          _Star(x: 0.46, y: 0.24, size: 1.4), // 82 Virginis
          _Star(x: 0.54, y: 0.24, size: 1.4), // 88 Virginis
          _Star(x: 0.45, y: 0.22, size: 1.3), // 80 Virginis
          _Star(x: 0.55, y: 0.22, size: 1.3), // 90 Virginis
          // Cổ
          _Star(x: 0.50, y: 0.32, size: 1.8), // 78 Virginis
          _Star(x: 0.49, y: 0.35, size: 1.6), // 76 Virginis
          // Vai
          _Star(x: 0.45, y: 0.38, size: 2.0), // β Virginis (Zavijava)
          _Star(x: 0.55, y: 0.38, size: 2.1), // ε Virginis (Vindemiatrix)
          _Star(x: 0.43, y: 0.35, size: 1.5), // 74 Virginis
          _Star(x: 0.57, y: 0.35, size: 1.5), // 72 Virginis
          // Thân trên
          _Star(x: 0.50, y: 0.42, size: 1.9), // γ Virginis (Porrima)
          _Star(x: 0.48, y: 0.45, size: 1.7), // 70 Virginis
          _Star(x: 0.52, y: 0.45, size: 1.7), // 68 Virginis
          // Thân giữa
          _Star(x: 0.50, y: 0.50, size: 1.8), // 66 Virginis
          _Star(x: 0.48, y: 0.53, size: 1.6), // 64 Virginis
          _Star(x: 0.52, y: 0.53, size: 1.6), // 62 Virginis
          // Thân dưới
          _Star(x: 0.50, y: 0.58, size: 1.7), // 60 Virginis
          _Star(x: 0.48, y: 0.61, size: 1.5), // 58 Virginis
          _Star(x: 0.52, y: 0.61, size: 1.5), // 56 Virginis
          // Hông
          _Star(x: 0.45, y: 0.64, size: 1.6), // 54 Virginis
          _Star(x: 0.55, y: 0.64, size: 1.6), // 52 Virginis
          // Chân
          _Star(x: 0.48, y: 0.68, size: 1.5), // 50 Virginis
          _Star(x: 0.52, y: 0.68, size: 1.5), // 48 Virginis
          _Star(x: 0.46, y: 0.72, size: 1.4), // 46 Virginis
          _Star(x: 0.54, y: 0.72, size: 1.4), // 44 Virginis
          _Star(x: 0.45, y: 0.76, size: 1.3), // 42 Virginis
          _Star(x: 0.55, y: 0.76, size: 1.3), // 40 Virginis
          // Bàn chân
          _Star(x: 0.47, y: 0.80, size: 1.2), // 38 Virginis
          _Star(x: 0.53, y: 0.80, size: 1.2), // 36 Virginis
          // Spica (bông lúa) - tay phải cầm
          _Star(x: 0.50, y: 0.72, size: 3.2), // α Virginis (Spica)
          _Star(x: 0.52, y: 0.75, size: 1.8), // 34 Virginis
          _Star(x: 0.48, y: 0.75, size: 1.7), // 32 Virginis
          // Tay trái
          _Star(x: 0.42, y: 0.42, size: 1.7), // μ Virginis
          _Star(x: 0.40, y: 0.45, size: 1.6), // σ Virginis
          _Star(x: 0.38, y: 0.48, size: 1.5), // ρ Virginis
          _Star(x: 0.36, y: 0.52, size: 1.4), // π Virginis
          _Star(x: 0.34, y: 0.56, size: 1.3), // 30 Virginis
          // Tay phải
          _Star(x: 0.58, y: 0.42, size: 1.7), // ζ Virginis (Heze)
          _Star(x: 0.60, y: 0.45, size: 1.6), // ι Virginis
          _Star(x: 0.62, y: 0.48, size: 1.5), // θ Virginis
          _Star(x: 0.64, y: 0.52, size: 1.4), // 28 Virginis
          _Star(x: 0.66, y: 0.56, size: 1.3), // 26 Virginis
          // Váy/áo
          _Star(x: 0.47, y: 0.65, size: 1.4), // 24 Virginis
          _Star(x: 0.53, y: 0.65, size: 1.4), // 22 Virginis
          _Star(x: 0.45, y: 0.68, size: 1.3), // 20 Virginis
          _Star(x: 0.55, y: 0.68, size: 1.3), // 18 Virginis
          _Star(x: 0.44, y: 0.72, size: 1.2), // 16 Virginis
          _Star(x: 0.56, y: 0.72, size: 1.2), // 14 Virginis
          // Vòng/cổ
          _Star(x: 0.49, y: 0.36, size: 1.3), // 12 Virginis
          _Star(x: 0.51, y: 0.36, size: 1.3), // 10 Virginis
        ],
        connections: [
          // Đầu
          [0, 1], [0, 2], [1, 3], [2, 4], [3, 4],
          // Tóc
          [1, 5], [5, 7], [2, 6], [6, 8],
          // Cổ
          [0, 9], [9, 10],
          // Vai
          [10, 11], [10, 12], [11, 13], [12, 14],
          // Thân
          [10, 15], [15, 16], [16, 17],
          [17, 18], [18, 19], [19, 20],
          [20, 21], [21, 22], [22, 23],
          // Hông
          [21, 24], [21, 25],
          // Chân
          [24, 26], [25, 27], [26, 28], [27, 29], [28, 30], [29, 31],
          // Bàn chân
          [30, 32], [31, 33],
          // Spica
          [25, 34], [34, 35], [34, 36], [35, 36],
          // Tay trái
          [11, 37], [37, 38], [38, 39], [39, 40], [40, 41],
          // Tay phải
          [12, 42], [42, 43], [43, 44], [44, 45], [45, 46],
          // Váy
          [24, 47], [47, 49], [25, 48], [48, 50],
          [47, 51], [48, 52],
          // Vòng
          [9, 53], [53, 54], [54, 10],
        ],
        color: const Color(0xFF9B5DE5),
      ),

      // ♎ LIBRA - Thiên Bình (Cái Cân) - 40 sao
      _ZodiacConstellation(
        name: 'Libra',
        stars: [
          // Khung cân chính
          _Star(x: 0.42, y: 0.50, size: 2.6), // α Librae (Zubenelgenubi)
          _Star(x: 0.58, y: 0.48, size: 2.8), // β Librae (Zubeneschamali)
          _Star(x: 0.50, y: 0.58, size: 2.2), // γ Librae (Zubenelakrab)
          _Star(x: 0.50, y: 0.38, size: 2.0), // σ Librae (Brachium)
          // Đĩa cân trái
          _Star(x: 0.35, y: 0.52, size: 1.8), // ι Librae
          _Star(x: 0.32, y: 0.55, size: 1.7), // κ Librae
          _Star(x: 0.30, y: 0.58, size: 1.6), // λ Librae
          _Star(x: 0.32, y: 0.62, size: 1.5), // υ Librae
          _Star(x: 0.35, y: 0.64, size: 1.6), // 22 Librae
          _Star(x: 0.38, y: 0.62, size: 1.5), // 24 Librae
          _Star(x: 0.40, y: 0.58, size: 1.4), // 26 Librae
          // Đĩa cân phải
          _Star(x: 0.65, y: 0.52, size: 1.8), // θ Librae
          _Star(x: 0.68, y: 0.55, size: 1.7), // φ Librae
          _Star(x: 0.70, y: 0.58, size: 1.6), // 49 Librae
          _Star(x: 0.68, y: 0.62, size: 1.5), // 47 Librae
          _Star(x: 0.65, y: 0.64, size: 1.6), // 45 Librae
          _Star(x: 0.62, y: 0.62, size: 1.5), // 43 Librae
          _Star(x: 0.60, y: 0.58, size: 1.4), // 41 Librae
          // Dây treo cân
          _Star(x: 0.50, y: 0.32, size: 1.7), // τ Librae
          _Star(x: 0.50, y: 0.28, size: 1.6), // 20 Librae
          _Star(x: 0.50, y: 0.24, size: 1.5), // 18 Librae
          _Star(x: 0.48, y: 0.22, size: 1.4), // 16 Librae
          _Star(x: 0.52, y: 0.22, size: 1.4), // 14 Librae
          // Giá đỡ
          _Star(x: 0.45, y: 0.35, size: 1.6), // 17 Librae
          _Star(x: 0.55, y: 0.35, size: 1.6), // 19 Librae
          _Star(x: 0.42, y: 0.32, size: 1.5), // 15 Librae
          _Star(x: 0.58, y: 0.32, size: 1.5), // 21 Librae
          // Chân đế
          _Star(x: 0.48, y: 0.68, size: 1.7), // 23 Librae
          _Star(x: 0.52, y: 0.68, size: 1.7), // 25 Librae
          _Star(x: 0.45, y: 0.72, size: 1.5), // 27 Librae
          _Star(x: 0.55, y: 0.72, size: 1.5), // 29 Librae
          _Star(x: 0.50, y: 0.75, size: 1.6), // 31 Librae
          _Star(x: 0.48, y: 0.78, size: 1.4), // 33 Librae
          _Star(x: 0.52, y: 0.78, size: 1.4), // 35 Librae
          // Dây nối đĩa
          _Star(x: 0.40, y: 0.55, size: 1.3), // 37 Librae
          _Star(x: 0.60, y: 0.55, size: 1.3), // 39 Librae
          _Star(x: 0.42, y: 0.60, size: 1.2), // 40 Librae
          _Star(x: 0.58, y: 0.60, size: 1.2), // 42 Librae
          // Điểm trang trí
          _Star(x: 0.38, y: 0.48, size: 1.3), // 44 Librae
          _Star(x: 0.62, y: 0.48, size: 1.3), // 46 Librae
          _Star(x: 0.50, y: 0.52, size: 1.4), // 48 Librae
        ],
        connections: [
          // Khung chính
          [0, 1], [0, 2], [1, 2], [0, 3], [1, 3], [2, 3],
          // Đĩa trái
          [0, 4], [4, 5], [5, 6], [6, 7], [7, 8], [8, 9], [9, 10], [10, 0],
          [4, 36], [36, 39], [39, 7],
          // Đĩa phải
          [1, 11],
          [11, 12],
          [12, 13],
          [13, 14],
          [14, 15],
          [15, 16],
          [16, 17],
          [17, 1],
          [11, 37], [37, 40], [40, 14],
          // Dây treo
          [3, 18], [18, 19], [19, 20], [20, 21], [20, 22], [21, 22],
          // Giá đỡ
          [3, 23], [23, 25], [3, 24], [24, 26],
          [23, 18], [24, 18],
          // Chân đế
          [2, 27], [27, 28], [28, 29], [29, 30], [30, 31], [31, 32], [32, 30],
          [27, 2], [28, 2],
          // Dây nối
          [5, 36], [12, 37],
          // Trang trí
          [4, 41], [11, 42], [2, 43],
        ],
        color: const Color(0xFF00C2BA),
      ),

      // ♏ SCORPIO - Bọ Cạp (Con Bọ Cạp) - 48 sao
      _ZodiacConstellation(
        name: 'Scorpio',
        stars: [
          // Đầu bọ cạp
          _Star(x: 0.45, y: 0.48, size: 2.2), // β Scorpii (Graffias)
          _Star(x: 0.50, y: 0.46, size: 2.3), // δ Scorpii (Dschubba)
          _Star(x: 0.54, y: 0.48, size: 2.0), // π Scorpii
          _Star(x: 0.48, y: 0.44, size: 1.7), // 6 Scorpii
          _Star(x: 0.52, y: 0.44, size: 1.7), // 8 Scorpii
          // Mắt
          _Star(x: 0.49, y: 0.46, size: 1.5), // 4 Scorpii
          _Star(x: 0.51, y: 0.46, size: 1.5), // 2 Scorpii
          // Càng trái
          _Star(x: 0.40, y: 0.50, size: 2.0), // σ Scorpii
          _Star(x: 0.36, y: 0.52, size: 1.8), // τ Scorpii
          _Star(x: 0.32, y: 0.54, size: 1.6), // ζ Scorpii
          _Star(x: 0.28, y: 0.56, size: 1.5), // η Scorpii
          _Star(x: 0.30, y: 0.52, size: 1.4), // 12 Scorpii
          _Star(x: 0.34, y: 0.50, size: 1.3), // 14 Scorpii
          // Càng phải
          _Star(x: 0.58, y: 0.50, size: 1.8), // 16 Scorpii
          _Star(x: 0.62, y: 0.52, size: 1.7), // μ Scorpii
          _Star(x: 0.66, y: 0.54, size: 1.5), // 18 Scorpii
          _Star(x: 0.64, y: 0.50, size: 1.4), // 20 Scorpii
          // Tim (Antares - sáng nhất)
          _Star(x: 0.48, y: 0.55, size: 3.5), // α Scorpii (Antares)
          _Star(x: 0.46, y: 0.58, size: 1.6), // 22 Scorpii
          _Star(x: 0.50, y: 0.58, size: 1.6), // 24 Scorpii
          // Thân đoạn 1
          _Star(x: 0.52, y: 0.60, size: 2.0), // ρ Scorpii
          _Star(x: 0.55, y: 0.62, size: 1.8), // κ Scorpii
          _Star(x: 0.58, y: 0.64, size: 1.7), // 26 Scorpii
          // Thân đoạn 2
          _Star(x: 0.60, y: 0.66, size: 1.9), // ε Scorpii
          _Star(x: 0.63, y: 0.68, size: 1.7), // 28 Scorpii
          _Star(x: 0.66, y: 0.70, size: 1.6), // 30 Scorpii
          // Đuôi đoạn 1
          _Star(x: 0.68, y: 0.72, size: 2.0), // 32 Scorpii
          _Star(x: 0.70, y: 0.75, size: 1.8), // 34 Scorpii
          // Đuôi đoạn 2 (ngòi độc)
          _Star(x: 0.72, y: 0.78, size: 2.4), // λ Scorpii (Shaula)
          _Star(x: 0.70, y: 0.80, size: 2.2), // υ Scorpii (Lesath)
          _Star(x: 0.74, y: 0.78, size: 1.6), // 36 Scorpii
          _Star(x: 0.72, y: 0.82, size: 1.5), // 38 Scorpii
          // Chân trái
          _Star(x: 0.45, y: 0.62, size: 1.5), // 40 Scorpii
          _Star(x: 0.43, y: 0.65, size: 1.4), // 42 Scorpii
          _Star(x: 0.40, y: 0.68, size: 1.3), // 44 Scorpii
          // Chân phải
          _Star(x: 0.55, y: 0.68, size: 1.5), // 46 Scorpii
          _Star(x: 0.58, y: 0.70, size: 1.4), // 48 Scorpii
          _Star(x: 0.60, y: 0.72, size: 1.3), // 50 Scorpii
          // Lưng
          _Star(x: 0.50, y: 0.52, size: 1.6), // 52 Scorpii
          _Star(x: 0.53, y: 0.54, size: 1.5), // 54 Scorpii
          _Star(x: 0.56, y: 0.56, size: 1.4), // 56 Scorpii
          // Đốt đuôi
          _Star(x: 0.68, y: 0.76, size: 1.4), // 58 Scorpii
          _Star(x: 0.71, y: 0.76, size: 1.3), // 60 Scorpii
          // Ngòi độc chi tiết
          _Star(x: 0.73, y: 0.79, size: 1.2), // 62 Scorpii
          _Star(x: 0.75, y: 0.80, size: 1.1), // 64 Scorpii
        ],
        connections: [
          // Đầu
          [0, 1], [1, 2], [0, 3], [1, 4], [3, 4],
          // Mắt
          [3, 5], [4, 6],
          // Càng trái
          [0, 7], [7, 8], [8, 9], [9, 10], [10, 11], [11, 7],
          // Càng phải
          [2, 12], [12, 13], [13, 14], [14, 15], [15, 12],
          // Tim
          [1, 16], [16, 17], [16, 18], [17, 18],
          // Thân
          [16, 19], [19, 20], [20, 21],
          [21, 22], [22, 23], [23, 24],
          // Đuôi
          [24, 25], [25, 26], [26, 27], [27, 28],
          // Ngòi độc
          [27, 29], [29, 30], [30, 31], [31, 29],
          // Chân trái
          [16, 32], [32, 33], [33, 34],
          // Chân phải
          [19, 35], [35, 36], [36, 37],
          // Lưng
          [16, 38], [38, 39], [39, 40],
          // Đốt đuôi
          [25, 41], [41, 42], [42, 26],
          // Ngòi chi tiết
          [29, 43], [43, 44],
        ],
        color: const Color(0xFFFF4B4B),
      ),

      // ♐ SAGITTARIUS - Nhân Mã (Người Cung Tên) - 50 sao
      _ZodiacConstellation(
        name: 'Sagittarius',
        stars: [
          // Ấm trà (Teapot) - thân
          _Star(x: 0.48, y: 0.50, size: 2.4), // λ Sgr (Kaus Borealis) - nắp
          _Star(x: 0.52, y: 0.52, size: 2.5), // ε Sgr (Kaus Media)
          _Star(x: 0.56, y: 0.56, size: 2.8), // σ Sgr (Kaus Australis) - đáy
          _Star(x: 0.48, y: 0.56, size: 2.2), // ζ Sgr (Ascella)
          _Star(x: 0.54, y: 0.58, size: 2.0), // τ Sgr
          _Star(x: 0.50, y: 0.54, size: 1.8), // 34 Sgr
          // Vòi ấm
          _Star(x: 0.42, y: 0.52, size: 2.0), // γ Sgr (Alnasl)
          _Star(x: 0.40, y: 0.54, size: 1.8), // χ Sgr
          _Star(x: 0.38, y: 0.56, size: 1.7), // 40 Sgr
          _Star(x: 0.36, y: 0.58, size: 1.6), // 42 Sgr
          // Tay cầm
          _Star(x: 0.60, y: 0.54, size: 1.9), // φ Sgr
          _Star(x: 0.62, y: 0.56, size: 1.8), // 44 Sgr
          _Star(x: 0.64, y: 0.58, size: 1.7), // 46 Sgr
          _Star(x: 0.62, y: 0.60, size: 1.6), // 48 Sgr
          // Đầu Centaur
          _Star(x: 0.50, y: 0.42, size: 2.0), // μ Sgr
          _Star(x: 0.48, y: 0.38, size: 1.8), // 50 Sgr
          _Star(x: 0.52, y: 0.38, size: 1.8), // 52 Sgr
          _Star(x: 0.50, y: 0.35, size: 1.6), // 54 Sgr
          _Star(x: 0.49, y: 0.32, size: 1.5), // 56 Sgr
          _Star(x: 0.51, y: 0.32, size: 1.5), // 58 Sgr
          // Mặt
          _Star(x: 0.49, y: 0.40, size: 1.4), // 60 Sgr
          _Star(x: 0.51, y: 0.40, size: 1.4), // 62 Sgr
          // Cổ
          _Star(x: 0.50, y: 0.45, size: 1.6), // 64 Sgr
          // Vai
          _Star(x: 0.46, y: 0.46, size: 1.7), // 66 Sgr
          _Star(x: 0.54, y: 0.46, size: 1.7), // 68 Sgr
          // Thân trên
          _Star(x: 0.48, y: 0.48, size: 1.6), // 70 Sgr
          _Star(x: 0.52, y: 0.48, size: 1.6), // 72 Sgr
          // Cung tên
          _Star(x: 0.58, y: 0.48, size: 1.9), // δ Sgr
          _Star(x: 0.62, y: 0.46, size: 1.8), // η Sgr
          _Star(x: 0.66, y: 0.48, size: 1.7), // ξ Sgr
          _Star(x: 0.64, y: 0.50, size: 1.6), // 74 Sgr
          // Mũi tên
          _Star(x: 0.60, y: 0.44, size: 1.5), // 76 Sgr
          _Star(x: 0.63, y: 0.42, size: 1.4), // 78 Sgr
          _Star(x: 0.66, y: 0.44, size: 1.3), // 80 Sgr
          // Thân ngựa
          _Star(x: 0.55, y: 0.62, size: 1.8), // ο Sgr
          _Star(x: 0.58, y: 0.65, size: 1.7), // 82 Sgr
          _Star(x: 0.60, y: 0.68, size: 1.6), // 84 Sgr
          _Star(x: 0.62, y: 0.70, size: 1.5), // 86 Sgr
          // Chân trước
          _Star(x: 0.52, y: 0.65, size: 1.6), // 88 Sgr
          _Star(x: 0.50, y: 0.68, size: 1.5), // 90 Sgr
          _Star(x: 0.48, y: 0.72, size: 1.4), // 92 Sgr
          _Star(x: 0.46, y: 0.76, size: 1.3), // 94 Sgr
          // Chân sau
          _Star(x: 0.64, y: 0.72, size: 1.6), // 96 Sgr
          _Star(x: 0.66, y: 0.75, size: 1.5), // 98 Sgr
          _Star(x: 0.68, y: 0.78, size: 1.4), // 100 Sgr
          _Star(x: 0.70, y: 0.82, size: 1.3), // 102 Sgr
          // Đuôi ngựa
          _Star(x: 0.70, y: 0.68, size: 1.5), // 104 Sgr
          _Star(x: 0.72, y: 0.70, size: 1.4), // 106 Sgr
          _Star(x: 0.74, y: 0.72, size: 1.3), // 108 Sgr
          // Bờm
          _Star(x: 0.48, y: 0.35, size: 1.4), // 110 Sgr
          _Star(x: 0.52, y: 0.35, size: 1.4), // 112 Sgr
          _Star(x: 0.50, y: 0.30, size: 1.3), // 114 Sgr
          // Tai
          _Star(x: 0.47, y: 0.36, size: 1.2), // 116 Sgr
          _Star(x: 0.53, y: 0.36, size: 1.2), // 118 Sgr
        ],
        connections: [
          // Ấm trà
          [0, 1], [1, 2], [2, 3], [3, 0],
          [0, 4], [4, 2], [3, 4],
          [0, 5], [5, 1],
          // Vòi
          [5, 6], [6, 7], [7, 8], [8, 9],
          [3, 6],
          // Tay cầm
          [1, 10], [10, 11], [11, 12], [12, 13],
          [13, 2],
          // Đầu
          [0, 14], [14, 15], [14, 16], [15, 16],
          [16, 17], [17, 18], [18, 14],
          // Mặt
          [14, 19], [14, 20], [19, 20],
          // Cổ
          [14, 21], [21, 0],
          // Vai
          [21, 22], [21, 23],
          // Thân
          [21, 24], [24, 25], [25, 1],
          // Cung
          [25, 26], [26, 27], [27, 28], [28, 26],
          // Mũi tên
          [26, 29], [29, 30], [30, 27],
          // Thân ngựa
          [2, 31], [31, 32], [32, 33], [33, 34],
          // Chân trước
          [31, 35], [35, 36], [36, 37], [37, 38],
          // Chân sau
          [33, 39], [39, 40], [40, 41], [41, 42],
          // Đuôi
          [33, 43], [43, 44], [44, 45],
          // Bờm
          [17, 46], [17, 47], [46, 48], [47, 48],
          // Tai
          [15, 49], [16, 50],
        ],
        color: const Color(0xFF00A8FF),
      ),

      // ♑ CAPRICORN - Ma Kết (Dê Biển) - 42 sao
      _ZodiacConstellation(
        name: 'Capricorn',
        stars: [
          // Đầu dê
          _Star(x: 0.45, y: 0.45, size: 2.4), // α² Cap (Algedi)
          _Star(x: 0.50, y: 0.43, size: 2.6), // β Cap (Dabih) - sáng nhất
          _Star(x: 0.48, y: 0.40, size: 1.8), // 27 Cap
          _Star(x: 0.52, y: 0.40, size: 1.8), // 29 Cap
          _Star(x: 0.50, y: 0.38, size: 1.6), // 31 Cap
          // Sừng
          _Star(x: 0.42, y: 0.42, size: 1.9), // 33 Cap
          _Star(x: 0.40, y: 0.40, size: 1.7), // 35 Cap
          _Star(x: 0.38, y: 0.42, size: 1.6), // 37 Cap
          _Star(x: 0.36, y: 0.44, size: 1.5), // 39 Cap
          _Star(x: 0.55, y: 0.40, size: 1.9), // ν Cap
          _Star(x: 0.58, y: 0.38, size: 1.7), // ρ Cap
          _Star(x: 0.60, y: 0.40, size: 1.6), // 41 Cap
          _Star(x: 0.62, y: 0.42, size: 1.5), // 43 Cap
          // Tai
          _Star(x: 0.44, y: 0.38, size: 1.4), // 45 Cap
          _Star(x: 0.56, y: 0.38, size: 1.4), // 47 Cap
          // Mắt
          _Star(x: 0.47, y: 0.43, size: 1.3), // 49 Cap
          _Star(x: 0.53, y: 0.43, size: 1.3), // 51 Cap
          // Mũi
          _Star(x: 0.50, y: 0.45, size: 1.4), // 53 Cap
          // Cổ
          _Star(x: 0.48, y: 0.48, size: 1.7), // θ Cap
          _Star(x: 0.52, y: 0.48, size: 1.7), // 55 Cap
          // Thân trên
          _Star(x: 0.50, y: 0.52, size: 1.9), // 57 Cap
          _Star(x: 0.48, y: 0.55, size: 1.7), // 59 Cap
          _Star(x: 0.52, y: 0.55, size: 1.7), // 61 Cap
          // Thân giữa
          _Star(x: 0.50, y: 0.58, size: 1.8), // δ Cap
          _Star(x: 0.48, y: 0.60, size: 1.6), // 63 Cap
          _Star(x: 0.52, y: 0.60, size: 1.6), // 65 Cap
          // Thân dưới (chuyển thành cá)
          _Star(x: 0.50, y: 0.64, size: 1.9), // ω Cap
          _Star(x: 0.52, y: 0.67, size: 1.8), // 67 Cap
          _Star(x: 0.55, y: 0.70, size: 1.9), // 69 Cap
          // Đuôi cá
          _Star(x: 0.58, y: 0.73, size: 2.2), // ε Cap (Deneb Algedi)
          _Star(x: 0.60, y: 0.76, size: 2.0), // 71 Cap
          _Star(x: 0.62, y: 0.78, size: 1.8), // 73 Cap
          _Star(x: 0.60, y: 0.80, size: 1.7), // 75 Cap
          _Star(x: 0.58, y: 0.78, size: 1.6), // 77 Cap
          // Vây cá trên
          _Star(x: 0.55, y: 0.72, size: 1.5), // 79 Cap
          _Star(x: 0.57, y: 0.70, size: 1.4), // 81 Cap
          _Star(x: 0.59, y: 0.72, size: 1.3), // 83 Cap
          // Vây cá dưới
          _Star(x: 0.55, y: 0.76, size: 1.5), // 85 Cap
          _Star(x: 0.57, y: 0.78, size: 1.4), // 87 Cap
          _Star(x: 0.59, y: 0.76, size: 1.3), // 89 Cap
          // Chân trước
          _Star(x: 0.45, y: 0.58, size: 1.5), // ζ Cap
          _Star(x: 0.43, y: 0.62, size: 1.4), // 91 Cap
          _Star(x: 0.40, y: 0.65, size: 1.3), // 93 Cap
          // Chân sau
          _Star(x: 0.55, y: 0.58, size: 1.5), // ψ Cap
          _Star(x: 0.57, y: 0.62, size: 1.4), // 95 Cap
          _Star(x: 0.60, y: 0.65, size: 1.3), // 97 Cap
        ],
        connections: [
          // Đầu
          [0, 1], [0, 2], [1, 3], [2, 4], [3, 4],
          // Sừng trái
          [0, 5], [5, 6], [6, 7], [7, 8],
          // Sừng phải
          [1, 9], [9, 10], [10, 11], [11, 12],
          // Tai
          [2, 13], [3, 14],
          // Mắt
          [0, 15], [1, 16],
          // Mũi
          [0, 17], [1, 17],
          // Cổ
          [0, 18], [1, 18], [18, 19],
          // Thân
          [18, 20], [20, 21], [20, 22],
          [21, 23], [23, 24], [23, 25],
          [24, 26], [26, 27], [27, 28],
          // Đuôi cá
          [28, 29], [29, 30], [30, 31], [31, 32], [32, 30],
          // Vây trên
          [27, 33], [33, 34], [34, 35], [35, 29],
          // Vây dưới
          [29, 36], [36, 37], [37, 38], [38, 31],
          // Chân trước
          [21, 39], [39, 40], [40, 41],
          // Chân sau
          [25, 42], [42, 43], [43, 44],
        ],
        color: const Color(0xFF6A5495),
      ),

      // ♒ AQUARIUS - Bảo Bình (Người Mang Nước) - 48 sao
      _ZodiacConstellation(
        name: 'Aquarius',
        stars: [
          // Đầu
          _Star(x: 0.50, y: 0.32, size: 2.2), // α Aqr (Sadalmelik)
          _Star(x: 0.48, y: 0.28, size: 1.7), // 91 Aqr
          _Star(x: 0.52, y: 0.28, size: 1.7), // 98 Aqr
          _Star(x: 0.50, y: 0.25, size: 1.5), // 101 Aqr
          _Star(x: 0.49, y: 0.30, size: 1.4), // 103 Aqr
          _Star(x: 0.51, y: 0.30, size: 1.4), // 105 Aqr
          // Tóc
          _Star(x: 0.46, y: 0.29, size: 1.3), // 107 Aqr
          _Star(x: 0.54, y: 0.29, size: 1.3), // 109 Aqr
          _Star(x: 0.45, y: 0.27, size: 1.2), // 111 Aqr
          _Star(x: 0.55, y: 0.27, size: 1.2), // 113 Aqr
          // Cổ
          _Star(x: 0.50, y: 0.36, size: 1.8), // 115 Aqr
          // Vai
          _Star(x: 0.46, y: 0.40, size: 2.4), // β Aqr (Sadalsuud) - sáng nhất
          _Star(x: 0.54, y: 0.40, size: 2.2), // γ Aqr (Sadachbia)
          _Star(x: 0.44, y: 0.38, size: 1.6), // 117 Aqr
          _Star(x: 0.56, y: 0.38, size: 1.6), // 119 Aqr
          // Thân trên
          _Star(x: 0.50, y: 0.44, size: 2.0), // δ Aqr (Skat)
          _Star(x: 0.48, y: 0.47, size: 1.7), // 121 Aqr
          _Star(x: 0.52, y: 0.47, size: 1.7), // 123 Aqr
          // Thân giữa
          _Star(x: 0.50, y: 0.52, size: 1.8), // 125 Aqr
          _Star(x: 0.48, y: 0.55, size: 1.6), // 127 Aqr
          _Star(x: 0.52, y: 0.55, size: 1.6), // 129 Aqr
          // Thân dưới
          _Star(x: 0.50, y: 0.60, size: 1.7), // 131 Aqr
          _Star(x: 0.48, y: 0.63, size: 1.5), // 133 Aqr
          _Star(x: 0.52, y: 0.63, size: 1.5), // 135 Aqr
          // Hông
          _Star(x: 0.45, y: 0.66, size: 1.6), // 137 Aqr
          _Star(x: 0.55, y: 0.66, size: 1.6), // 139 Aqr
          // Chân
          _Star(x: 0.47, y: 0.70, size: 1.5), // 141 Aqr
          _Star(x: 0.53, y: 0.70, size: 1.5), // 143 Aqr
          _Star(x: 0.45, y: 0.74, size: 1.4), // 145 Aqr
          _Star(x: 0.55, y: 0.74, size: 1.4), // 147 Aqr
          _Star(x: 0.46, y: 0.78, size: 1.3), // 149 Aqr
          _Star(x: 0.54, y: 0.78, size: 1.3), // 151 Aqr
          // Bàn chân
          _Star(x: 0.48, y: 0.82, size: 1.2), // 153 Aqr
          _Star(x: 0.52, y: 0.82, size: 1.2), // 155 Aqr
          // Tay trái
          _Star(x: 0.40, y: 0.44, size: 1.8), // λ Aqr
          _Star(x: 0.38, y: 0.48, size: 1.6), // μ Aqr
          _Star(x: 0.36, y: 0.52, size: 1.5), // ν Aqr
          _Star(x: 0.34, y: 0.56, size: 1.4), // 157 Aqr
          _Star(x: 0.32, y: 0.60, size: 1.3), // 159 Aqr
          // Tay phải (cầm bình)
          _Star(x: 0.60, y: 0.44, size: 1.8), // φ Aqr
          _Star(x: 0.62, y: 0.48, size: 1.6), // χ Aqr
          _Star(x: 0.64, y: 0.52, size: 1.5), // ψ Aqr
          _Star(x: 0.66, y: 0.56, size: 1.4), // 161 Aqr
          // Bình nước
          _Star(x: 0.58, y: 0.60, size: 1.9), // 163 Aqr
          _Star(x: 0.60, y: 0.64, size: 1.7), // 165 Aqr
          _Star(x: 0.58, y: 0.68, size: 1.6), // 167 Aqr
          // Dòng nước
          _Star(x: 0.56, y: 0.72, size: 1.5), // 169 Aqr
          _Star(x: 0.58, y: 0.76, size: 1.4), // 171 Aqr
          _Star(x: 0.60, y: 0.80, size: 1.3), // 173 Aqr
          _Star(x: 0.62, y: 0.84, size: 1.2), // 175 Aqr
          _Star(x: 0.64, y: 0.88, size: 1.1), // 177 Aqr
          // Áo
          _Star(x: 0.48, y: 0.65, size: 1.4), // 179 Aqr
          _Star(x: 0.52, y: 0.65, size: 1.4), // 181 Aqr
          _Star(x: 0.46, y: 0.68, size: 1.3), // 183 Aqr
          _Star(x: 0.54, y: 0.68, size: 1.3), // 185 Aqr
        ],
        connections: [
          // Đầu
          [0, 1], [0, 2], [1, 3], [2, 3],
          [0, 4], [0, 5], [4, 5],
          // Tóc
          [1, 6], [6, 8], [2, 7], [7, 9],
          // Cổ
          [0, 10],
          // Vai
          [10, 11], [10, 12], [11, 13], [12, 14],
          // Thân
          [10, 15], [15, 16], [15, 17],
          [15, 18], [18, 19], [18, 20],
          [18, 21], [21, 22], [21, 23],
          // Hông
          [21, 24], [21, 25],
          // Chân
          [24, 26], [25, 27], [26, 28], [27, 29], [28, 30], [29, 31],
          // Bàn chân
          [30, 32], [31, 33],
          // Tay trái
          [11, 34], [34, 35], [35, 36], [36, 37], [37, 38],
          // Tay phải
          [12, 39], [39, 40], [40, 41], [41, 42],
          // Bình
          [42, 43], [43, 44], [44, 45],
          // Dòng nước
          [45, 46], [46, 47], [47, 48], [48, 49], [49, 50],
          // Áo
          [24, 51], [51, 53], [25, 52], [52, 54],
        ],
        color: const Color(0xFF4CD3C2),
      ),

      // ♓ PISCES - Song Ngư (Hai Con Cá) - 52 sao
      _ZodiacConstellation(
        name: 'Pisces',
        stars: [
          // Nút nối (Alrescha)
          _Star(x: 0.50, y: 0.50, size: 2.4), // α Piscium (Alrescha)
          _Star(x: 0.48, y: 0.48, size: 1.5), // 1 Piscium
          _Star(x: 0.52, y: 0.48, size: 1.5), // 2 Piscium
          _Star(x: 0.50, y: 0.46, size: 1.4), // 3 Piscium
          // Dây nối - cá tây
          _Star(x: 0.46, y: 0.50, size: 1.3), // 4 Piscium
          _Star(x: 0.44, y: 0.50, size: 1.2), // 5 Piscium
          _Star(x: 0.42, y: 0.50, size: 1.2), // 6 Piscium
          // Dây nối - cá đông
          _Star(x: 0.54, y: 0.50, size: 1.3), // 7 Piscium
          _Star(x: 0.56, y: 0.50, size: 1.2), // 8 Piscium
          _Star(x: 0.58, y: 0.50, size: 1.2), // 9 Piscium
          // Cá phương Tây (Circlet - vòng tròn)
          _Star(x: 0.40, y: 0.48, size: 2.0), // β Piscium (Fum al Samakah)
          _Star(x: 0.36, y: 0.46, size: 1.8), // γ Piscium
          _Star(x: 0.33, y: 0.48, size: 1.7), // δ Piscium
          _Star(x: 0.30, y: 0.50, size: 1.6), // ε Piscium
          _Star(x: 0.28, y: 0.53, size: 1.5), // 10 Piscium
          _Star(x: 0.27, y: 0.57, size: 1.6), // 11 Piscium
          _Star(x: 0.28, y: 0.61, size: 1.7), // 12 Piscium
          _Star(x: 0.30, y: 0.64, size: 1.8), // 13 Piscium
          _Star(x: 0.33, y: 0.66, size: 1.7), // 14 Piscium
          _Star(x: 0.36, y: 0.66, size: 1.6), // 15 Piscium
          _Star(x: 0.39, y: 0.64, size: 1.5), // 16 Piscium
          _Star(x: 0.41, y: 0.60, size: 1.4), // 17 Piscium
          _Star(x: 0.42, y: 0.56, size: 1.5), // 18 Piscium
          // Vây cá tây
          _Star(x: 0.38, y: 0.50, size: 1.4), // 19 Piscium
          _Star(x: 0.36, y: 0.52, size: 1.3), // 20 Piscium
          _Star(x: 0.34, y: 0.54, size: 1.2), // 21 Piscium
          _Star(x: 0.32, y: 0.52, size: 1.3), // 22 Piscium
          _Star(x: 0.34, y: 0.50, size: 1.4), // 23 Piscium
          // Mắt cá tây
          _Star(x: 0.38, y: 0.48, size: 1.2), // 24 Piscium
          _Star(x: 0.40, y: 0.50, size: 1.2), // 25 Piscium
          // Cá phương Đông
          _Star(x: 0.60, y: 0.48, size: 2.0), // η Piscium
          _Star(x: 0.64, y: 0.46, size: 1.8), // μ Piscium
          _Star(x: 0.67, y: 0.48, size: 1.7), // ν Piscium
          _Star(x: 0.70, y: 0.50, size: 1.6), // ο Piscium
          _Star(x: 0.72, y: 0.53, size: 1.5), // 26 Piscium
          _Star(x: 0.73, y: 0.57, size: 1.6), // 27 Piscium
          _Star(x: 0.72, y: 0.61, size: 1.7), // 28 Piscium
          _Star(x: 0.70, y: 0.64, size: 1.8), // 29 Piscium
          _Star(x: 0.67, y: 0.66, size: 1.7), // 30 Piscium
          _Star(x: 0.64, y: 0.66, size: 1.6), // 31 Piscium
          _Star(x: 0.61, y: 0.64, size: 1.5), // 32 Piscium
          _Star(x: 0.59, y: 0.60, size: 1.4), // 33 Piscium
          _Star(x: 0.58, y: 0.56, size: 1.5), // 34 Piscium
          // Vây cá đông
          _Star(x: 0.62, y: 0.50, size: 1.4), // 35 Piscium
          _Star(x: 0.64, y: 0.52, size: 1.3), // 36 Piscium
          _Star(x: 0.66, y: 0.54, size: 1.2), // 37 Piscium
          _Star(x: 0.68, y: 0.52, size: 1.3), // 38 Piscium
          _Star(x: 0.66, y: 0.50, size: 1.4), // 39 Piscium
          // Mắt cá đông
          _Star(x: 0.62, y: 0.48, size: 1.2), // 40 Piscium
          _Star(x: 0.60, y: 0.50, size: 1.2), // 41 Piscium
          // Đuôi cá tây
          _Star(x: 0.25, y: 0.55, size: 1.5), // 42 Piscium
          _Star(x: 0.23, y: 0.58, size: 1.4), // 43 Piscium
          _Star(x: 0.22, y: 0.62, size: 1.3), // 44 Piscium
          // Đuôi cá đông
          _Star(x: 0.75, y: 0.55, size: 1.5), // 45 Piscium
          _Star(x: 0.77, y: 0.58, size: 1.4), // 46 Piscium
          _Star(x: 0.78, y: 0.62, size: 1.3), // 47 Piscium
        ],
        connections: [
          // Nút nối
          [0, 1], [0, 2], [1, 3], [2, 3],
          // Dây cá tây
          [0, 4], [4, 5], [5, 6], [6, 9],
          // Dây cá đông
          [0, 7], [7, 8], [8, 9], [9, 39],
          // Cá tây (Circlet)
          [6, 10], [10, 11], [11, 12], [12, 13], [13, 14], [14, 15],
          [15, 16], [16, 17], [17, 18], [18, 19], [19, 20], [20, 21], [21, 6],
          // Vây cá tây
          [10, 22], [22, 23], [23, 24], [24, 25], [25, 26], [26, 10],
          // Mắt cá tây
          [10, 27], [10, 28],
          // Cá đông
          [9, 29], [29, 30], [30, 31], [31, 32], [32, 33], [33, 34],
          [34, 35], [35, 36], [36, 37], [37, 38], [38, 39], [39, 9],
          // Vây cá đông
          [29, 40], [40, 41], [41, 42], [42, 43], [43, 44], [44, 29],
          // Mắt cá đông
          [29, 45], [29, 46],
          // Đuôi cá tây
          [13, 47], [47, 48], [48, 49],
          // Đuôi cá đông
          [32, 50], [50, 51], [51, 52],
        ],
        color: const Color(0xFF9D65C9),
      ),
    ];

    // Khởi tạo vận tốc ngẫu nhiên cho mỗi chòm sao
    final random = math.Random();
    for (var constellation in _zodiacConstellations) {
      final depth = random.nextDouble() * 1 + 0.5;
      constellation.vx = (random.nextDouble() - 0.5) * 0.0015 * depth;
      constellation.vy = (random.nextDouble() - 0.5) * 0.0015 * depth;
      constellation.centerX = random.nextDouble() * 0.5 + 0.25;
      constellation.centerY = random.nextDouble() * 0.5 + 0.25;
    }
  }

  void _selectActiveConstellations() {
    final random = math.Random();
    _activeConstellations = [];
    final availableIndices = List.generate(12, (index) => index)
      ..shuffle(random);

    for (int i = 0; i < _activeConstellationCount; i++) {
      final constellation = _zodiacConstellations[availableIndices[i]].copy();
      // Đặt vị trí ban đầu ở các góc màn hình
      switch (i) {
        case 0:
          constellation.centerX = 0.2;
          constellation.centerY = 0.2;
          break;
        case 1:
          constellation.centerX = 0.8;
          constellation.centerY = 0.2;
          break;
        case 2:
          constellation.centerX = 0.2;
          constellation.centerY = 0.8;
          break;
        case 3:
          constellation.centerX = 0.8;
          constellation.centerY = 0.8;
          break;
      }
      _activeConstellations.add(constellation);
    }
  }

  void _updateConstellations() {
    for (var constellation in _activeConstellations) {
      // Cập nhật vị trí trung tâm
      constellation.centerX += constellation.vx;
      constellation.centerY += constellation.vy;

      // Kiểm tra biên và đổi hướng
      if (constellation.centerX < -0.5 ||
          constellation.centerX > 1.5 ||
          constellation.centerY < -0.5 ||
          constellation.centerY > 1.5) {
        _replaceConstellation(constellation);
        continue;
      }

      // Cập nhật vị trí các sao trong chòm (tương đối so với trung tâm)
      for (var star in constellation.stars) {
        star.x = constellation.centerX + star.originalX - 0.5;
        star.y = constellation.centerY + star.originalY - 0.5;
      }
    }
  }

  void _replaceConstellation(_ZodiacConstellation oldConstellation) {
    final random = math.Random();
    final availableConstellations = _zodiacConstellations
        .where((c) => !_activeConstellations.any((ac) => ac.name == c.name))
        .toList();

    if (availableConstellations.isNotEmpty) {
      final newConstellation =
          availableConstellations[random.nextInt(
                availableConstellations.length,
              )]
              .copy();

      // Đặt vị trí mới ở phía đối diện
      if (oldConstellation.centerX < 0) {
        newConstellation.centerX = 1.2;
      } else if (oldConstellation.centerX > 1) {
        newConstellation.centerX = -0.2;
      } else {
        newConstellation.centerX = random.nextDouble() * 0.4 + 0.3;
      }

      if (oldConstellation.centerY < 0) {
        newConstellation.centerY = 1.2;
      } else if (oldConstellation.centerY > 1) {
        newConstellation.centerY = -0.2;
      } else {
        newConstellation.centerY = random.nextDouble() * 0.4 + 0.3;
      }

      // Giữ hướng di chuyển tương tự
      newConstellation.vx = (random.nextDouble() - 0.5) * 0.0015;
      newConstellation.vy = (random.nextDouble() - 0.5) * 0.0015;

      final index = _activeConstellations.indexOf(oldConstellation);
      if (index != -1) {
        _activeConstellations[index] = newConstellation;
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        return CustomPaint(
          painter: _ZodiacConstellationPainter(
            constellations: _activeConstellations,
            progress: _controller.value,
            connectionDistance: _connectionDistance,
          ),
          size: Size.infinite,
        );
      },
    );
  }
}

class _ZodiacConstellation {
  final String name;
  final List<_Star> stars;
  final List<List<int>> connections;
  final Color color;
  double centerX;
  double centerY;
  double vx;
  double vy;

  _ZodiacConstellation({
    required this.name,
    required this.stars,
    required this.connections,
    required this.color,
    this.centerX = 0.5,
    this.centerY = 0.5,
    this.vx = 0,
    this.vy = 0,
  }) {
    // Lưu tọa độ gốc tương đối
    for (var star in stars) {
      star.originalX = star.x;
      star.originalY = star.y;
    }
  }

  _ZodiacConstellation copy() {
    final newStars = stars.map((star) => star.copy()).toList();
    return _ZodiacConstellation(
      name: name,
      stars: newStars,
      connections: List.from(connections),
      color: color,
      centerX: centerX,
      centerY: centerY,
      vx: vx,
      vy: vy,
    );
  }
}

class _Star {
  double x, y;
  double size;
  double originalX, originalY;
  double vx = 0, vy = 0;

  _Star({required this.x, required this.y, required this.size})
    : originalX = x,
      originalY = y;

  _Star copy() {
    return _Star(x: x, y: y, size: size)
      ..originalX = originalX
      ..originalY = originalY;
  }
}

class _ZodiacConstellationPainter extends CustomPainter {
  final List<_ZodiacConstellation> constellations;
  final double progress;
  final double connectionDistance;

  _ZodiacConstellationPainter({
    required this.constellations,
    required this.progress,
    required this.connectionDistance,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;

    // 🌌 Background với gradient động
    final bgPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment(-1 + progress * 2, -1),
        end: Alignment(1, 1 - progress * 2),
        colors: const [
          Color(0xFF0B0F19),
          Color(0xFF1A1F4D),
          Color(0xFF2A2F7A),
          Color(0xFF0F3460),
        ],
      ).createShader(rect);

    canvas.drawRect(rect, bgPaint);

    // 🔗 Vẽ kết nối trong mỗi chòm sao
    for (var constellation in constellations) {
      final constellationPaint = Paint()
        ..strokeWidth = 1.5
        ..color = constellation.color.withOpacity(0.6);

      for (var connection in constellation.connections) {
        if (connection.length == 2) {
          final star1 = constellation.stars[connection[0]];
          final star2 = constellation.stars[connection[1]];

          final p1 = Offset(star1.x * size.width, star1.y * size.height);
          final p2 = Offset(star2.x * size.width, star2.y * size.height);

          canvas.drawLine(p1, p2, constellationPaint);
        }
      }
    }

    // ✨ Vẽ các ngôi sao với hiệu ứng glow
    for (var constellation in constellations) {
      for (int i = 0; i < constellation.stars.length; i++) {
        final star = constellation.stars[i];

        final pulse = (math.sin(progress * 2 * math.pi + i) + 1) / 2;
        final opacity = 0.6 + pulse * 0.4;

        final pos = Offset(star.x * size.width, star.y * size.height);

        // Glow effect
        final glowPaint = Paint()
          ..color = constellation.color.withOpacity(opacity * 0.3)
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);

        canvas.drawCircle(pos, star.size * 2.0, glowPaint);

        // Core star
        final corePaint = Paint()..color = Colors.white.withOpacity(opacity);

        canvas.drawCircle(pos, star.size, corePaint);
      }
    }

    // 🔗 Kết nối giữa các sao gần nhau từ các chòm khác nhau
    final globalLinePaint = Paint()..strokeWidth = 0.8;

    for (int i = 0; i < constellations.length; i++) {
      for (int j = i + 1; j < constellations.length; j++) {
        final constellation1 = constellations[i];
        final constellation2 = constellations[j];

        for (var star1 in constellation1.stars) {
          for (var star2 in constellation2.stars) {
            final dx = (star1.x - star2.x) * size.width;
            final dy = (star1.y - star2.y) * size.height;
            final dist = math.sqrt(dx * dx + dy * dy);

            if (dist < connectionDistance) {
              final opacity = (1 - dist / connectionDistance) * 0.15;

              final p1 = Offset(star1.x * size.width, star1.y * size.height);
              final p2 = Offset(star2.x * size.width, star2.y * size.height);

              globalLinePaint.color = Colors.white.withOpacity(opacity);
              canvas.drawLine(p1, p2, globalLinePaint);
            }
          }
        }
      }
    }

    // 🌑 Vignette effect
    final vignette = Paint()
      ..shader = RadialGradient(
        center: Alignment.center,
        radius: 1.2,
        colors: [Colors.transparent, Colors.black.withOpacity(0.5)],
      ).createShader(rect);

    canvas.drawRect(rect, vignette);
  }

  @override
  bool shouldRepaint(covariant _ZodiacConstellationPainter oldDelegate) => true;
}
