 <h1 align="center">💳 Creedy</h1>
 <img width="6000" height="3375" alt="PPT Proposal Bisnis Presentasi Gradien Modern Biru Hijau (1)" src="https://github.com/user-attachments/assets/7199dc7e-a36f-4589-8d88-edf4bd12b98f" />

<h3 align="center">Sistem Informasi Tabungan dan Pinjaman Mikro untuk Inklusi Keuangan UMKM</h3>

<p align="center">
  <img src="https://img.shields.io/badge/SDG%201-No%20Poverty-E5243B?style=for-the-badge" />
  <img src="https://img.shields.io/badge/SDG%208-Decent%20Work-A21942?style=for-the-badge" />
  <img src="https://img.shields.io/badge/SDG%209-Industry%20%26%20Innovation-F36D25?style=for-the-badge" />
</p>

---

## 1. 📌 Nama Program

**Creedy – Sistem Informasi Tabungan dan Pinjaman Mikro**

### Anggota Kelompok Creedy:
1. Rija Aulia Mayatri 2509116011 (Kelas A)
2. Risky Farel Wijaya 2509116066 (Kelas B)
3. Syafir Ahzami 2509116074 (Kelas B)
4. Muhammad Aulia Rahman 2509116096 (Kelas C)

---

## 2. 📝 Deskripsi Singkat

**Creedy** adalah aplikasi desktop berbasis **Java** yang terintegrasi dengan **database relasional MySQL** untuk mendigitalisasi proses inti lembaga keuangan mikro, yaitu pengelolaan **nasabah, rekening tabungan, transaksi, pinjaman, dan angsuran** secara terpusat.

**Latar belakang masalah.** Akses UMKM terhadap kredit perbankan di Indonesia masih terbatas. Baru sekitar 30,5% UMKM yang mengakses kredit perbankan, dengan hambatan utama berupa ketiadaan agunan dan ketiadaan riwayat kredit sebagai dasar penilaian kelayakan. Di sisi lembaga, pencatatan tabungan, transaksi, dan angsuran yang masih manual atau terpisah-pisah membuat riwayat keuangan nasabah sulit dipakai, penilaian pinjaman menjadi lambat dan tidak seragam, serta tunggakan terlambat terdeteksi.

**Solusi.** Credy merekam riwayat setoran, transaksi, dan angsuran nasabah secara terstruktur, lalu memanfaatkannya sebagai **skor kelayakan kredit berbasis riwayat tabungan dan angsuran**. Skor ini membantu petugas kredit menilai pengajuan secara lebih cepat dan konsisten, sementara **keputusan akhir tetap berada di tangan petugas**. Setelah pinjaman cair, sistem membuat **jadwal angsuran otomatis** dan **mendeteksi tunggakan serta denda** sehingga risiko gagal bayar dapat dipantau lebih dini.

**Rumusan masalah:** *Bagaimana merancang sistem informasi berbasis database yang mencatat tabungan, transaksi, pinjaman, dan angsuran nasabah mikro secara terpusat, sehingga riwayat keuangan dapat dipakai sebagai dasar penilaian kelayakan kredit yang cepat, terstandar, dan terpantau?*

**Keterkaitan SDGs:** SDG 1 *No Poverty* (utama), SDG 8 *Decent Work and Economic Growth*, dan SDG 9 *Industry, Innovation, and Infrastructure*.

**Dampak yang diharapkan:**

| Pihak | Dampak |
|---|---|
| 👤 Nasabah / UMKM | Memiliki rekam jejak keuangan terstruktur yang dapat menjadi bukti kelayakan untuk pinjaman atau plafon lebih besar, serta dapat melihat saldo dan mengajukan pinjaman sendiri. |
| 🏦 Credy | Keputusan kredit lebih berbasis data dengan kriteria seragam antarpetugas, pencatatan transaksi lebih akurat, dan tunggakan terdeteksi otomatis. |
| 🌏 Masyarakat | Memperluas inklusi keuangan melalui layanan keuangan formal yang lebih cepat dan terorganisasi, sebagai alternatif dari pinjaman informal. |

---

## 3. ✨ Fitur Utama Program

Sistem memiliki **4 peran pengguna** dengan hak akses berbeda.

### 🔐 Fitur Umum (Semua Role)
- Login / Logout
- Ganti password
- Lihat profil

### 🛠️ Admin
| No | Fitur |
|---|---|
| 1 | CRUD akun petugas (Teller dan Petugas Kredit) |
| 2 | CRUD cabang |
| 3 | CRUD jenis rekening |

### 🧾 Teller
| No | Fitur |
|---|---|
| 1 | Create, Read, Update data nasabah |
| 2 | Buka dan tutup rekening |
| 3 | Setor dan tarik tunai (offline / di kantor cabang) |
| 4 | Isi saldo nasabah |

### 📊 Petugas Kredit
| No | Fitur |
|---|---|
| 1 | Lihat data nasabah (hanya baca) |
| 2 | Input pengajuan pinjaman (membantu nasabah) |
| 3 | Tinjau pengajuan beserta skor kelayakan |
| 4 | Setujui atau tolak pengajuan disertai catatan keputusan |
| 5 | Cairkan pinjaman dengan jadwal angsuran otomatis |
| 6 | Pantau tunggakan dan denda dalam satu layar |

### 👥 Nasabah
| No | Fitur |
|---|---|
| 1 | Lihat daftar rekening dan saldo |
| 2 | Ajukan pinjaman |
| 3 | Pantau status pengajuan dan batalkan pengajuan |
| 4 | Lihat jadwal angsuran dan denda |
| 5 | Bayar angsuran dari saldo rekening |
| 6 | Transfer antar rekening |

### ⚙️ Aturan Bisnis Penting
- Skor kelayakan dihitung dari riwayat tabungan dan angsuran nasabah; keputusan akhir tetap oleh petugas kredit.
- Pengajuan yang melebihi **batas persetujuan** petugas (`Rp0`, `100 Juta`, atau `500 Juta`) langsung ditolak.
- Pinjaman yang disetujui dicairkan **satu kali secara penuh**, dana masuk ke rekening nasabah dan **jadwal angsuran dibuat otomatis**.
- Angsuran yang melewati jatuh tempo ditandai **Terlambat** dan dikenai **denda**.
- Pembayaran angsuran mengambil **angsuran tertua yang belum lunas** dari saldo; status pinjaman menjadi **Lunas** setelah seluruh angsuran terbayar.
- Penarikan dan transfer hanya diproses bila saldo mencukupi dan rekening berstatus aktif.
- Setiap mutasi dicatat pada tabel transaksi beserta `saldo_setelah` agar saldo akurat dan dapat ditelusuri.

---

## 4. 🧰 Tech Stack

| Kategori | Teknologi |
|---|---|
| Bahasa | **Java 17** |
| Antarmuka (GUI) | **Java Swing** — dirancang dengan *GUI Builder* **Apache NetBeans** (pasangan `.java` + `.form`) |
| Look & Feel | **FlatLaf 3.4.1** |
| Database | **MySQL 8** |
| Server Database | **XAMPP** (MySQL) dan **phpMyAdmin** |
| Konektor DB | **MySQL Connector/J 8.4.0** (JDBC, `PreparedStatement`) |
| Framework | **Tidak ada** |
| Arsitektur | **MVC** + pola **DAO** |
| Perancangan ERD | Oracle SQL Developer Data Modeler |
| Perancangan Flowchart & Use Case | draw.io (diagrams.net) |
| Version Control | Git dan GitHub |

**Database:** `pa_creedy` (8 tabel: `users`, `nasabah`, `pegawai`, `cabang`, `rekening`, `transaksi`, `pinjaman`, `jadwal_angsuran`).

**Cara import database:**
1. Jalankan **Apache** dan **MySQL** pada XAMPP.
2. Buka `http://localhost/phpmyadmin`.
3. Buat database baru bernama `pa_creedy`.
4. Pilih tab **Import**, lalu pilih file `database/pa_creedy.sql` dan klik **Go**.

---

## 5. 🧩 Perancangan Sistem

Perancangan sistem Credy terdiri dari **Flowchart**, **Use Case Diagram**, dan **Entity Relationship Diagram (ERD)**. Seluruh flowchart dapat dilihat lengkap pada https://drive.google.com/file/d/1Uv5dLBRBI0Ngna2bKNkf2tlZe3uus6uR/view?usp=sharing

### 1. 🔄 Flowchart Program

Flowchart dibagi per modul sesuai peran pengguna. Pada masing-masing modul, alur berpindah antarhalaman menggunakan *off-page connector*.

<details>
<summary><b>🔑 Flowchart Halaman Login</b></summary>

<br>

<p align="center">
  <img width="3130" height="3475" alt="image" src="https://github.com/user-attachments/assets/006b4851-9b15-4c89-9d4c-df6f440d59be" />
</p>

**Deskripsi:** Modul ini menjadi pintu masuk (*entry point*) autentikasi dan otorisasi. Sistem memvalidasi identitas lalu mengarahkan pengguna ke dashboard sesuai hak aksesnya.

**Alur kerja:**
1. Pengguna memasukkan kredensial (email/NIP dan password) pada form login.
2. Sistem memvalidasi kredensial ke database pengguna.
3. Jika gagal, sistem menampilkan pesan kesalahan dan kembali ke form login.
4. Jika berhasil, sistem mengidentifikasi peran pengguna (Admin, Teller, Petugas Kredit, atau Nasabah) lalu mengarahkan ke dashboard yang sesuai.
5. Fitur profil, ganti password, dan logout dapat diakses oleh semua peran yang telah terautentikasi.

</details>

<details>
<summary><b>🛠️ Flowchart Halaman Admin</b></summary>

<br>

<p align="center">
  <img width="2498" height="4346" alt="image" src="https://github.com/user-attachments/assets/1426761c-5a63-4e5b-9f4e-9baee57b6ac5" />
</p>

**Deskripsi:** Modul Admin berfokus pada pengelolaan data master dan konfigurasi organisasi tanpa menangani transaksi uang tunai.

**Alur kerja:**
1. **Kelola akun petugas (CRUD):** menambah, mengubah, dan menonaktifkan akun Teller dan Petugas Kredit.
2. **Kelola cabang (CRUD):** mengatur kantor cabang tempat pegawai ditugaskan.
3. **Kelola jenis rekening (CRUD):** menetapkan jenis rekening yang berlaku di sistem.
4. Setiap operasi *Create/Update* dilengkapi validasi untuk mencegah duplikasi data sebelum disimpan.

</details>

<details>
<summary><b>🧾 Flowchart Halaman Teller</b></summary>

<br>

<p align="center">
  <img width="2394" height="4201" alt="image" src="https://github.com/user-attachments/assets/1a0f9da3-bb8d-4429-a592-bff59688c534" />
</p>

**Deskripsi:** Modul Teller menangani transaksi keuangan langsung dan administrasi rekening nasabah di kantor cabang.

**Alur kerja:**
1. **Registrasi dan pembaruan nasabah (CRU):** mencatat nasabah baru atau memperbarui data yang ada.
2. **Manajemen rekening:** membuka rekening baru atau menutup rekening atas permintaan nasabah.
3. **Transaksi finansial:** teller memasukkan nomor rekening, sistem memverifikasi status rekening aktif, lalu:
   - **Setor tunai:** saldo ditambah dan mutasi dicatat.
   - **Tarik tunai:** sistem memeriksa kecukupan saldo sebelum saldo dipotong.
4. **Bukti transaksi:** setelah transaksi tersimpan, sistem menerbitkan struk sebagai bukti.

</details>

<details>
<summary><b>📊 Flowchart Halaman Petugas Kredit</b></summary>

<br>

<p align="center">
  <img width="9226" height="4786" alt="image" src="https://github.com/user-attachments/assets/2cd60bf3-e6a1-4100-b144-1c3a853c26c7" />
</p>

**Deskripsi:** Modul Petugas Kredit menangani layanan pinjaman, mulai dari pengajuan, penilaian kelayakan, keputusan, pencairan, hingga pemantauan tunggakan.

**Alur kerja:**
1. **Informasi nasabah:** melihat identitas dan ringkasan pinjaman nasabah (hanya baca).
2. **Bantuan pengajuan:** membantu nasabah mengisi data pinjaman; setelah diperiksa dan dikonfirmasi, pengajuan disimpan.
3. **Peninjauan dan keputusan:** menilai pengajuan berdasarkan skor kelayakan, lalu menyetujui atau menolak disertai catatan. Pengajuan di atas batas persetujuan petugas langsung ditolak.
4. **Pencairan:** pengajuan yang disetujui dicairkan satu kali penuh; sistem menambah saldo nasabah, mencatat transaksi pencairan, dan membuat jadwal angsuran otomatis.
5. **Pemantauan tunggakan:** sistem menampilkan nasabah dengan angsuran lewat jatuh tempo, rincian pinjaman, jumlah tunggakan, dan denda dalam satu layar.
6. Petugas dapat kembali ke menu atau logout.

</details>

<details>
<summary><b>👥 Flowchart Halaman Nasabah</b></summary>

<br>

<p align="center">
  <img width="10276" height="5006" alt="image" src="https://github.com/user-attachments/assets/f85ffbff-3e85-4d35-98b1-2ef8ebc8793b" />
</p>

**Deskripsi:** Modul Nasabah menyediakan layanan mandiri untuk melihat rekening, mengajukan dan memantau pinjaman, membayar angsuran, dan transfer dana.

**Alur kerja:**
1. **Informasi rekening:** melihat daftar rekening dan saldo.
2. **Pengajuan pinjaman:** mengisi jumlah, jangka waktu, tujuan, dan rekening pencairan; setelah dikonfirmasi, pengajuan diteruskan ke Petugas Kredit.
3. **Pemantauan pengajuan:** melihat status dan catatan keputusan petugas.
4. **Jadwal angsuran:** melihat jatuh tempo, tagihan, status pembayaran, dan denda.
5. **Bayar angsuran:** membayar angsuran tertua yang belum lunas dari saldo; sistem memeriksa saldo, memproses pembayaran beserta denda (jika ada), lalu menampilkan bukti. Pinjaman berstatus **Lunas** setelah semua angsuran terbayar.
6. **Transfer dana:** memilih rekening sumber, mengisi rekening tujuan dan nominal, mengonfirmasi, lalu sistem memeriksa rekening dan saldo sebelum memindahkan dana dan menampilkan bukti transfer.
7. Nasabah dapat kembali ke menu atau logout.

</details>

📎 **Link Flowchart:** (https://drive.google.com/file/d/1Uv5dLBRBI0Ngna2bKNkf2tlZe3uus6uR/view?usp=sharing)

---

### 2. 👤 Use Case Diagram

<p align="center">
  <img width="1184" height="1542" alt="image" src="https://github.com/user-attachments/assets/fed53301-4388-46ac-bc35-01b32bf2e58f" />
</p>

Sistem memiliki **4 aktor** dengan hak akses sebagai berikut.

| Aktor | Use Case |
|---|---|
| **Semua role** | Login/logout, ganti password, lihat profil |
| **Admin** | Kelola akun petugas, kelola cabang, kelola jenis rekening |
| **Teller** | Kelola data nasabah (CRU), buka/tutup rekening, setor dan tarik tunai, isi saldo nasabah |
| **Petugas Kredit** | Lihat data nasabah, input pengajuan pinjaman, tinjau pengajuan dan skor kelayakan, setujui/tolak, cairkan pinjaman dan buat jadwal angsuran, pantau tunggakan dan denda |
| **Nasabah** | Lihat rekening dan saldo, ajukan pinjaman, pantau/batalkan pengajuan, lihat jadwal angsuran dan denda, bayar angsuran, transfer |

---

### 3. 🗄️ Entity Relationship Diagram (ERD)

#### a. ERD Logical

<p align="center">
  <img width="931" height="1091" alt="Logicalppt" src="https://github.com/user-attachments/assets/4d20f1ad-e71b-4d53-84ed-4c6d4cf80ec7" />
</p>

#### b. ERD Relational

<p align="center">
  <img width="1107" height="1216" alt="Relational_1ppt" src="https://github.com/user-attachments/assets/0f420507-a308-402e-b150-b89cff261ba6" />
</p>

#### c. Entitas dan Atribut

| Entitas | Fungsi | Atribut Utama |
|---|---|---|
| **Users** *(supertype)* | Menyimpan seluruh akun yang dapat login ke sistem | `user_id` (PK), `email`, `password`, `nama_lengkap`, `status`, `user_type` |
| **Nasabah** *(subtype)* | Profil khusus pengguna bertipe nasabah | `user_id` (PK, FK), `nik`, `npwp`, `tipe_nasabah`, `alamat`, `no_telepon`, `tanggal_daftar` |
| **Pegawai** *(subtype)* | Profil khusus staf internal (Admin, Teller, Petugas Kredit) | `user_id` (PK, FK), `nip`, `jabatan`, `batas_persetujuan`, `cabang_id` (FK) |
| **Cabang** | Data kantor cabang operasional | `cabang_id` (PK), `nama_cabang`, `alamat`, `no_telepon` |
| **Rekening** | Rekening tabungan milik nasabah | `nomor_rekening` (PK), `jenis_rekening`, `saldo`, `status_rekening`, `tanggal_buka`, `tanggal_tutup`, `cabang_id` (FK), `nasabah_user_id` (FK) |
| **Transaksi** | Riwayat mutasi keuangan, termasuk pencairan dan pembayaran angsuran | `transaksi_id` (PK), `jenis_transaksi`, `jumlah`, `saldo_setelah`, `channel`, `waktu_transaksi`, `keterangan`, `nomor_rekening` (FK), `pegawai_user_id` (FK), `pinjaman_id` (FK), `angsuran_id` (FK) |
| **Pinjaman** | Pengajuan, keputusan, hingga pinjaman aktif | `pinjaman_id` (PK), `jumlah_pinjaman`, `tenor_bulan`, `suku_bunga`, `tujuan_pinjaman`, `skor_kelayakan`, `status`, `tanggal_pengajuan`, `tanggal_keputusan`, `catatan_keputusan`, `tanggal_cair`, `nasabah_user_id` (FK), `pegawai_user_id` (FK) |
| **Jadwal_Angsuran** | Rincian cicilan bulanan atas pinjaman yang dicairkan | `angsuran_id` (PK), `sisa_angsuran`, `tanggal_jatuh_tempo`, `pokok_angsuran`, `bunga_angsuran`, `denda`, `status_pembayaran`, `pinjaman_id` (FK) |

**Nilai enumerasi penting:**

| Kolom | Nilai |
|---|---|
| `users.user_type` | Nasabah, Pegawai |
| `nasabah.tipe_nasabah` | Perorangan, Badan Usaha |
| `pegawai.batas_persetujuan` | Rp0, 100 Juta, 500 Juta |
| `rekening.jenis_rekening` | Tabungan, Giro, Deposito |
| `rekening.status_rekening` | Aktif, Dormant, Ditutup |
| `transaksi.jenis_transaksi` | Setoran Tunai, Penarikan Tunai, Transfer, Pencairan Pinjaman, Pembayaran Angsuran |
| `transaksi.channel` | Teller, ATM, Mobile Banking, Internet Banking |
| `pinjaman.status` | Diajukan, Disetujui, Ditolak, Aktif, Lunas |
| `jadwal_angsuran.status_pembayaran` | Belum Bayar, Lunas, Terlambat |

#### d. Relasi dan Kardinalitas

| No | Relasi | Kardinalitas | Alasan Logis |
|---|---|---|---|
| 1 | Users → Nasabah / Pegawai | 1 : 0..1 | Users menjadi supertype; setiap akun adalah nasabah atau pegawai sehingga identitas login tidak diduplikasi. |
| 2 | Cabang → Pegawai | 1 : N | Satu cabang memiliki banyak pegawai; setiap pegawai bertugas di satu cabang. |
| 3 | Cabang → Rekening | 1 : N | Satu cabang dapat membuka banyak rekening; setiap rekening dibuka di satu cabang. |
| 4 | Nasabah → Rekening | 1 : N | Satu nasabah dapat memiliki beberapa rekening tanpa mengulang data identitas. |
| 5 | Nasabah → Pinjaman | 1 : N | Riwayat pengajuan dan pinjaman nasabah tersimpan tanpa mengulang identitas. |
| 6 | Pegawai → Pinjaman | 1 : N (opsional) | Menelusuri pegawai yang memutuskan pinjaman; kosong selama pengajuan belum diputuskan. |
| 7 | Rekening → Transaksi | 1 : N | Setiap mutasi merujuk satu rekening sehingga riwayat saldo dapat ditelusuri. |
| 8 | Pegawai → Transaksi | 1 : N (opsional) | Mencatat teller yang melayani; kosong untuk transaksi mandiri (ATM / mobile / internet banking). |
| 9 | Pinjaman → Transaksi | 1 : N (opsional) | Menghubungkan transaksi pencairan dengan pinjaman terkait. |
| 10 | Pinjaman → Jadwal_Angsuran | 1 : N | Satu pinjaman memiliki banyak angsuran bulanan yang dicatat terpisah. |
| 11 | Jadwal_Angsuran → Transaksi | 1 : 0..1 | Satu angsuran dibayar melalui paling banyak satu transaksi; kosong bila belum dibayar. |

---

## 6. 🗂️ Struktur Folder / Package

### 6.1 Struktur Folder Proyek

> ✏️ *Isi: tempel struktur folder proyek (pohon direktori) di dalam blok kode di bawah.*

```text

```

### 6.2 Penjelasan Package

#### 📦 Package `model`
> ✏️ *Isi: fungsi package dan daftar class di dalamnya.*

#### 📦 Package `view`
> ✏️ *Isi: fungsi package dan daftar class/form GUI di dalamnya.*

#### 📦 Package `controller`
> ✏️ *Isi: fungsi package dan daftar class di dalamnya.*

#### 📦 Package `dao`
> ✏️ *Isi: fungsi package dan daftar class di dalamnya.*

#### 📦 Package `koneksi` / `util`
> ✏️ *Isi: fungsi package dan daftar class di dalamnya.*

#### 🖼️ Folder `resources` / `images`
> ✏️ *Isi: aset yang disimpan di folder ini.*

#### 📚 Libraries
> ✏️ *Isi: daftar file .jar yang digunakan (FlatLaf, MySQL Connector/J, dll).*

### 6.3 Penerapan Arsitektur MVC + DAO

> ✏️ *Isi: penjelasan singkat pembagian peran Model, View, Controller, dan DAO pada program.*

---

## 7. 🧱 Penjelasan Penerapan 4 Pilar OOP

### 7.1 Encapsulation (Enkapsulasi)

**Konsep:**
> ✏️ *Isi: penjelasan singkat konsep.*

#### 📁 Contoh 1: `NamaClass.java`
> ✏️ *Isi: potongan kode (blok ```java) dan penjelasan penerapannya.*

#### 📁 Contoh 2: `NamaClass.java`
> ✏️ *Isi: potongan kode dan penjelasan.*

**Kesimpulan:**
> ✏️ *Isi: ringkasan penerapan enkapsulasi pada program.*

---

### 7.2 Inheritance (Pewarisan)

**Konsep:**
> ✏️ *Isi: penjelasan singkat konsep.*

#### 📁 Contoh 1: `NamaClass.java`
> ✏️ *Isi: potongan kode dan penjelasan penerapannya.*

#### 📁 Contoh 2: `NamaClass.java`
> ✏️ *Isi: potongan kode dan penjelasan.*

#### 🌳 Hierarki Pewarisan
> ✏️ *Isi: diagram atau gambar hierarki class (boleh memakai Mermaid `classDiagram`).*

**Kesimpulan:**
> ✏️ *Isi: ringkasan penerapan inheritance pada program.*

---

### 7.3 Abstraction (Abstraksi)

**Konsep:**
> ✏️ *Isi: penjelasan singkat konsep.*

#### 📁 Contoh 1: `NamaClass.java` / `NamaInterface.java`
> ✏️ *Isi: potongan kode (abstract class / interface) dan penjelasan penerapannya.*

#### 📁 Contoh 2: `NamaClass.java`
> ✏️ *Isi: potongan kode dan penjelasan.*

**Kesimpulan:**
> ✏️ *Isi: ringkasan penerapan abstraksi pada program.*

---

### 7.4 Polymorphism (Polimorfisme)

**Konsep:**
> ✏️ *Isi: penjelasan singkat konsep.*

#### 📁 Contoh 1: Method Overriding pada `NamaClass.java`
> ✏️ *Isi: potongan kode dan penjelasan penerapannya.*

#### 📁 Contoh 2: Method Overloading / Dynamic Dispatch pada `NamaClass.java`
> ✏️ *Isi: potongan kode dan penjelasan.*

**Kesimpulan:**
> ✏️ *Isi: ringkasan penerapan polimorfisme pada program.*

---

### 7.5 Ringkasan Penerapan 4 Pilar OOP

| Pilar OOP | Class / File yang Menerapkan | Keterangan |
|---|---|---|
| Encapsulation | | |
| Inheritance | | |
| Abstraction | | |
| Polymorphism | | |

---

## 8. 🖥️ Cara Penggunaan Program

### 8.1 Prasyarat

> ✏️ *Isi: perangkat lunak yang harus terpasang (JDK 17, XAMPP, NetBeans, dll).*

### 8.2 Instalasi dan Konfigurasi

#### 📥 Langkah 1: Clone Repository
> ✏️ *Isi: perintah `git clone` dan langkah membuka proyek di NetBeans.*

#### 🗄️ Langkah 2: Import Database
> ✏️ *Isi: langkah import `database/pa_creedy.sql` melalui phpMyAdmin.*

#### ⚙️ Langkah 3: Konfigurasi Koneksi Database
> ✏️ *Isi: file dan nilai yang perlu disesuaikan (host, port, user, password).*

#### ▶️ Langkah 4: Menjalankan Program
> ✏️ *Isi: class utama (main) dan cara menjalankannya.*

### 8.3 Akun untuk Uji Coba

| Role | Email / Username | Password |
|---|---|---|
| Admin | | |
| Teller | | |
| Petugas Kredit | | |
| Nasabah | | |

### 8.4 Panduan Penggunaan per Halaman

<details>
<summary><b>🔑 Halaman Login</b></summary>

<br>

> ✏️ *Isi: screenshot GUI dan penjelasan fungsi halaman.*

**Fitur pada halaman ini:**
1. Login
2. Pesan kesalahan bila kredensial salah

</details>

<details>
<summary><b>🛠️ Halaman Admin</b></summary>

<br>

> ✏️ *Isi: screenshot dashboard Admin dan penjelasan.*

**Fitur pada halaman ini:**
1. Kelola Akun Petugas
2. Kelola Cabang
3. Kelola Jenis Rekening
4. Lihat Profil dan Ganti Password
5. Logout

</details>

<details>
<summary><b>🧾 Halaman Teller</b></summary>

<br>

> ✏️ *Isi: screenshot dashboard Teller dan penjelasan.*

**Fitur pada halaman ini:**
1. Kelola Data Nasabah (Tambah, Lihat, Ubah)
2. Buka dan Tutup Rekening
3. Setor Tunai
4. Tarik Tunai
5. Isi Saldo Nasabah
6. Lihat Profil dan Ganti Password
7. Logout

</details>

<details>
<summary><b>📊 Halaman Petugas Kredit</b></summary>

<br>

> ✏️ *Isi: screenshot dashboard Petugas Kredit dan penjelasan.*

**Fitur pada halaman ini:**
1. Lihat Data Nasabah
2. Input Pengajuan Pinjaman
3. Tinjau Pengajuan dan Skor Kelayakan
4. Setujui / Tolak Pengajuan
5. Cairkan Pinjaman dan Jadwal Angsuran Otomatis
6. Pantau Tunggakan dan Denda
7. Lihat Profil dan Ganti Password
8. Logout

</details>

<details>
<summary><b>👥 Halaman Nasabah</b></summary>

<br>

> ✏️ *Isi: screenshot dashboard Nasabah dan penjelasan.*

**Fitur pada halaman ini:**
1. Lihat Rekening dan Saldo
2. Ajukan Pinjaman
3. Pantau Status dan Batalkan Pengajuan
4. Lihat Jadwal Angsuran dan Denda
5. Bayar Angsuran
6. Transfer
7. Lihat Profil dan Ganti Password
8. Logout

</details>

---

## 9. 👨‍💻 Kontributor

| No | Nama | NIM |
|---|---|---|
| 1 | Rija Aulia Mayatri | 2509116011 |
| 2 | Risky Farel Wijaya | 2509116066 |
| 3 | Syafir Ahzami | 2509116074 |
| 4 | Muhammad Aulia Rahman | 2509116096 |

**Program Studi Sistem Informasi, Fakultas Teknik, Universitas Mulawarman — 2026**
