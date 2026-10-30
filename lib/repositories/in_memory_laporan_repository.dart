// lib/repositories/in_memory_laporan_repository.dart
import 'laporan_repository.dart';
import '../models/laporan.dart';

/// Implementasi sementara di memori (hilang saat app ditutup).
/// Dipakai untuk M01-M04 sampai LaporanRepository diisi versi
/// Firestore di M05.
class InMemoryLaporanRepository implements LaporanRepository {
  final _items = <String, Laporan>{};

  @override
  Future<List<Laporan>> getAll() async => _items.values.toList();

  @override
  Future<List<Laporan>> getByPelapor(String pelaporId) async =>
      _items.values.where((l) => l.pelaporId == pelaporId).toList();

  @override
  Future<Laporan?> getById(String id) async => _items[id];

  @override
  Future<void> add(Laporan laporan) async {
    _items[laporan.id] = laporan;
  }

  @override
  Future<void> updateStatus(String id, StatusLaporan status) async {
    final current = _items[id];
    if (current == null) return;
    _items[id] = current.copyWith(
      status: status,
      diperbaruiPada: DateTime.now(),
    );
  }

  @override
  Future<void> remove(String id) async {
    _items.remove(id);
  }
}