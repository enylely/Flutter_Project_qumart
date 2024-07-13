import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/cart_viewmodel.dart';

// Tampilan untuk halaman keranjang belanja
class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Menggunakan context.watch untuk mendapatkan instance CartViewModel dari Provider
    final cartViewModel = context.watch<CartViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart', // Judul AppBar
          style: TextStyle(
            color: Color(0XFF1071bb),
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        backgroundColor: Color(0XFFe4bb81), // Warna latar belakang AppBar
      ),
      body: ListView.builder(
        itemCount: cartViewModel.cartItems.length,
        itemBuilder: (context, index) {
          final product = cartViewModel.cartItems[index];
          return ListTile(
            leading: Image.network(product.imageUrl), // Gambar produk
            title: Text(product.name), // Nama produk
            subtitle: Text('\$${product.price}'), // Harga produk
            trailing: IconButton(
              icon: Icon(Icons.remove), // Tombol hapus
              onPressed: () {
                cartViewModel.removeProductFromCart(
                    product); // Menghapus produk dari keranjang
              },
            ),
          );
        },
      ),
    );
  }
}
