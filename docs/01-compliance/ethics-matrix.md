# R2 · Matriks Etika
# Aplikasi: Lapor Kampus  
# Kode etik yang digunakan: ACM Code of Ethics (2018) dan IEEE-CS/ACM Software Engineering Code of Ethics

| Sumber | Prinsip | Risiko di Aplikasi Kami | Kontrol (ID) |
|--------|---------|------------------------|--------------|
| ACM 1.6 | Hormati privasi | Data pelapor (nama, NIM/NIP, kontak) dan foto lokasi disimpan di Firebase (pihak ketiga). Data berlebih atau terbuka ke pihak yang tidak berkepentingan, misalnya pelapor lain melihat identitas pelapor. | PRV-01, PRV-03, SEC-07 |
| ACM 1.7 | Jaga kerahasiaan | Admin dan petugas melihat data pelapor lebih dari yang dibutuhkan; petugas bisa membuka laporan yang bukan tugasnya; pimpinan seharusnya hanya melihat rekap, bukan identitas. | SEC-07, PRV-01 |
| ACM 1.3 | Jujur dan tepercaya | Status laporan menyesatkan (tampil "diproses" padahal belum ada tindakan), atau klaim "data aman/lokal" tidak sesuai kenyataan setelah M05 memakai cloud. | UX-04, PRV-05 |
| ACM 1.2 | Hindari bahaya | Laporan kerusakan berbahaya (korsleting, atap rawan roboh) tertunda karena urgensi salah atau tidak dipantau; foto yang tidak sengaja memuat wajah orang lain. | UX-05, PRV-08 |
| ACM 2.9 | Rancang sistem yang aman | Akun admin diambil alih; aturan Firestore/Storage terlalu longgar; foto/file berbahaya diunggah. | SEC-02, SEC-07, SEC-08 |
| IEEE-CS Prinsip 1 (Publik) | Bertindak demi kepentingan publik | Data historis kerusakan dipakai pimpinan untuk anggaran; data bias atau tidak lengkap menghasilkan prioritas perawatan yang tidak adil antar kampus. | PRV-07, UX-04 |
| IEEE-CS Prinsip 3 (Produk) | Produk memenuhi standar profesional, diuji memadai | Aplikasi dirilis tanpa pengujian per role, sehingga kebocoran data antar role tidak terdeteksi. | SEC-07, SEC-04 |
| IEEE-CS Prinsip 2 (Klien dan pemberi kerja) | Bertindak sesuai kepentingan klien/pemberi kerja dan sejalan dengan kepentingan publik | Aplikasi dipakai resmi tanpa persetujuan kampus: kepemilikan data, retensi, dan SOP penghapusan belum disepakati dengan admin SIMERU. | PRV-07, PRV-05 |

## Catatan: Risiko Khas Topik Ini (Lapor Kampus)
- **Identitas pelapor**: laporan fasilitas umumnya tidak sensitif, tetapi nama + NIM/NIP + kontak membuat pelapor bisa dikenali. Identitas hanya terlihat admin; petugas cukup melihat isi laporan (SEC-07, PRV-01).
- **Foto tidak sengaja memuat orang**: pelapor diingatkan memotret objek rusak, bukan orang. Metadata EXIF (termasuk GPS) dibuang sebelum diunggah (PRV-08).
- **Data lokasi**: M01-M04 memakai pilihan manual kampus-gedung-lantai-ruang; GPS otomatis masuk *Won't* di Charter. Jika GPS diaktifkan kelak, wajib izin eksplisit dan default MATI (UX-02).
- **Penyimpanan di pihak ketiga (Firebase)**: statusnya sebagai prosesor data harus dicatat di R1 dan kebijakan privasi (PRV-05). Perlu persetujuan kampus sebelum produksi.
- **Resistensi admin dari WhatsApp**: masa transisi paralel; laporan di WhatsApp tidak otomatis jadi data di sistem, sehingga status di aplikasi harus jujur (UX-04).
- **Retensi**: laporan lama dan foto yang tidak relevan perlu masa simpan dan SOP penghapusan yang disepakati dengan kampus (PRV-07).

## Requirement Baru yang Lahir dari Register Ini 
| ID | Requirement | Sumber | Milestone |
|----|-------------|--------|-----------|
| SEC-07 | Hak akses berbasis peran (pelapor/petugas/admin/pimpinan); pelapor hanya melihat laporannya, petugas hanya tugasnya, pimpinan hanya rekap tanpa identitas. Ditegakkan oleh Firestore/Storage rules, bukan hanya UI | ACM 1.6/1.7/2.9 | M04 (model), M05 (rules) |
| SEC-08 | Validasi unggahan foto: tipe dan ukuran dibatasi, nama file diacak | ACM 2.9 | M05 |
| PRV-07 | Masa retensi laporan/foto dan SOP penghapusan disepakati dengan admin SIMERU | IEEE-CS 1/2 | M02, M05 |
| PRV-08 | Foto: peringatan "jangan memotret orang" + hapus metadata EXIF sebelum unggah | ACM 1.2/1.6 | M04 |
| UX-04 | Status laporan hanya berubah oleh aksi admin/petugas yang tercatat (siapa, kapan) | ACM 1.3 | M04 |
| UX-05 | Urgensi tinggi tampil menonjol di dashboard admin dan memicu notifikasi | ACM 1.2 | M04 |
