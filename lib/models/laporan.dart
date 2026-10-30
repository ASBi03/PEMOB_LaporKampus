// lib/models/laporan.dart

/// Status penanganan laporan, mengikuti alur:
/// pending -> diverifikasi -> diproses -> selesai
enum StatusLaporan { pending, diverifikasi, diproses, selesai }

/// Tingkat urgensi laporan.
enum UrgensiLaporan { rendah, sedang, tinggi }

/// Kategori kerusakan fasilitas.
enum KategoriLaporan { listrik, sanitasi, furniture, ac, bangunan, lainnya }

class Laporan {
  final String id;
  final String pelaporId;
  final KategoriLaporan kategori;
  final UrgensiLaporan urgensi;
  final String deskripsi;

  // Lokasi: dipilih manual kampus -> gedung -> lantai -> ruang
  // (GPS belum dipakai di versi ini, lihat Batasan Project)
  final String kampus; // contoh: "1A", "2B", "5"
  final String gedung;
  final String? lantai;
  final String? ruang;

  final String? fotoPath;
  final StatusLaporan status;
  final DateTime dibuatPada;
  final DateTime? diperbaruiPada;

  const Laporan({
    required this.id,
    required this.pelaporId,
    required this.kategori,
    required this.urgensi,
    required this.deskripsi,
    required this.kampus,
    required this.gedung,
    this.lantai,
    this.ruang,
    this.fotoPath,
    this.status = StatusLaporan.pending,
    required this.dibuatPada,
    this.diperbaruiPada,
  });

  Laporan copyWith({
    StatusLaporan? status,
    DateTime? diperbaruiPada,
  }) {
    return Laporan(
      id: id,
      pelaporId: pelaporId,
      kategori: kategori,
      urgensi: urgensi,
      deskripsi: deskripsi,
      kampus: kampus,
      gedung: gedung,
      lantai: lantai,
      ruang: ruang,
      fotoPath: fotoPath,
      status: status ?? this.status,
      dibuatPada: dibuatPada,
      diperbaruiPada: diperbaruiPada ?? this.diperbaruiPada,
    );
  }
}