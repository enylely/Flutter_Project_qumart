import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qumart/views/home/cart_view.dart';
import 'package:qumart/views/home/profile_view.dart';
import '../../viewmodels/home_viewmodel.dart';
import '../../viewmodels/cart_viewmodel.dart';
import '../../widgets/product_card.dart';

// Tampilan untuk halaman utama aplikasi
class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Menggunakan context.watch untuk mendapatkan instance HomeViewModel dan CartViewModel dari Provider
    final homeViewModel = context.watch<HomeViewModel>();
    final cartViewModel = context.watch<CartViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Qumart', // Judul AppBar
          style: TextStyle(
            color: Color(0XFF1071bb),
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        backgroundColor: Color(0XFFe4bb81), // Warna latar belakang AppBar
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: orientation == Orientation.portrait
                  ? 2
                  : 3, // Jumlah kolom dalam GridView tergantung orientasi layar
            ),
            itemCount: homeViewModel.products.length,
            itemBuilder: (context, index) {
              final product = homeViewModel.products[index];
              return ProductCard(
                product: product,
                onAddToCart: () {
                  cartViewModel.addProductToCart(
                      product); // Menambahkan produk ke keranjang saat tombol Add to Cart ditekan
                },
              );
            },
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home'), // Item untuk halaman utama
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart'), // Item untuk halaman keranjang belanja
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile'), // Item untuk halaman profil pengguna
        ],
        onTap: (index) {
          // Navigasi berdasarkan indeks yang dipilih di BottomNavigationBar
          switch (index) {
            case 0:
              // Sudah berada di halaman utama
              break;
            case 1:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          CartView())); // Navigasi ke halaman CartView
              break;
            case 2:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ProfileView())); // Navigasi ke halaman ProfileView
              break;
          }
        },
      ),
    );
  }
}
