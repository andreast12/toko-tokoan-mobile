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
