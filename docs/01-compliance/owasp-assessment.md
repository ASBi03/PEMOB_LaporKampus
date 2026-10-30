# R4 · Penilaian OWASP Mobile Top 10 (2024)
# Aplikasi: Lapor Kampus  

Status: **Mitigasi** = sudah ada di kode M01 · **Perlu tindakan** = belum, wajib sebelum tag · **Direncanakan** = dikerjakan di milestone berikutnya · **N/A hingga M05** = belum relevan sebelum ada jaringan.

| # | Risiko | Status M01 | Kontrol / Rencana |
|---|--------|------------|-------------------|
| M1 | Kredensial tidak aman | Mitigasi | SEC-04: `.env`, `*.jks`, `key.properties` di `.gitignore`; tanpa secret di repo (`git grep`). `google-services.json` diputuskan di M05. `--dart-define` bukan tempat secret sungguhan. |
| M2 | Supply chain | Mitigasi | SEC-04: `pubspec.lock` di-commit; `flutter pub outdated` ditinjau dan dicatat di `docs/adr/`. Paket Firebase/geolocator/camera dicek saat ditambah di M05. |
| M3 | Autentikasi / otorisasi | Direncanakan | SEC-02, SEC-07: PIN lokal (PBKDF2 + salt) sebagai baseline M01. Login Firebase Authentication di M05 dan empat peran (pelapor, petugas, admin, pimpinan) ditegakkan oleh Firestore/Storage rules, bukan hanya UI. Login SIMERU masuk *Won't*. |
| M4 | Validasi input/output | Direncanakan | Validator form laporan (kategori, urgensi, deskripsi min/maks, lokasi wajib lengkap) di M04. SEC-08: validasi tipe/ukuran foto di M05. |
| M5 | Komunikasi tidak aman | N/A hingga M05 | SEC-05: `network_security_config.xml` melarang cleartext HTTP; semua jaringan HTTPS (Firebase). |
| M6 | Kontrol privasi | Direncanakan | PRV-01 s.d. PRV-08: minimisasi data, kebijakan privasi dalam aplikasi, hapus data, ekspor, izin kamera/lokasi diminta saat dipakai (UX-02, default MATI), EXIF dibuang (PRV-08), identitas pelapor hanya terlihat admin. |
| M7 | Perlindungan binary | Direncanakan | Build release memakai `--obfuscate --split-debug-info`; dipasang saat build M05. |
| M8 | Konfigurasi salah | Mitigasi | SEC-03: `allowBackup=false`, `avoid_print` aktif, tanpa `print` di `lib/`, debug off di release. Izin Android minimal: tanpa INTERNET sampai M05 (SEC-06); CAMERA ditambah hanya saat fitur foto dibuat. |
| M9 | Penyimpanan tidak aman | Mitigasi | SEC-01: nilai sensitif (status PIN, hash PIN, token) di `flutter_secure_storage`, bukan SharedPreferences. Data laporan di Firestore dengan rules per peran (M05); cache lokal laporan, jika ada, tidak memuat identitas pelapor. |
| M10 | Kriptografi lemah | Mitigasi | SEC-02: PBKDF2-HMAC-SHA256, 120.000 iterasi, salt acak 16 byte, perbandingan waktu-konstan; tanpa MD5/SHA1. |

## Risiko Khas Topik Ini (Lapor Kampus)
- **M3/M6 Akses lintas peran**: pelapor tidak boleh membaca laporan orang lain, petugas hanya laporan yang ditugaskan, pimpinan hanya rekap tanpa identitas. Diuji per role sebelum rilis M05 (SEC-07).
- **M6/M9 Foto laporan**: bisa memuat wajah orang dan metadata EXIF/GPS. Hapus EXIF sebelum unggah; Storage rules membatasi pembacaan sesuai peran (PRV-08, SEC-07).
- **M4 Unggahan**: foto berukuran besar atau tipe file tidak sah; batasi tipe dan ukuran, acak nama file (SEC-08).
- **M5/M8 Notifikasi push (FCM)**: isi notifikasi tidak memuat data pribadi, cukup "Status laporanmu berubah"; detail dibuka di dalam aplikasi.
- **M1/M8 Firebase**: kunci API Firebase di klien bukan secret. Keamanan bergantung pada Firestore/Storage rules dan pembatasan API key, bukan menyembunyikan file konfigurasi.

## Bukti (evidence) untuk M01
| Kontrol | Berkas bukti di `docs/01-compliance/evidence/` |
|---------|------------------------------------------------|
| SEC-03 lint dan tanpa print | `sec-03-lint.txt`, `sec-03-print.txt` |
| SEC-06 tanpa izin INTERNET | `sec-06-permissions.txt` |
| SEC-01 secure storage | tangkapan layar Device File Explorer (`shared_prefs` tidak memuat data sensitif) |
| SEC-04 tanpa secret | keluaran `git grep -niE "secret|api.?key|password"` |
