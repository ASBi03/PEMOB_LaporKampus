// lib/repositories/laporan_repository.dart
import '../models/laporan.dart';

/// Kontrak akses data. Jangan import Firebase atau storage apa pun di sini.
///
/// UI tidak pernah langsung menyentuh penyimpanan — UI hanya bicara
/// dengan LaporanRepository. M04 = implementasi in-memory/lokal.
/// M05 = implementasi Firestore. Mengganti satu baris di main.dart
/// (lihat in_memory_laporan_repository.dart) sudah cukup untuk beralih.
abstract class LaporanRepository {
  Future<List<Laporan>> getAll();
  Future<List<Laporan>> getByPelapor(String pelaporId);
  Future<Laporan?> getById(String id);
  Future<void> add(Laporan laporan);
  Future<void> updateStatus(String id, StatusLaporan status);
  Future<void> remove(String id); // PRV-03: hak penghapusan
}