// lib/core/app_theme.dart
import 'package:flutter/material.dart';

// ── Design Tokens ──────────────────────────────────────
// Nama token ini harus sama persis dengan yang dipakai di Figma
// nanti (M03), supaya handoff M03 -> M04 tidak tebak-tebakan warna.
class AppColors {
  static const primary = Color(0xFF1A2342); // navy, warna utama
  static const accent = Color(0xFFF2A341); // oranye, aksen & CTA
  static const warning = Color(0xFFFFA623); // kategori urgensi: sedang
  static const danger = Color(0xFFE5484D); // kategori urgensi: tinggi
  static const success = Color(0xFF2E9E5B); // status: selesai
}

class AppSpace {
  static const sm = 8.0;
  static const md = 16.0;
  static const lg = 24.0;
}

// ── Theme ───────────────────────────────────────────────
class AppTheme {
  static ThemeData get light => ThemeData(
        colorSchemeSeed: AppColors.primary,
        useMaterial3: true,
      );
}

// Lengkapi token (tipografi, radius, dsb.) saat desain Figma selesai di M03