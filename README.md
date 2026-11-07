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

> ✏️ 





### 6.2 Penjelasan Package

#### 📦 Package `model`
> ✏️ Berfungsi untuk mendefinisikan blueprint (cetak biru) dari entitas data yang ada di database menjadi objek Java (representasi tabel ke objek). Daftar class di dalamnya meliputi AkunData.java, Nasabah.java, Pegawai.java, User.java, dan UserSession.java.


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

Siapkan perangkat lunak berikut agar Creedy dapat dibuka dan terhubung ke database.

| Perangkat lunak | Versi yang dibutuhkan |
|---|---|
| JDK | **Java 26**; dapat menggunakan **Temurin 26.0.2** |
| MySQL | **MySQL 8**, menggunakan **8.0.30** |
| Laragon / XAMPP | **Laragon 6.0.0** atau lingkungan XAMPP dengan server MySQL 8 yang sesuai |
| Apache NetBeans | **31**, atau IDE lain yang mendukung Java 26 dan proyek Maven |
| Apache Maven | **3.9.16**, tersedia bersama NetBeans |
| Git | Untuk menyalin repository |
| Browser dan phpMyAdmin | Untuk membuka halaman pengelolaan dan mengimpor database |

**FlatLaf 3.8**, **MySQL Connector/J 8.3.0**, dan **AbsoluteLayout RELEASE220** diunduh otomatis melalui Maven. Sediakan koneksi internet saat membuka proyek untuk pertama kali.

### 8.2 Instalasi dan Konfigurasi

#### 📥 Langkah 1: Clone Repository

Buka terminal pada folder penyimpanan proyek, lalu jalankan:

```bash
git clone https://github.com/nawanamamaya/PA-PBO-CREEDY.git
```

Di NetBeans, pilih **File → Open Project**, lalu buka folder yang berisi `pom.xml`. Pada susunan folder proyek ini, pilih `PA-PBO-CREEDY/PA-PBO-CREEDY-main/PA-PBO-CREEDY-main/`, kemudian tunggu sampai proyek dan pustaka pendukung selesai dimuat.

#### 🗄️ Langkah 2: Import Database

1. Jalankan **Apache** dan **MySQL** melalui Laragon atau XAMPP, kemudian buka phpMyAdmin melalui menu database atau alamat `http://localhost/phpmyadmin`.
2. Buat database kosong bernama **`pa_creedy`**, lalu pilih database tersebut sebagai tujuan import.
3. Buka tab **Import**, pilih file **`pa_creedy (4).sql`** di folder utama repository, kemudian klik **Go / Kirim**.
4. Setelah proses selesai, pastikan delapan tabel muncul pada daftar database sebelum melanjutkan ke konfigurasi koneksi.

#### ⚙️ Langkah 3: Konfigurasi Koneksi Database

Buka **`src/main/java/database/Koneksi.java`** dari folder proyek yang berisi `pom.xml`. Gunakan pengaturan berikut untuk koneksi awal:

| Pengaturan | Nilai default |
|---|---|
| Host | `127.0.0.1` |
| Port | `3306` |
| Database | `pa_creedy` |
| User | `root` |
| Password | Kosong (`""`) |
| URL JDBC | `jdbc:mysql://127.0.0.1:3306/pa_creedy?connectTimeout=5000&socketTimeout=15000` |

Sesuaikan pengaturan apabila alamat server, port, nama database, atau akun MySQL yang digunakan berbeda. Nilai koneksi juga dapat ditentukan melalui properti **`creedy.db.url`**, **`creedy.db.user`**, dan **`creedy.db.password`** pada opsi VM konfigurasi Run, misalnya:

```text
-Dcreedy.db.url="jdbc:mysql://127.0.0.1:3306/pa_creedy?connectTimeout=5000&socketTimeout=15000" -Dcreedy.db.user=root -Dcreedy.db.password=""
```

#### ▶️ Langkah 4: Menjalankan Program

Pastikan proyek menggunakan **JDK 26**. Buka **`src/main/java/main/Main.java`**, lalu klik kanan **Run File** atau tekan **Shift+F6** di NetBeans; halaman Login akan menjadi tampilan awal Creedy.

### 8.3 Akun untuk Uji Coba

| Role | Email / Username | Password |
|---|---|---|
| Admin | `admin.cbg01@creedy.co.id` | `K24L3Bjt8v` |
| Teller | `teller.cbg01@creedy.co.id` | `V5yMcpXYtf` |
| Petugas Kredit | `kredit.cbg01@creedy.co.id` | `TvcwtH7f64` |
| Nasabah | `joko@gmail.com` | `xD3sjrtY8c` |

Akun pada tabel merupakan data uji coba dari `pa_creedy (4).sql`; akun Joko Susilo memiliki rekening aktif `1001000001` dengan saldo awal Rp15.000.000.

### 8.4 Panduan Penggunaan per Halaman

Creedy menyediakan halaman Login dan registrasi Nasabah, kemudian mengarahkan pengguna ke menu sesuai perannya. **Admin** mengelola administrasi, **Teller** melayani nasabah dan rekening, **Petugas Kredit** menangani layanan pinjaman, sedangkan **Nasabah** mengakses rekening serta pinjamannya sendiri. Gunakan akun pada bagian 8.3 untuk mencoba setiap peran secara bergantian.

<details>
<summary><b>🔑 Halaman Login</b></summary>

<br>

<img width="816" alt="Halaman Login Creedy" src="https://github.com/user-attachments/assets/8ddfa1ab-19e1-4dfb-9a57-53e0b16ba16c" />

Halaman Login menjadi pintu masuk ke layanan Creedy. Pilihan peran membantu pengguna membuka menu yang sesuai, sementara tautan pendaftaran di bagian bawah tersedia bagi Nasabah yang ingin membuat akun sebelum menggunakan layanan rekening dan pinjaman.

**Fitur pada halaman ini:**

1. **Login.** Pilih **Nasabah**, **Teller**, **Admin**, atau **Petugas Kredit**, kemudian isi identitas pada kolom **Email** dan masukkan **Password**. Nasabah dapat memakai email atau NIK, sedangkan pegawai dapat memakai email atau NIP; klik **Masuk** untuk membuka menu sesuai peran akun yang aktif.

2. **Pesan kesalahan bila kredensial salah.** Apabila identitas, password, atau peran tidak sesuai, halaman menampilkan pesan **“Login gagal. Periksa identitas, password, peran, dan status akun.”** Tutup pesan dengan **OK**, lengkapi kembali isian, lalu coba masuk menggunakan peran yang tepat dan penulisan password yang sesuai, termasuk huruf besar dan kecil.

   <img width="816" alt="Pesan Login Gagal" src="https://github.com/user-attachments/assets/106fcbff-a7f1-4b7a-9dc0-b76a1785b7e7" />

3. **Registrasi Nasabah.** Klik **Daftar di sini**, lalu isi nama lengkap, NIK sepanjang 16 karakter, nomor HP, email, alamat, password, dan NPWP jika ada, serta pilih **Perorangan** atau **Badan Usaha**. Klik **Daftar Sekarang** untuk membuat akun dan kembali ke Login, atau **Masuk di sini** jika sudah memiliki akun; setelah terdaftar, layanan pembukaan rekening dapat dilanjutkan melalui Teller.

   <img width="816" alt="Registrasi Akun Nasabah" src="https://github.com/user-attachments/assets/3fdb0953-8772-41b0-a1c7-0f28b458de54" />

</details>

<details>
<summary><b>🛠️ Halaman Admin</b></summary>

<br>

<img width="816" alt="Halaman Admin dan Data Cabang" src="https://github.com/user-attachments/assets/175ae150-20ff-4bb1-8dbb-b0a62d8cba78" />

Halaman Admin digunakan untuk mengelola administrasi kantor cabang dan akun pegawai. Tampilan awal memuat daftar cabang beserta form pengisiannya, sedangkan menu di sebelah kiri menghubungkan pengguna ke **Kelola Akun Pegawai**, **Kelola Kantor Cabang**, dan **Kelola Jenis Rekening**.

**Fitur pada halaman ini:**

1. **Kelola Akun Petugas.** Buka **Kelola Akun Pegawai**, isi **NIP**, **Password**, **Nama**, dan **Role** berupa Teller atau Petugas Kredit, kemudian klik **Tambahkan Akun**. Untuk memperbarui pegawai, pilih baris pada tabel, ubah isian yang diperlukan, lalu klik **Simpan Perubahan**; kosongkan password jika ingin mempertahankan password sebelumnya. Untuk menonaktifkan akses, pilih pegawai, klik **Nonaktifkan Akun**, dan setujui konfirmasi agar statusnya menjadi **Tidak Aktif**.

   <img width="816" alt="Kelola Akun Pegawai" src="https://github.com/user-attachments/assets/cd7a21b9-3906-4aec-83c5-b63a80a48ea7" />

   <img width="816" alt="Tombol tindakan pada akun pegawai" src="https://github.com/user-attachments/assets/f676198f-14a0-4b64-b5ab-ae7d660fe88c" />

2. **Kelola Cabang.** Buka **Kelola Kantor Cabang**, isi **Wilayah Cabang** dengan nama cabang, kemudian lengkapi **Alamat** dan **Nomor Telepon** sebelum menekan **Tambah**. Daftar cabang tampil pada tabel di bawah form dan dapat digunakan untuk memilih data yang ingin dilihat. Untuk memperbarui isian, pilih baris cabang dan gunakan **Simpan Perubahan Cabang**, atau klik **Bersihkan** untuk mengosongkan form.

3. **Lihat Jenis Rekening.** Buka **Kelola Jenis Rekening** untuk melihat ringkasan **Tabungan**, **Giro**, dan **Deposito** pada tabel. Bandingkan informasi **Setoran Awal**, **Saldo Minimal**, dan **Limit Tarik Tunai** untuk mengenali jenis rekening yang ditampilkan, kemudian gunakan menu samping untuk kembali ke pengelolaan cabang atau pegawai.

   <img width="816" alt="Kelola Jenis Rekening" src="https://github.com/user-attachments/assets/7a442d63-9153-411c-97ba-76b6298567cc" />

4. **Lihat Profil.** Klik ikon pengguna untuk membuka identitas Admin yang sedang masuk. Halaman profil menampilkan **User ID**, **NIP**, **Jabatan**, **Asal Cabang**, dan **Nama Lengkap**; gunakan **Kembali** setelah selesai melihat informasi tersebut.

   <img width="816" alt="Profil Admin" src="https://github.com/user-attachments/assets/25f76563-c7d3-40bd-9bda-18dc1094a524" />

5. **Logout.** Klik **Keluar** pada menu samping, kemudian pilih **Yes / Ya** untuk mengakhiri penggunaan akun dan kembali ke Login. Pilih **No / Tidak** apabila ingin tetap menggunakan halaman Admin.

   <img width="816" alt="Konfirmasi Logout" src="https://github.com/user-attachments/assets/217b5dcd-ddec-4605-a15d-5cc64157b26b" />

</details>

<details>
<summary><b>🧾 Halaman Teller</b></summary>

<br>

<img width="816" alt="Halaman Teller dan Data Nasabah" src="https://github.com/user-attachments/assets/e493d828-53a8-4097-afb5-52ab45a65965" />

Halaman Teller membantu pelayanan nasabah di kantor cabang, mulai dari pengisian data diri sampai layanan rekening dan transaksi tunai. Menu samping menyediakan **Kelola Data Nasabah**, **Buka Rekening Baru**, **Tutup Rekening**, **Tarik Tunai**, **Setor Tunai**, sehingga Teller dapat berpindah sesuai kebutuhan layanan.

**Fitur pada halaman ini:**

1. **Kelola Data Nasabah (Tambah, Lihat, Ubah).** Isi **NIK**, **Nama Lengkap**, **Email**, **Alamat**, **Nomor Telepon**, dan **Password**, lalu klik **Tambah** untuk mendaftarkan Nasabah. Untuk melihat atau memperbarui data, klik baris Nasabah pada tabel, sesuaikan isian, kemudian tekan **Simpan Perubahan**. Gunakan **Bersihkan** ketika ingin mengosongkan form setelah selesai melayani satu Nasabah.

2. **Buka dan Tutup Rekening.** Buka **Buka Rekening Baru**, pilih Nasabah dari tabel agar NIK dan nomor rekening terisi, pilih **Giro**, **Tabungan**, atau **Deposito**, lalu masukkan **Setoran Awal** minimal **Rp50.000** dan klik **Buka Rekening**. Halaman menampilkan pemberitahuan pembukaan rekening beserta nomor dan saldo awalnya. Untuk penutupan, pilih menu **Tutup Rekening**, klik rekening pada tabel, tekan **Tutup Rekening**, lalu setujui konfirmasi nomor rekening yang ditampilkan.

   <img width="816" alt="Buka Rekening Baru" src="https://github.com/user-attachments/assets/50587750-edc7-4d4f-8415-3573b9deed47" />

   <img width="816" alt="Tutup Rekening" src="https://github.com/user-attachments/assets/7ba0cb40-3f75-4833-aa48-d15f697c38cd" />

3. **Setor Tunai.** Buka **Setor Tunai**, pilih rekening tujuan dari tabel, kemudian isi **Nominal Setoran** lebih dari nol, misalnya `100000` untuk Rp100.000. Klik **Proses Setor Tunai** dan baca pemberitahuan hasil yang muncul sebelum melanjutkan pelayanan berikutnya. Gunakan **Bersihkan** untuk mengosongkan nomor rekening dan nominal pada form.

   <img width="816" alt="Form Setor Tunai" src="https://github.com/user-attachments/assets/7a01c114-a4f6-4ca5-8602-b352890ebc88" />

4. **Tarik Tunai.** Buka **Tarik Tunai**, pilih rekening dari tabel, lalu isi **Nominal Penarikan** dengan angka positif tanpa pemisah ribuan. Rekening harus berstatus **Aktif** dan memiliki saldo yang cukup; tekan **Proses Tarik Tunai** untuk melanjutkan, lalu baca pemberitahuan hasil pada layar. Jika ingin mengisi ulang permintaan, gunakan **Bersihkan** sebelum memilih rekening dan nominal berikutnya.

   <img width="816" alt="Form Tarik Tunai" src="https://github.com/user-attachments/assets/624c42d1-2b67-45a7-b724-04d2b93f0208" />

5. **Isi Saldo Nasabah.** Untuk mengisi saldo saat rekening pertama kali dibuka, masukkan nominal pada **Setoran Awal** di halaman **Buka Rekening Baru**. Untuk rekening yang sudah tersedia, gunakan **Setor Tunai**, pilih rekening aktif milik Nasabah, kemudian ikuti langkah pengisian nominal pada fitur setoran.

6. **Lihat Profil.** Klik ikon pengguna untuk melihat identitas pegawai yang sedang melayani sebagai Teller. Profil memuat **User ID**, **NIP**, **Jabatan**, **Asal Cabang**, dan **Nama Lengkap**; setelah selesai, klik **Kembali** untuk menutup profil dan melanjutkan pelayanan.

   <img width="816" alt="Profil Teller" src="https://github.com/user-attachments/assets/3641240f-90d3-4d0a-b237-f19edd7c91a9" />

7. **Logout.** Gunakan **Keluar** pada menu samping untuk mengakhiri penggunaan akun Teller. Pilih **Yes / Ya** pada dialog konfirmasi agar kembali ke Login, atau **No / Tidak** untuk tetap berada pada halaman pelayanan.

</details>

<details>
<summary><b>📊 Halaman Petugas Kredit</b></summary>

<br>

<img width="816" alt="Halaman Petugas Kredit dan Bantu Pengajuan" src="https://github.com/user-attachments/assets/9e2e9253-9f77-498b-9d83-fc244a0c5016" />

Halaman Petugas Kredit mendukung pelayanan pinjaman, mulai dari membantu pemohon mengisi pengajuan sampai meninjau, memberikan keputusan, dan mencairkan dana. Menu **Data Nasabah** menyediakan informasi pemohon, sementara **Tunggakan & Denda** membantu petugas memantau kewajiban pembayaran pinjaman aktif.

**Fitur pada halaman ini:**

1. **Lihat Data Nasabah.** Buka **Data Nasabah**, masukkan NIK atau nama pada kolom pencarian, lalu klik **Cari** atau tekan **Enter**; kosongkan pencarian untuk menampilkan seluruh Nasabah aktif. Pilih satu baris untuk membuka identitas, kontak, dan daftar rekening aktif pada bagian **Detail Nasabah**. Kolom total tagihan membantu petugas melihat kewajiban Nasabah sebelum melanjutkan pelayanan pinjaman.

   <img width="816" alt="Pencarian dan Detail Nasabah" src="https://github.com/user-attachments/assets/3a5975b2-26c2-4e78-a1b5-ff380b98d4eb" />

2. **Input Pengajuan Pinjaman.** Pada **Bantu Pengajuan**, pilih **Nasabah Pemohon** dan **Rekening Nasabah** yang aktif, kemudian isi jumlah pinjaman, jangka waktu **1–360 Bulan** atau **1–30 Tahun**, serta tujuan penggunaan dana maksimal **200 karakter**. Klik **Kirim Pengajuan** agar pengajuan masuk dengan status **Diajukan** dan bunga flat **12% per tahun**. Gunakan **Bersihkan** jika ingin mengosongkan jumlah, jangka waktu, dan tujuan sebelum mengisi pengajuan lain.

3. **Tinjau Pengajuan dan Skor Kelayakan.** Buka **Tinjau & Putuskan**, gunakan **Cari / Muat Ulang** untuk mencari ID pinjaman, NIK, atau nama, lalu pilih pengajuan yang berstatus **Diajukan**. Masukkan **Skor Kelayakan** antara **0–100**, dengan paling banyak dua angka desimal, kemudian klik **Simpan Skor** jika penilaian ingin disimpan terlebih dahulu. Setelah daftar dimuat kembali, pilih pengajuan tersebut untuk melanjutkan ke pemberian keputusan.

   <img width="816" alt="Tinjau Pengajuan dan Skor" src="https://github.com/user-attachments/assets/50cb692a-cfe9-4067-825a-5deb874d2520" />

4. **Setujui / Tolak Pengajuan.** Pilih pengajuan, isi skor dan **Catatan Alasan Keputusan** maksimal **200 karakter**, kemudian pilih **Disetujui** atau **Ditolak**. Klik **Tetapkan Keputusan**, baca ringkasan pada dialog, lalu setujui untuk menyimpan keputusan atau pilih **No / Tidak** untuk kembali. Persetujuan mengikuti batas kewenangan akun petugas, yaitu **Rp0**, **Rp100.000.000**, atau **Rp500.000.000**.

   <img width="816" alt="Konfirmasi Keputusan Pinjaman" src="https://github.com/user-attachments/assets/840ee074-95a2-4d58-af00-1a4808b66ee7" />

5. **Cairkan Pinjaman dan Jadwal Angsuran Otomatis.** Buka **Cairkan Pinjaman**, pilih pinjaman **Disetujui**, klik **Cairkan Pinjaman**, lalu pilih rekening aktif pemohon sebagai tujuan dana. Pastikan nomor rekening dan nominal pada dialog sesuai, kemudian setujui pencairan agar seluruh pokok masuk ke rekening dan status pinjaman menjadi **Aktif**. Pemberitahuan hasil menampilkan jumlah jadwal serta total bunga, dengan angsuran pertama jatuh tempo **satu bulan setelah pencairan**.

   <img width="816" alt="Pemilihan Rekening Pencairan" src="https://github.com/user-attachments/assets/1cb21b9b-b461-4de5-a979-c116e78e1106" />

   <img width="816" alt="Hasil Pencairan Pinjaman" src="https://github.com/user-attachments/assets/bed3c3c8-abb2-47c9-8c79-d5129188c25a" />

6. **Pantau Tunggakan dan Denda.** Buka **Tunggakan & Denda**, pilih **Semua keterlambatan**, **Minimal 7 hari**, **Minimal 30 hari**, atau **Minimal 90 hari**, lalu klik **Tampilkan**. Gunakan **Cari / Muat Ulang** untuk menyaring berdasarkan ID pinjaman, NIK, atau nama, kemudian baca rincian jatuh tempo, jumlah hari terlambat, tagihan pokok dan bunga, serta denda pada tabel. Ringkasan di atas tabel memisahkan jumlah angsuran tertunggak, total tunggakan, dan total denda sesuai pilihan pemantauan.

   <img width="816" alt="Pemantauan Tunggakan dan Denda" src="https://github.com/user-attachments/assets/013f079d-e005-4af0-be13-365c11b655e0" />

7. **Lihat Profil.** Klik ikon pengguna untuk membuka **User ID**, **NIP**, **Jabatan**, **Asal Cabang**, dan **Nama Lengkap** petugas. Arahkan penunjuk ke kolom **Jabatan** untuk melihat batas persetujuan akun, lalu gunakan **Kembali** untuk melanjutkan pekerjaan pada halaman sebelumnya.

   <img width="816" alt="Profil Petugas Kredit" src="https://github.com/user-attachments/assets/ffa817c2-5249-4b7b-ad4a-153b40789a51" />

8. **Logout.** Klik **Keluar**, kemudian setujui dialog konfirmasi untuk mengakhiri penggunaan akun dan kembali ke Login. Pilih **No / Tidak** jika masih ingin melanjutkan peninjauan atau pelayanan pinjaman.

</details>

<details>
<summary><b>👥 Halaman Nasabah</b></summary>

<br>

<img width="816" alt="Halaman Nasabah, Rekening dan Saldo" src="https://github.com/user-attachments/assets/12f1f376-aa83-4be7-a779-5136ad8c7fa8" />

Halaman Nasabah menyediakan akses mandiri untuk melihat rekening, mengajukan dan memantau pinjaman, membuka jadwal angsuran, serta melakukan pembayaran dan transfer. Informasi yang tampil merupakan rekening dan pinjaman milik akun yang sedang masuk, dengan menu samping sebagai penghubung antarhalaman layanan.

**Fitur pada halaman ini:**

1. **Lihat Rekening dan Saldo.** Buka **Rekening & Saldo** untuk melihat nomor rekening, jenis rekening, saldo, dan status pada setiap baris tabel. Gunakan ringkasan **Total Saldo**, **Jumlah Rekening**, dan **Pinjaman Aktif** untuk memperoleh gambaran akun sebelum memilih layanan berikutnya. Perhatikan status **Aktif** saat menentukan rekening yang akan dipakai untuk pengajuan, pembayaran, atau transfer.

   <img width="816" alt="Rincian tabel rekening Nasabah" src="https://github.com/user-attachments/assets/5647caed-de3d-4a7e-a16f-caab1a4d60bc" />

2. **Ajukan Pinjaman.** Buka **Ajukan Pinjaman**, isi **Jumlah Pinjaman** tanpa pemisah ribuan, **Rekening Pencairan** aktif milik sendiri, **Jangka Waktu** antara **1–360 Bulan** atau **1–30 Tahun**, dan **Tujuan Penggunaan** maksimal **200 karakter**. Bunga pengajuan ditampilkan sebesar **12% per tahun (flat)**; klik **Kirim Pengajuan** untuk memperoleh ID pinjaman dengan status **Diajukan**. Simpan ID tersebut untuk memudahkan pemantauan, atau gunakan **Bersihkan** jika ingin mengisi ulang jumlah, jangka waktu, dan tujuan sebelum mengirim.

   <img width="816" alt="Pengajuan Pinjaman Nasabah" src="https://github.com/user-attachments/assets/e76fbe27-0869-4f09-89b4-65c8a3b77b74" />

3. **Pantau Status Pengajuan.** Buka **Status Pengajuan** untuk melihat daftar pinjaman beserta ID, tanggal, jangka waktu, jumlah, status, alasan keputusan, dan tanggal pencairan. Cocokkan ID dengan pengajuan yang ingin dilihat, lalu baca perubahan status dari **Diajukan** menuju keputusan petugas dan **Aktif** setelah pencairan. Catatan keputusan membantu Nasabah memahami hasil peninjauan tanpa harus membuka halaman pelayanan pegawai.

   <img width="816" alt="Status Pengajuan Nasabah" src="https://github.com/user-attachments/assets/457829c7-cbd9-4113-9e15-88244ecfda5a" />

4. **Lihat Jadwal Angsuran dan Denda.** Buka **Jadwal Angsuran**, pilih ID pinjaman yang sudah dicairkan, lalu baca tanggal jatuh tempo, tagihan pokok dan bunga, denda, serta status pembayaran pada tabel. Gunakan urutan tanggal untuk merencanakan pembayaran berikutnya dan bedakan angsuran **Belum Bayar** dengan angsuran **Lunas**. Untuk melihat rincian satu tagihan yang akan dibayar, lanjutkan ke menu **Bayar Angsuran** dan pilih pinjaman yang sama.

5. **Bayar Angsuran.** Buka **Bayar Angsuran**, pilih pinjaman **Aktif** dan **Rekening Sumber Pembayaran**, kemudian baca ID angsuran, jatuh tempo, pokok dan bunga, denda, serta total pembayaran pada **Rincian Pembayaran**. Klik **Bayar Angsuran** dan setujui dialog untuk melunasi **satu angsuran tertua yang belum lunas** dari rekening aktif milik sendiri dengan saldo yang cukup. Setelah berhasil, pilih kembali pinjaman untuk memuat tagihan berikutnya; status pinjaman menjadi **Lunas** ketika seluruh angsuran telah terbayar.

   <img width="816" alt="Rincian Pembayaran Angsuran" src="https://github.com/user-attachments/assets/5bfd1a3f-3076-4f44-9b2c-fe2365dbc606" />

   <img width="816" alt="Konfirmasi Pembayaran Angsuran" src="https://github.com/user-attachments/assets/f54b9478-c296-4880-9c38-a24d97caf01a" />

6. **Transfer.** Buka **Transfer Dana**, pilih **Rekening Sumber**, kemudian isi **Rekening Tujuan**, **Jumlah Transfer** positif tanpa pemisah ribuan, dan **Catatan** opsional maksimal **150 karakter**. Kedua rekening harus aktif, rekening tujuan berbeda dari sumber, dan saldo sumber mencukupi; klik **Kirim Transfer** untuk menampilkan ringkasan permintaan. Klik **Yes / Ya** untuk melanjutkan, atau **No / Tidak** untuk kembali ke form.

   <img width="816" alt="Transfer Dana Antar Rekening" src="https://github.com/user-attachments/assets/9a18cf4c-dad8-4c44-b264-315c5d59a1a5" />

7. **Lihat Profil.** Klik ikon pengguna untuk membuka identitas Nasabah, meliputi **User ID**, **NIK**, **NPWP**, **Nama Lengkap**, **Nomor Telepon**, **Alamat**, **Tipe Nasabah**, dan **Tanggal Daftar**. Gunakan halaman ini untuk melihat data diri yang terkait dengan akun, kemudian klik **Kembali** setelah selesai.

   <img width="816" alt="Profil Nasabah" src="https://github.com/user-attachments/assets/03e063d5-896c-4fe1-a523-be40da5f11c9" />

8. **Logout.** Klik **Keluar** pada menu samping, kemudian pilih **Yes / Ya** agar kembali ke Login. Pilih **No / Tidak** apabila masih ingin melihat rekening, memantau pengajuan, atau melanjutkan layanan lainnya.

</details>

**Alur uji coba end-to-end**

Ikuti urutan berikut untuk mencoba layanan dari pendaftaran sampai pembayaran. Gunakan satu akun Nasabah contoh yang sama sepanjang alur, lalu simpan email, password, nomor rekening, dan ID pinjaman agar pergantian peran mudah diikuti.

| Urutan | Role dan halaman | Langkah uji | Hasil yang ditampilkan |
|---|---|---|---|
| 1 | Teller → Kelola Data Nasabah → Buka Rekening Baru | Daftarkan Nasabah dengan identitas dan email yang berbeda, kemudian pilih Nasabah tersebut dan buka Tabungan dengan setoran awal `100000`. | Akun Nasabah, nomor rekening aktif, dan saldo awal Rp100.000. |
| 2 | Nasabah → Ajukan Pinjaman | Masuk menggunakan akun baru, ajukan `1000000` selama `12` Bulan, pilih rekening aktif, dan isi tujuan penggunaan. | ID pinjaman baru dengan status Diajukan. |
| 3 | Petugas Kredit → Tinjau & Putuskan → Cairkan Pinjaman | Cari pengajuan, isi skor dan alasan keputusan, pilih Disetujui, kemudian cairkan ke rekening pemohon. | Status Aktif, tambahan saldo Rp1.000.000, dan 12 jadwal angsuran bulanan. |
| 4 | Nasabah → Jadwal Angsuran → Bayar Angsuran | Masuk kembali, pilih pinjaman yang sama, buka jadwal, kemudian bayar tagihan dari rekening aktif dengan saldo yang cukup. | Angsuran tertua menjadi Lunas dan saldo berkurang sesuai total pembayaran. |

Saat berganti peran, gunakan **Keluar** lalu masuk dengan akun yang sesuai. Mulai dari nominal contoh agar jumlah pengajuan, dana pencairan, dan tagihan mudah dibandingkan selama mencoba alur program.

---

## 9. 👨‍💻 Kontributor

| No | Nama | NIM |
|---|---|---|
| 1 | Rija Aulia Mayatri | 2509116011 |
| 2 | Risky Farel Wijaya | 2509116066 |
| 3 | Syafir Ahzami | 2509116074 |
| 4 | Muhammad Aulia Rahman | 2509116096 |

**Program Studi Sistem Informasi, Fakultas Teknik, Universitas Mulawarman — 2026**
