## 6. 🗂️ Struktur Folder / Package

### 6.1 Struktur Folder Proyek
<img width="404" height="519" alt="{BED5FD87-FF3F-4053-8BC0-2C43301DE686}" src="https://github.com/user-attachments/assets/78e8ee57-0c82-411c-a1da-de238eb27fc3" />


### 6.2 Penjelasan Package

#### 📦 Package `model`
<img width="381" height="138" alt="{F692F335-B54F-430E-9045-00E4DA07AE59}" src="https://github.com/user-attachments/assets/73b7674a-2cf0-478a-9de5-73fa69ffbee6" />

> ✏️ Berfungsi untuk mendefinisikan blueprint (cetak biru) dari entitas data yang ada di database menjadi objek Java (representasi tabel ke objek). Daftar class di dalamnya meliputi AkunData.java, Nasabah.java, Pegawai.java, User.java, dan UserSession.java.


#### 📦 Package `view`
<img width="536" height="579" alt="{F39808A9-BE67-473C-929A-2521EE425DD3}" src="https://github.com/user-attachments/assets/78231a77-0b4c-4e1e-a268-0cef40a89dd9" />

> ✏️ Berfungsi sebagai antarmuka pengguna (GUI) tempat interaksi visual terjadi (form JFrame). Daftar class/form GUI di dalamnya meliputi AdminView2.java, LiatProfilView_1.java, LoginView.java, NasabahView1.java, PetugasKreditView1.java, RegisterView.java, dan kumpulan form TellerView.java.


#### 📦 Package `proses`
<img width="258" height="66" alt="{2F030201-35CA-499B-9DDE-02321B7286C2}" src="https://github.com/user-attachments/assets/0b432121-3368-4e16-9af3-49177214114e" />

> ✏️ Berfungsi sebagai pengendali alur logika bisnis dan transisi state aplikasi di luar GUI. Daftar class di dalamnya meliputi Autentikasi.java dan UserSession.java.


#### 📦 Package `dao`
<img width="307" height="114" alt="{A85B3336-EDC5-473C-80D3-1776246B6EC0}" src="https://github.com/user-attachments/assets/efe25d01-9a6e-482f-80ea-166849f04a9e" />

> ✏️ Data Access Object (DAO) berfungsi secara spesifik untuk menangani seluruh kueri CRUD (Create, Read, Update, Delete) ke database MySQL, memisahkan logika SQL dari UI. Daftar class di dalamnya meliputi AutentikasiDAO.java, NasabahDAO.java, PegawaiDAO.java, PinjamanDAO.java, dan TransaksiDAO.java.



#### 📦 Package `database`
<img width="231" height="45" alt="{1BF29AAC-F1B1-4425-BF56-9AD569A2E57C}" src="https://github.com/user-attachments/assets/553ebfef-048d-4f29-b343-1095cc7c61a5" />

> ✏️ Berfungsi untuk mengatur konfigurasi dan jembatan koneksi (driver) antara program Java dan server MySQL. Daftar class di dalamnya meliputi Koneksi.java.


#### 🖼️ Folder `resources` / `images`
<img width="675" height="182" alt="{6DCFED1C-D90E-408A-BB61-A6D40314E596}" src="https://github.com/user-attachments/assets/f55a27b0-eb0d-486b-9fed-26eab2d20781" />

> ✏️ Berfungsi sebagai direktori penyimpanan aset statis aplikasi. Aset yang disimpan di folder ini meliputi gambar antarmuka seperti Background.png, bg lgoin.png, ilustrasi website launch plan, serta gambar ikon profil seperti user.png.


#### 📚 Libraries
<img width="387" height="119" alt="{6A8CB42C-75F5-4A35-9119-2C8271EBD20E}" src="https://github.com/user-attachments/assets/b9eebad6-137d-4ca7-b5c2-b1eb0d0dd091" />

> ✏️ Proyek ini menggunakan basis Maven (pom.xml). Library utama yang wajib ada adalah MySQL Connector/J (untuk implementasi JDBC agar bisa terhubung ke database pa_creedy). Selain itu, program ini juga mengandalkan library bawaan Java Swing (javax.swing.*) dan AWT (java.awt.*) untuk rendering komponen antarmuka GUI.


### 6.3 Penerapan Arsitektur MVC + DAO

> ✏️ Program ini memisahkan tanggung jawab kode secara terstruktur:

  -Model menyimpan dan merepresentasikan bentuk data (contoh: objek Nasabah).
  -View menangani tampilan layar (JFrame) dan menerima input dari pengguna.
  -Proses (Controller) mengatur alur masuknya input, melakukan validasi, dan menjembatani View dengan DAO.
  -DAO (Data Access Object) memisahkan logika query SQL murni untuk mengambil/menyimpan data ke MySQL.

Alur kerja: User menekan tombol di View -> memicu fungsi di Proses -> Proses memanggil DAO untuk eksekusi query -> Data dikembalikan dalam bentuk objek Model -> Layar View diperbarui.


---


## 7. 🧱 Penjelasan Penerapan 4 Pilar OOP

### 7.1 Encapsulation (Enkapsulasi)

**Konsep:**
> ✏️ Membungkus data (atribut) dan metode dalam satu unit (class) serta menyembunyikan detail internal objek dari modifikasi luar secara langsung menggunakan access modifier private. Akses modifikasi hanya diberikan secara aman melalui metode getter dan setter.

>Encapsulation, Inheritance, Abstraction, Polymorphism, dan Interface. 

#### 📁 Contoh 1: `AkunData.java`
> ✏️Atribut data akun disembunyikan menggunakan modifier private sehingga tidak dapat diubah sembarangan dari luar kelas, dan hanya bisa diakses melalui fungsi getter.
```java
    public class AkunData {
    private String userId;
    private String email;
    private String nama;
    private String role;
    // Constructor & Getter methods
    public String getUserId() { return userId; }
    public String getEmail() { return email; }
    public String getNama() { return nama; }
    public String getRole() { return role; }
    }
```

#### 📁 Contoh 2: `User.java`
> ✏️ Atribut kredensial dan identitas pengguna seperti password, NIK, dan NIP dienkapsulasi dengan tingkat akses private untuk menjaga keamanan data sensitif aplikasi dari manipulasi luar.
```java
    public class User {
    private String idUser;
    private String email;
    private String password;
    private String nik;
    private String nip;

    public String getPassword() { return password; }
    public String getEmail() { return email; }
    public String getNik() { return nik; }
    }
```

**Kesimpulan:**
> ✏️ Enkapsulasi diterapkan pada seluruh kelas entitas (model) dengan membungkus atribut menggunakan kontrol akses private dan menyediakan metode getter untuk membaca data dengan aman.

---

### 7.2 Inheritance (Pewarisan)

**Konsep:**
> ✏️ Mewarisi atribut dan method dari kelas induk agar bisa digunakan ulang oleh kelas turunan.

#### 📁 Contoh 1: `NamaClass.java`
> ✏️ Kelas Nasabah mewarisi properti dasar dari kelas induk User menggunakan kata kunci extends, sehingga atribut autentikasi umum tidak perlu ditulis ulang.
```java
public class Nasabah extends User {
    private String noRekening;
    private double saldo;
    // Mewarisi atribut idUser, email, password, dll dari User
}
```

#### 📁 Contoh 2: `Pegawai.java`
> ✏️ Kelas Pegawai juga menggunakan pewarisan dari kelas induk User untuk menangani pengelolaan data internal pegawai (seperti Teller atau Petugas Kredit).
```java
public class Pegawai extends User {
    private String nipPegawai;
    private String jabatan;
    // Mewarisi fungsi login/autentikasi dari User
}
```

#### 🌳 Hierarki Pewarisan

Struktur pewarisan pada package Model dapat digambarkan sebagai berikut:

<img width="182" height="192" alt="Untitled Diagram drawio" src="https://github.com/user-attachments/assets/dc4b1f48-b90c-4970-8db1-871b79482a56" />

> ✏️ Kelas User bertindak sebagai kelas induk (superclass) yang berisi atribut umum dan autentikasi dasar untuk seluruh jenis pengguna sistem, sedangkan kelas Nasabah dan Pegawai adalah kelas turunan (subclass) yang memperluas fungsionalitasnya dengan atribut spesifik masing-masing.


**Kesimpulan:**
> ✏️ Inheritance berhasil diterapkan untuk memusatkan atribut umum pengguna ke dalam kelas induk User, membuat kelas turunan (Nasabah dan Pegawai) lebih bersih dan spesifik.

---

### 7.3 Abstraction (Abstraksi)

**Konsep:**
> ✏️ Abstraksi digunakan untuk menyembunyikan detail kompleks, hanya menampilkan bagian penting kepada pengguna melalui kelas abstrak atau method abstrak.

#### 📁 Contoh 1: `AutentikasiDAO.java`

```java
public User login(String email, String password) {
        User user = null;
        String query = "SELECT * FROM akun WHERE email = ? AND password = ?";
```

> ✏️ Kelas AutentikasiDAO menyembunyikan detail kueri SQL mentah, pengelolaan PreparedStatement, dan penanganan exception database dari lapisan View atau Proses. Lapisan lain cukup memanggil metode login(email, password) tanpa harus tahu mekanisme penarikan data dan struktur SQL di balik layar.


#### 📁 Contoh 2: `Koneksi.java`

```java
public static Connection getConnection() throws SQLException {
    return DriverManager.getConnection(
        System.getProperty("creedy.db.url", "jdbc:mysql://127.0.0.1:3306/pa_creedy?connectTimeout=5000&socketTimeout=15000"),
        System.getProperty("creedy.db.user", "root"), System.getProperty("creedy.db.password", ""));
}
```

> ✏️ Kelas Koneksi menyembunyikan detail URL database, kredensial user, dan proses pemanggilan DriverManager dari kelas-kelas lain (seperti DAO). Kelas lain cukup memanggil metode getConnection() tanpa harus tahu mekanisme koneksi JDBC di balik layar.

**Kesimpulan:**
> ✏️ *Kelas DAO mengabstraksi eksekusi query SQL yang rumit (PreparedStatement, penanganan eksepsi database) sehingga kelas antarmuka (View) atau Controller hanya perlu memanggil fungsi sederhana seperti simpanData() atau tarikTunai().

---

### 7.4 Polymorphism (Polimorfisme)

**Konsep:**
> ✏️ Polimorfisme memungkinkan method dengan nama yang sama memiliki perilaku berbeda tergantung pada objek yang memanggilnya.

#### 📁 Contoh 1: Method Overriding pada `TellerView.java`

```java
@Override
public boolean isCellEditable(int row, int column) {
    return false;
}
```

> ✏️ Method isCellEditable() pada DefaultTableModel di-override agar semua sel tabel tidak bisa diedit.

#### 📁 Contoh 2: Method Overloading / Dynamic Dispatch pada `TellerView1_2.java`


```java
@Override
public boolean isCellEditable(int row, int column) {
    return false;
}
```
> ✏️ Method isCellEditable() di-override untuk mencegah pengguna mengubah data rekening secara langsung melalui tabel.

**Kesimpulan:**
> ✏️ Penerapan polimorfisme pada kedua file ditunjukkan melalui Method Overriding pada method isCellEditable(), yang digunakan untuk membuat tabel data nasabah dan rekening hanya dapat menampilkan data tanpa bisa diedit secara langsung.

---

### 7.5 Ringkasan Penerapan 4 Pilar OOP

| Pilar OOP | Class / File yang Menerapkan | Keterangan |
|---|---|---|
| Encapsulation | `AkunData.java`, `User.java` | Membungkus atribut data menggunakan modifier `private` dan menyediakan fungsi `getter`/`setter` untuk mengontrol akses dan menjaga keamanan data entitas. |
| Inheritance | `Nasabah.java`, `Pegawai.java` | Mewarisi atribut umum dan fungsi autentikasi dasar dari *superclass* `User` ke *subclass* terkait agar struktur kode lebih rapi dan *reusable*. |
| Abstraction | `Koneksi.java`, `AutentikasiDAO.java` | Menyembunyikan kompleksitas konfigurasi koneksi JDBC, kredensial database, serta detail kueri SQL mentah dari lapisan View atau Proses. |
| Polymorphism | `TellerView.java`, `TellerView1_2.java` | Menggunakan *Method Overriding* pada method `isCellEditable()` untuk mengubah perilaku komponen tabel GUI sehingga data hanya dapat dibaca (*read-only*). |

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
