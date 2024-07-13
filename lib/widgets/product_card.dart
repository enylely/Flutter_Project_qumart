import 'package:flutter/material.dart';
import '../models/product.dart';

// Widget untuk menampilkan kartu produk
class ProductCard extends StatelessWidget {
  final Product product; // Data produk yang akan ditampilkan
  final VoidCallback
      onAddToCart; // Fungsi yang dipanggil saat tombol Add to Cart ditekan

  const ProductCard({required this.product, required this.onAddToCart});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Image.network(
              product.imageUrl, // Menampilkan gambar produk dari URL
              fit: BoxFit.cover, // Mengatur tata letak gambar
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name, // Menampilkan nama produk
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight:
                          FontWeight.bold), // Gaya teks untuk nama produk
                ),
                Text(
                  '\$${product.price}', // Menampilkan harga produk
                  style:
                      TextStyle(fontSize: 14.0), // Gaya teks untuk harga produk
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
                130, 0, 10, 10), // Padding untuk tombol Add to Cart
            child: Container(
              color: Color(0XFF1071bb), // Warna latar belakang tombol
              width: 50,
              height: 50,
              child: GestureDetector(
                onTap:
                    onAddToCart, // Menjalankan fungsi onAddToCart saat tombol ditekan
                child: Icon(
                  Icons.add, // Icon untuk tombol Add to Cart
                  color: Color(0XFFe4bb81), // Warna ikon
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
