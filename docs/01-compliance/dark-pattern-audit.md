# R5 · Audit Dark Pattern
# Aplikasi: Lapor Kampus   Topik: Lapor   Kelompok: Tim OPTIMA
# Pertanyaan uji ini dijalankan pada setiap rilis milestone

| Pola | Pertanyaan Uji | Harapan di Aplikasi Kami |
|------|----------------|--------------------------|
| Pre-selected options | Adakah opsi yang sudah tercentang demi kepentingan kita? | Semua sakelar opsional (GPS otomatis, notifikasi) default MATI; tidak ada centang yang sudah terisi |
| Trick questions | Bisakah kalimat opsi dibaca dua arah? | Kalimat positif tunggal, mis. "Izinkan aplikasi mengambil lokasi saat laporan dikirim?" |
| Roach motel | Apakah keluar/hapus lebih sulit daripada masuk? | "Hapus semua data saya" dicapai maksimal 2 ketukan (pilih menu, lalu konfirmasi); tanpa harus menghubungi admin |
| Confirmshaming | Apakah tombol "tidak" mempermalukan pengguna? | Teks netral: "Tidak sekarang"; tidak ada kalimat yang menyalahkan pengguna |
| Privacy zuckering | Apakah pengaturan privasi tersebar atau rumit? | Satu layar "Privasi & Data" berisi GPS, notifikasi, unduh data, hapus data, dan kebijakan privasi |
| Nagging izin (khas topik) | Apakah aplikasi terus meminta izin lokasi/notifikasi setelah ditolak? | Izin diminta satu kali, tepat saat fitur dipakai; setelah ditolak, laporan tetap bisa dikirim dengan lokasi manual (D09) |
| Klaim privasi menyesatkan (khas topik) | Apakah teks di aplikasi menjanjikan privasi yang tidak sesuai kenyataan? | Teks jujur soal siapa melihat apa: admin dapat melihat identitas pelapor (PRV-09); tidak ada klaim "anonim penuh" bila tidak benar |
| Default menyesatkan di form (khas topik) | Apakah default form mendorong pelapor memilih urgensi tinggi atau menyertakan data berlebih? | Urgensi tidak terpilih sebelumnya; foto dan GPS tidak wajib; peringatan "jangan menulis data pribadi orang lain" ditampilkan netral |

## Cara Menjalankan Audit
- Setiap rilis milestone, satu anggota (bukan pembuat fitur) menjalankan semua pertanyaan uji pada build terbaru.
- Hasil (lulus/gagal + tangkapan layar) disimpan di docs/01-compliance/evidence/ux-01-audit-[milestone].md.
- Baris yang gagal diperbaiki sebelum tag milestone dibuat.

## Requirement yang Lahir dari Register Ini
- UX-01: Lulus audit dark pattern pada setiap rilis.
- UX-02: Fitur opsional (GPS otomatis, notifikasi) default MATI; persetujuan bisa ditarik kapan saja dari layar Privasi & Data.
- UX-03: Teks ≥ 14sp, kontras AA, label aksesibilitas pada kontrol utama.
- UX-04: Penolakan izin tidak menghalangi fungsi inti (membuat dan mengirim laporan).