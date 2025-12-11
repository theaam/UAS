# 🍞 Celeo Bakery App

[cite_start]**Celeo Bakery** adalah aplikasi mobile berbasis Flutter yang dikembangkan untuk memenuhi tugas Ujian Akhir Semester (UAS) mata kuliah Mobile Programming[cite: 1, 2]. [cite_start]Aplikasi ini merupakan pengembangan lanjutan dari proyek UTS dengan mengintegrasikan **RESTful API Publik** untuk menampilkan data produk secara *real-time*[cite: 8, 10].

Aplikasi ini mensimulasikan toko roti online di mana pengguna dapat melihat daftar produk, mencari produk spesifik, melihat detail resep/deskripsi, dan mengelola keranjang belanja.

## 📱 Fitur Utama

* [cite_start]**Integrasi API Real-time**: Mengambil data produk (Roti/Kue) langsung dari internet menggunakan protokol HTTP[cite: 10, 18].
* [cite_start]**Pencarian Produk**: Fitur pencarian dinamis untuk menemukan produk berdasarkan nama[cite: 23].
* [cite_start]**Manajemen Keranjang (State Management)**: Menggunakan `Provider` untuk mengelola status keranjang belanja (tambah/hapus item) tanpa *rebuild* halaman yang tidak perlu[cite: 27].
* **Detail Produk**: Menampilkan deskripsi lengkap, harga (simulasi), dan gambar produk.
* [cite_start]**Handling Async State**: Indikator visual saat memuat data (Loading), saat berhasil (Success), dan penanganan saat terjadi kesalahan (Error)[cite: 20, 21].

## 🔗 Daftar Endpoint API

[cite_start]Aplikasi ini menggunakan layanan API publik dari **TheMealDB**[cite: 15]. Data yang diambil difilter khusus untuk kategori *Dessert* dan *Breakfast* agar sesuai dengan tema Toko Roti (Bakery).

| Fungsi | Endpoint | Deskripsi |
| :--- | :--- | :--- |
| **Filter Kategori** | `GET /filter.php?c={category}` | [cite_start]Mengambil daftar produk berdasarkan kategori (digunakan untuk "Dessert" dan "Breakfast")[cite: 10]. |
| **Pencarian** | `GET /search.php?s={query}` | [cite_start]Mencari produk berdasarkan kata kunci yang dimasukkan pengguna[cite: 17]. |
| **Detail Produk** | `GET /lookup.php?i={id}` | [cite_start]Mengambil detail lengkap (instruksi/resep) berdasarkan ID produk[cite: 25]. |

> [cite_start]**Catatan:** Base URL yang digunakan adalah `https://www.themealdb.com/api/json/v1/1`[cite: 7].

## 🛠️ Teknologi & Library

* **Language**: Dart
* **Framework**: Flutter SDK
* **Dependencies** (dari `pubspec.yaml`):
    * [cite_start][`http`](https://pub.dev/packages/http): Untuk melakukan HTTP Request ke API[cite: 18].
    * [cite_start][`provider`](https://pub.dev/packages/provider): Untuk State Management (Keranjang Belanja)[cite: 27].

## 🚀 Cara Instalasi

Ikuti langkah-langkah berikut untuk menjalankan aplikasi ini di komputer lokal Anda:

### Prasyarat
Pastikan Anda telah menginstal:
* [Flutter SDK](https://docs.flutter.dev/get-started/install) (versi terbaru/stable).
* Code Editor (VS Code atau Android Studio).

### Langkah Instalasi

1.  **Clone Repositori**
    ```bash
    git clone https://github.com/theaam/UAS.git)
    cd UAS
    ```

2.  **Instal Dependencies**
    [cite_start]Unduh semua library yang diperlukan (http & provider) yang terdaftar di `pubspec.yaml`.
    ```bash
    flutter pub get
    ```

3.  **Jalankan Aplikasi**
    Pastikan Emulator atau Device fisik sudah terhubung.
    ```bash
    flutter run
    ```

## 📂 Struktur Folder

```text
lib/
├── models/         # Model data (Product, CartItem)
├── pages/          # Halaman UI (Home, Menu, Detail, Cart)
├── services/       # Logika bisnis & API (ApiService, CartService)
└── main.dart       # Entry point aplikasi
