// lib/services/secure_storage_service.dart
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  // Singleton — seluruh aplikasi pakai satu instance
  static final _instance = SecureStorageService._();
  factory SecureStorageService() => _instance;
  SecureStorageService._();

  // v11: cukup ini — enkripsi diurus paket
  final _store = const FlutterSecureStorage();

  static const _kPinEnabled = 'pin_enabled';

  // Status PIN aplikasi (R1: D-11, SEC-01).
  // Hash dan salt PIN diurus PinService.
  Future<bool> isPinEnabled() async =>
      await _store.read(key: _kPinEnabled) == 'true';

  // Hak penghapusan (PRV-03): hapus semua data sensitif lokal
  Future<void> clearAll() => _store.deleteAll();
}