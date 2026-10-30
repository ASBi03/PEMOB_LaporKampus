# R1 · Inventaris Data Pribadi
# Aplikasi: LaporKampus Topik: Lapor Kampus Kelompok: 02
| Data | Kategori UU PDP | Tujuan | Lokasi simpan | Retensi | Perlindungan |
|------|-----------------|--------|---------------|---------|--------------|
| D01 · Nama lengkap | Umum | Identitas pelapor pada laporan; admin tahu siapa yang melapor | Lokal (M04) -> Cloud Firestore koleksi users (M05) | Selama akun aktif; dihapus saat akun dihapus | HTTPS; Firestore Security Rules per peran; tidak ditampilkan ke petugas (PRV-09) |
| D02 · Email kampus | Umum | Login dan verifikasi bahwa pelapor civitas UAD (domain email kampus) | Cloud Firebase Authentication (M05) | Selama akun aktif; dihapus saat akun dihapus | HTTPS; dikelola Firebase Authentication; hanya pemilik akun dan admin yang dapat melihat |
| D03 · Kata sandi | Umum (kredensial) | Autentikasi akun | Cloud Firebase Authentication (M05); aplikasi tidak menyimpan | Selama akun aktif | Di-hash oleh Firebase Authentication; tidak disimpan, dicatat, atau ditampilkan oleh aplikasi |
| D04 · UID akun (pengenal pseudonim dari Firebase) | Umum | Mengaitkan laporan dengan pelapor tanpa membawa nama di setiap dokumen | Cloud Firestore (M05) | Selama akun aktif; pada laporan yang dipertahankan diganti penanda anonim saat akun dihapus | Security Rules; tidak ditampilkan di antarmuka |
| D05 · Peran pengguna (pelapor / petugas / admin / pimpinan) | Umum | Hak akses berbasis peran | Cloud Firestore koleksi users (M05) | Selama akun aktif | Hanya admin yang dapat mengubah; ditegakkan Security Rules |
| D06 · PIN aplikasi | Umum (kredensial keamanan) | Mengunci aplikasi di perangkat (SEC-02) | Lokal saja: secure storage perangkat | Sampai PIN dihapus pengguna atau aplikasi dihapus | PBKDF2 + salt acak, flutter_secure_storage (SEC-01); tidak pernah dikirim ke cloud |
| D07 · Foto kerusakan | Umum (dapat memuat wajah orang secara tidak sengaja) | Bukti kondisi kerusakan bagi admin dan petugas | Penyimpanan privat aplikasi (M04) -> Cloud Firebase Storage (M05) | Sama dengan laporan (D10) | Dikompres; metadata EXIF dihapus sebelum diunggah (PRV-07); akses per peran; HTTPS; petunjuk "arahkan kamera ke objek yang rusak, bukan ke orang" |
| D08 · Koordinat GPS saat melapor | Umum (diperlakukan sensitif karena menunjukkan keberadaan pelapor) | Menandai letak kerusakan pada peta kampus | Lokal (M04) -> Cloud Firestore (M05) | Sama dengan laporan (D10) | Opsional, default mati (UX-02); diambil satu kali saat laporan dikirim, hanya saat aplikasi dipakai, tanpa pelacakan latar belakang (PRV-08); HTTPS |
| D09 · Lokasi manual (kampus, gedung, lantai, ruang) | Bukan data pribadi (data fasilitas); menjadi data pribadi hanya bila dikaitkan dengan pelapor lewat laporan | Menentukan lokasi kerusakan; pelengkap GPS di dalam gedung | Lokal (M04) -> Cloud Firestore (M05) | Sama dengan laporan (D10) | Pilihan dari daftar baku (bukan teks bebas); Security Rules |
| D10 · Isi laporan (kategori, tingkat urgensi, deskripsi) | Umum (deskripsi teks bebas dapat memuat data pribadi) | Inti laporan; dasar penanganan dan rekap anggaran | Lokal (M04) -> Cloud Firestore (M05) | Usulan: 3 tahun sejak status selesai (mengikuti siklus anggaran), lalu dihapus; bila akun dihapus, laporan dianonimkan | Batas panjang deskripsi + peringatan "jangan menulis data pribadi orang lain"; Security Rules per peran |
| D11 · Status, riwayat perubahan status, dan penugasan petugas | Umum | Tracking status, notifikasi, akuntabilitas penanganan | Lokal (M04) -> Cloud Firestore (M05) | Sama dengan laporan (D10) | Hanya admin dan petugas yang ditugaskan yang dapat mengubah; perubahan tercatat |
| D12 · Token notifikasi (FCM) | Umum (pengenal teknis perangkat) | Mengirim push notification saat status laporan berubah | Cloud Firestore koleksi users (M05); tidak ada di M01-M04 | Sampai notifikasi dimatikan, pengguna logout, atau akun dihapus | Opsional, default mati (UX-02); izin notifikasi sistem; HTTPS; token dihapus saat dimatikan |

## Tidak Dikumpulkan (konfirmasi eksplisit)
- [x] Lokasi latar belakang / pelacakan posisi terus-menerus (GPS hanya satu kali saat mengirim laporan; lihat D08)
- [x] ID perangkat (IMEI, Android ID, advertising ID). Satu-satunya pengenal perangkat adalah token FCM (D12), opsional dan baru ada di M05
- [x] Kontak
- [x] Galeri atau berkas lain di luar foto yang dipilih atau diambil pengguna untuk laporan
- [x] Mikrofon, SMS, dan log panggilan
- [x] NIK dan NIM/NIP (verifikasi civitas memakai domain email kampus; dikonfirmasi ulang di M02 bila ternyata dibutuhkan)
- [x] Data spesifik menurut UU PDP: kesehatan, biometrik, genetika, catatan kejahatan, data anak, data keuangan pribadi
- [x] Analytics, iklan, dan crash reporting pihak ketiga (Firebase Analytics dan Crashlytics tidak diaktifkan)
- Catatan: kamera dan GPS TIDAK masuk daftar ini karena memang dipakai; keduanya tercatat di D07 dan D08.

## Requirement yang Lahir dari Register Ini
- PRV-01: Aplikasi hanya mengumpulkan data pada R1 (D01-D12); data pada daftar "Tidak Dikumpulkan" tidak boleh diminta atau disimpan.
- PRV-02: Tidak ada SDK analytics, iklan, atau crash reporting pihak ketiga; satu-satunya layanan pihak ketiga adalah Firebase (Authentication, Firestore, Storage, Cloud Messaging) yang tercatat di R1 dan baru aktif mulai M05.
- PRV-07: Metadata EXIF (termasuk koordinat) dihapus dari foto sebelum disimpan atau diunggah, dan pelapor diberi petunjuk agar tidak memotret wajah orang.
- PRV-08: Izin lokasi hanya diminta saat dibutuhkan (hanya saat aplikasi dipakai); koordinat diambil sekali saat laporan dikirim dan tidak ada pelacakan latar belakang.
- PRV-09: Identitas pelapor (nama, email) hanya terlihat oleh admin; petugas dan pelapor lain tidak dapat melihatnya.
