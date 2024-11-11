# Tugas 8

## Apa kegunaan `const` di Flutter? Jelaskan apa keuntungan ketika menggunakan `const` pada kode Flutter. Kapan sebaiknya kita menggunakan `const`, dan kapan sebaiknya tidak digunakan?

Dalam Flutter, `const` digunakan untuk mendeklarasikan widget atau objek yang bersifat tetap (immutable) selama siklus hidup aplikasi. Ini berarti bahwa setiap elemen yang dideklarasikan dengan `const` akan selalu memiliki nilai yang sama dan tidak akan berubah. Keuntungan menggunakan `const` pada flutter adalah:

1. Mengurangi penggunaan memori: Objek `const` hanya dibuat satu kali dan disimpan dalam memori aplikasi. Jika objek dengan nilai yang sama digunakan beberapa kali, Flutter tidak perlu membuat objek baru setiap kali, tetapi cukup merujuk ke objek `const` yang sama.
2. Optimasi performa: Flutter dapat menghindari proses rendering ulang pada widget `const`, karena tahu bahwa nilai widget tersebut tidak akan berubah. Ini mengurangi kebutuhan akan proses rebuild, yang pada gilirannya meningkatkan kinerja aplikasi.
3. Kode lebih bersih dan terstruktur: Dengan `const`, kita dapat mendeklarasikan elemen-elemen statis di satu tempat, sehingga kode menjadi lebih terstruktur dan mudah dikelola. Selain itu, widget `const` tidak perlu masuk ke dalam proses state management, karena tidak akan pernah mengalami perubahan.

`const` sebaiknya digunakan pada widget atau objek yang statis dan tidak akan berubah.

`const` sebaiknya tidak digunakan pada widget atau variabel yang mungkin mengalami perubahan saat aplikasi dijalankan. Selain itu, `const` juga tidak dapat digunakan untuk nilai yang diperolah saat runtime.

## Jelaskan dan bandingkan penggunaan Column dan Row pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!

Column adalah layout widget yang digunakan untuk menyusun widget secara vertikal. Berikut contoh implementasi dari Column:

```dart
Column(
  // Menyusun ikon dan teks di tengah kartu.
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Icon(
      item.icon,
      color: Colors.white,
      size: 30.0,
    ),
    const Padding(padding: EdgeInsets.all(3)),
    Text(
      item.name,
      textAlign: TextAlign.center,
      style: const TextStyle(color: Colors.white),
    ),
  ],
)
```

Sedangkan Row adalah widget yang digunakan untuk menyusun widget secara horizontal. Berikut contoh implementasi dari Row:

```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    InfoCard(title: 'NPM', content: npm),
    InfoCard(title: 'Name', content: name),
    InfoCard(title: 'Class', content: className),
  ],
)
```

## Sebutkan apa saja elemen input yang kamu gunakan pada halaman form yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan!

Elemen input yang digunakan pada halaman form pada tugas ini adalah `TextFormField`. Terdapat elemen input Flutter lain yang tidak digunakan pada tugas ini, beberapa diantaranya:

1. `Checkbox`: digunakan untuk input pilihan berbentuk kotak centang.
2. `Radio`: digunakan untuk memilih salah satu dari beberapa opsi.
3. `Slider`: digunakan untuk memilih nilai dari rentang tertentu, misalnya memilih tingkat volume atau nilai skala lainnya.

## Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?

Kita dapat mengatur tema dalam aplikasi Flutter dengan menggunakan widget `ThemeData` pada `main.dart`. Di dalamnya kita dapat mendeklarasikan color scheme yang dapat digunakan oleh seluruh widget pada aplikasi agar setiap widget memiliki pewarnaan yang konsisten. Saya sudah mengimplementasikan tema pada aplikasi ini.

## Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?

Pada aplikasi Flutter, kita dapat menggunakan widget `Navigator` untuk menangani navigasi halaman. `Navigator` akan mengelola stack route yang menyimpan urutan halaman-halaman yang dikunjungi pengguna. Terdapat beberapa fungsi dari `Navigator` yang dapat digunakan untuk melakukan navigasi, seperti `push()` untuk menambahkan suatu route ke dalam stack, `pop()` untuk menghapus route di paling atas stack (halaman yang sedang dilihat oleh pengguna), `pushReplacement()` untuk menghapus route di paling atas stack dan menggantinya dengan suatu route baru. Selain dari 3 fungsi ini, terdapat juga fungsi-fungsi lain pada `Navigator` yang dapat digunakan sesuai kebutuhan.

# Tugas 7

## Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya.

Stateless widget adalah widget yang tidak memiliki state (keadaan) yang dapat berubah setelah widget itu dibuat. Artinya, nilai-nilai yang ada dalam stateless widget bersifat tetap dan tidak berubah selama siklus hidup widget tersebut. Stateless widget biasanya digunakan untuk menampilkan elemen statis seperti teks, ikon, atau elemen UI yang tidak memerlukan interaksi atau perubahan data dinamis.

Stateful widget adalah widget yang memiliki state (keadaan) yang dapat berubah selama siklus hidupnya. Dengan kata lain, widget ini bisa berubah atau bereaksi terhadap interaksi pengguna, seperti menekan tombol, memasukkan data, atau perubahan data lainnya. Stateful widget cocok untuk elemen UI yang perlu diperbarui atau diubah secara dinamis, seperti tombol, input teks, slider, atau elemen yang perlu beradaptasi dengan input pengguna.

## Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.

1. Scaffold: Menyediakan struktur dasar halaman dengan bagian untuk `AppBar` dan `body`
2. AppBar: Menampilkan header atau bagian atas halaman
3. Padding: Menambahkan jarak di sekitar widget
4. Column: Menyusun widget secara vertikal
5. Row: Menyusun widget secara horizontal
6. Center: Memusatkan widget secara horizontal atau vertikal dalam suatu ruang
7. GridView: Membuat tata letak grid dengan jumlah kolom tetap
8. Card: Widget kartu untuk menampillkan ikon dan teks
9. Text: Menampilkan teks
10. Container: mengatur tata letak, ukuran, padding, dan dekorasi
11. SnackBar: menampilkan pesan sementara ketika `ItemCard` ditekan

## Apa fungsi dari `setState()`? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.

`setState()` berfungsi untuk mengubah nilai state pada suatu Stateful Widget. Ketika `setState()` dipanggil, Flutter akan merender ulang widget tersebut sehingga perubahan data dapat langsung terlihat pada antarmuka pengguna.

Variabel yang dapat terpengaruh oleh `setState()` umumnya adalah variabel yang dideklarasikan dalam kelas State dari Stateful Widget, yang sering disebut sebagai state variables.

## Jelaskan perbedaan antara `const` dengan `final`.

Nilai variabel `final` bisa ditetapkan saat runtime, yaitu ketika program sedang berjalan, bukan pada waktu kompilasi. Contohnya `final currentTime = DateTime.now();`.

`const` digunakan untuk nilai yang konstan pada waktu kompilasi, yang berarti nilainya harus diketahui sebelum program dijalankan (saat kompilasi). Contohnya `const pi = 3.14159;`.

## Jelaskan bagaimana cara kamu mengimplementasikan checklist-checklist di atas.

1. Membuat project flutter baru dengan perintah `flutter create toko_tokoan`

2. Membuat class `ItemCard` untuk menampilkan tombol dengan ikon dan teks seperti berikut:

   ```dart
   class ItemCard extends StatelessWidget {
     // Menampilkan kartu dengan ikon dan nama.

     final ItemHomepage item;

     const ItemCard(this.item, {super.key});

     @override
     Widget build(BuildContext context) {
       return Material(
         // Menentukan warna latar belakang dari tema aplikasi.
         color: item.color,
         // Membuat sudut kartu melengkung.
         borderRadius: BorderRadius.circular(12),

         child: InkWell(
           // Aksi ketika kartu ditekan.
           onTap: () {
             // Menampilkan pesan SnackBar saat kartu ditekan.
             ScaffoldMessenger.of(context)
               ..hideCurrentSnackBar()
               ..showSnackBar(SnackBar(
                   content: Text("Kamu telah menekan tombol ${item.name}!")));
           },
           // Container untuk menyimpan Icon dan Text
           child: Container(
             padding: const EdgeInsets.all(8),
             child: Center(
               child: Column(
                 // Menyusun ikon dan teks di tengah kartu.
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Icon(
                     item.icon,
                     color: Colors.white,
                     size: 30.0,
                   ),
                   const Padding(padding: EdgeInsets.all(3)),
                   Text(
                     item.name,
                     textAlign: TextAlign.center,
                     style: const TextStyle(color: Colors.white),
                   ),
                 ],
               ),
             ),
           ),
         ),
       );
     }
   }
   ```

   Membuat class `ItemHomePage` yang berisi teks, ikon, dan warna yang akan digunakan pada `ItemCard`.

   ```dart
   class ItemHomepage {
     final String name;
     final IconData icon;
     final MaterialColor color;

     ItemHomepage(this.name, this.icon, this.color);
   }
   ```

   Mendeklarasikan variabel `items` pada class `MyHomePage` yang berisi informasi item-item yang akan ditampilkan di antarmuka pengguna.

   ```dart
   final List<ItemHomepage> items = [
     ItemHomepage("Lihat Daftar Produk", Icons.sell, Colors.blue),
     ItemHomepage("Tambah Produk", Icons.add, Colors.red),
     ItemHomepage("Logout", Icons.logout, Colors.orange),
   ];
   ```

   Menambahkan `GridView` di dalam fungsi `Scaffold` pada class `MyHomePage` untuk menampilkan `ItemCard` dalam 3 kolom.

   ```dart
   GridView.count(
     primary: true,
     padding: const EdgeInsets.all(20),
     crossAxisSpacing: 10,
     mainAxisSpacing: 10,
     crossAxisCount: 3,
     // Agar grid menyesuaikan tinggi kontennya.
     shrinkWrap: true,

     // Menampilkan ItemCard untuk setiap item dalam list items.
     children: items.map((ItemHomepage item) {
       return ItemCard(item);
     }).toList(),
   ),
   ```

3. Mendeklarasikan 3 nilai warna yang berbeda pada variabel `items` agar setiap tombol memiliki warna yang berbeda-beda.

   ```dart
   final List<ItemHomepage> items = [
     ItemHomepage("Lihat Daftar Produk", Icons.sell, Colors.blue),
     ItemHomepage("Tambah Produk", Icons.add, Colors.red),
     ItemHomepage("Logout", Icons.logout, Colors.orange),
   ];
   ```

4. Menambahkan potongan kode berikut di dalam `Widget build` pada `ItemCard` untuk menampilkan snackbar ketika tombol (`ItemCard`) ditekan.
   ```dart
   child: InkWell(
     // Aksi ketika kartu ditekan.
     onTap: () {
       // Menampilkan pesan SnackBar saat kartu ditekan.
       ScaffoldMessenger.of(context)
         ..hideCurrentSnackBar()
         ..showSnackBar(SnackBar(
             content: Text("Kamu telah menekan tombol ${item.name}!")));
     },
     ...
   ```
