# R3 · Peta Hak Subjek Data → Fitur Aplikasi
# Aplikasi: Lapor Kampus

| Hak (UU PDP) | Fitur di Aplikasi Kami | Req ID | Milestone |
|--------------|------------------------|--------|-----------|
| Informasi (Ps. 5) | Layar "Data yang Kami Kumpulkan" saat pertama kali membuka aplikasi dan dari menu Pengaturan > Kebijakan Privasi; penjelasan singkat tujuan data tampil sebelum izin kamera dan lokasi diminta | PRV-05 | M03-M04 |
| Koreksi (Ps. 6) | Edit profil (nama, email, kata sandi, ganti PIN); pelapor dapat mengedit isi, foto, dan lokasi laporan selama statusnya masih pending (sebelum diverifikasi admin) | PRV-06 | M04 |
| Akses & salinan (Ps. 7) | "Riwayat laporan saya" (fitur utama 5) dan tombol "Unduh data saya" yang mengekspor profil dan seluruh laporan ke format portabel (JSON/CSV; foto sebagai berkas terlampir) | PRV-04 | M04 |
| Penghapusan (Ps. 8) | Pengaturan > "Hapus akun & data saya" maksimal 2 ketukan (pilih, lalu konfirmasi dengan PIN); data pribadi dihapus, laporan pending dihapus penuh, laporan yang sudah diproses dianonimkan | PRV-03 | M04 |
| Tarik persetujuan (Ps. 9) | Sakelar fitur opsional, default MATI: "Lokasi GPS otomatis" (tanpa GPS pelapor tetap bisa memilih kampus-gedung-lantai-ruang) dan "Notifikasi status laporan" (ditawarkan setelah laporan pertama terkirim) | UX-02 | M04-M05 |
| Ganti rugi / keluhan (Ps. 12) | Kanal kontak tim (email: [ISI EMAIL KONTAK TIM]) di Kebijakan Privasi dan menu "Laporkan masalah privasi" | PRV-05 | M04 |

## Cakupan Data R1 -> Hak (setiap data di R1 punya baris di sini)
Keterangan: ✔ = dilayani fitur di tabel atas; — = tidak berlaku (alasan di kolom itu).

| Data (R1) | Informasi | Koreksi | Akses & salinan | Penghapusan | Tarik persetujuan |
|-----------|-----------|---------|-----------------|-------------|-------------------|
| D01 · Nama lengkap | ✔ | ✔ edit profil | ✔ profil + unduh data | ✔ hapus akun | — wajib untuk punya akun |
| D02 · Email kampus | ✔ | ✔ ubah email (verifikasi ulang) | ✔ profil + unduh data | ✔ hapus akun | — wajib untuk login |
| D03 · Kata sandi | ✔ | ✔ ubah / reset kata sandi | — tidak pernah ditampilkan atau diekspor (hanya hash di Firebase) | ✔ hapus akun | — wajib untuk login |
| D04 · UID akun | ✔ | — dibuat sistem | ✔ unduh data | ✔ hapus akun (diganti penanda anonim di laporan yang dipertahankan) | — |
| D05 · Peran pengguna | ✔ | — ditetapkan admin; perubahan diminta lewat admin | ✔ tampil di profil | ✔ hapus akun | — |
| D06 · PIN aplikasi | ✔ | ✔ ganti PIN | — hanya hash, tidak dapat dibaca | ✔ nonaktifkan PIN / hapus akun | ✔ PIN dapat dinonaktifkan |
| D07 · Foto kerusakan | ✔ | ✔ ganti foto saat pending | ✔ riwayat + unduh data | ✔ hapus akun (pending) / retensi (diproses) | ✔ izin kamera dapat dicabut |
| D08 · Koordinat GPS | ✔ | ✔ ulangi/geser titik saat pending | ✔ riwayat + unduh data | ✔ hapus akun (pending) / retensi (diproses) | ✔ sakelar GPS (default mati) |
| D09 · Lokasi manual | ✔ | ✔ ubah saat pending | ✔ riwayat + unduh data | ✔ hapus akun (pending) / retensi (diproses) | — wajib sebagai lokasi laporan |
| D10 · Isi laporan | ✔ | ✔ edit saat pending | ✔ riwayat + unduh data | ✔ hapus akun (pending) / anonim (diproses) | — |
| D11 · Status & riwayat penanganan | ✔ | — dicatat admin/petugas; keberatan lewat kanal kontak (Ps. 12) | ✔ riwayat + unduh data | ✔ ikut laporan | — |
| D12 · Token notifikasi | ✔ | — dibuat otomatis | — identitas teknis, tidak bermakna bagi pengguna | ✔ dihapus saat notifikasi dimatikan / logout / hapus akun | ✔ sakelar Notifikasi (default mati) |

## Catatan
- Untuk aplikasi lokal murni (M01-M04), hak-hak ini adalah praktik baik. Menjadi kewajiban penuh saat M05 mengirim data ke cloud (Firebase).
- Penghapusan memakai anonimisasi untuk laporan yang sudah diproses karena laporan itu menjadi data historis anggaran (tujuan inti aplikasi). Setelah dianonimkan, laporan tidak lagi memuat identitas pelapor.

## Requirement yang Lahir dari Register Ini
- PRV-03: Pengguna dapat menghapus akun dan seluruh data pribadinya dalam maksimal 2 ketukan; laporan yang sudah diproses dianonimkan.
- PRV-04: Pengguna dapat mengekspor profil dan seluruh laporannya ke format portabel (UU PDP Ps. 7).
- PRV-05: Kebijakan privasi dan kanal kontak keluhan dapat dibuka dari dalam aplikasi (UU PDP Ps. 5 dan 12).
- PRV-06: Pengguna dapat memperbaiki data profil, dan laporan miliknya selama berstatus pending (UU PDP Ps. 6).
- UX-02: Fitur opsional (GPS otomatis, notifikasi) default mati dan dapat dimatikan kembali kapan saja (UU PDP Ps. 9).