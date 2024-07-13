import 'package:flutter/foundation.dart';
import '../models/product.dart';

// Kelas CartViewModel untuk mengelola logika bisnis keranjang belanja dan memperbarui UI dengan ChangeNotifier
class CartViewModel extends ChangeNotifier {
  // Daftar untuk menyimpan produk-produk dalam keranjang belanja
  final List<Product> _cartItems = [];

  // Getter untuk mengakses produk-produk dalam keranjang belanja
  List<Product> get cartItems => _cartItems;

  // Fungsi untuk menambahkan produk ke dalam keranjang belanja
  void addProductToCart(Product product) {
    _cartItems.add(product);
    // Memanggil notifyListeners untuk memperbarui UI
    notifyListeners();
  }

  // Fungsi untuk menghapus produk dari keranjang belanja
  void removeProductFromCart(Product product) {
    _cartItems.remove(product);
    // Memanggil notifyListeners untuk memperbarui UI
    notifyListeners();
  }
}
