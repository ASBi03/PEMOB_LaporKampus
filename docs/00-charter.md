# Project Charter  Lapor Kampus
# Topik: Lapor Kampus (pelaporan kerusakan fasilitas + lost & found)
# Anggota: Fenzy Septia Marthanti | Agustin Salsabilla | Lily Putri Andini

# Visi
Memusatkan pelaporan kerusakan fasilitas dan barang hilang/ditemukan di 6 kampus UAD ke dalam satu aplikasi.

# Tujuan Terukur
Memberi kejelasan status laporan ke pelapor dalam ≤ 24 jam sejak laporan masuk.
Mencakup seluruh kampus UAD dalam satu sistem pelaporan.

# Stakeholder
Mahasiswa, dosen, dan seluruh civitas akademika UAD.

# Scope
Must (wajib ada)
Lapor kerusakan fasilitas dengan foto + lokasi (kampus–gedung–lantai–ruang)
Kategori dan tingkat urgensi laporan
Status tracking real-time dengan notifikasi
Dashboard admin untuk verifikasi dan assign petugas
Riwayat laporan per pengguna

# Won't (tidak dikerjakan sekarang)
Laporan kehilangan/penemuan barang (fitur tambahan, menyusul setelah 5 fitur Must selesai)
Peta interaktif dengan GPS tagging otomatis (dipakai pemilihan lokasi manual dulu)
Integrasi login akun kampus/SIMERU (pakai autentikasi terpisah di fase awal)
Fitur chat konsultasi atau rating petugas

# Batasan & Asumsi
Teknologi: Flutter (Dart), backend Firebase (free tier)
Waktu: satu semester
Non-teknis: data pelapor tunduk pada UU PDP No. 27/2022; perlu koordinasi dengan admin SIMERU tiap kampus sebelum digunakan secara resmi

# Risiko Awal
Akurasi GPS kurang baik di dalam gedung
Admin SIMERU terbiasa dengan alur WhatsApp, berpotensi menolak beralih ke sistem baru
Kuota free tier Firebase bisa terlampaui jika volume foto/laporan tinggi

# Kriteria Sukses
Lima fitur harus berjalan end-to-end (pelapor bisa lapor → admin verifikasi & assign → petugas update status → pelapor menerima notifikasi), diuji coba oleh perwakilan tiap role (pelapor, admin, petugas), dan flutter analyze bersih tanpa error.
