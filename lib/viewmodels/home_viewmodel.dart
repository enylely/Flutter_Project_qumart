import 'package:flutter/foundation.dart';
import '../models/product.dart';
import '../services/firestore_service.dart';

// Kelas HomeViewModel untuk mengelola logika bisnis tampilan utama dan memperbarui UI dengan ChangeNotifier
class HomeViewModel extends ChangeNotifier {
  // Instance dari FirestoreService untuk mengakses operasi database Firestore
  final FirestoreService _firestoreService = FirestoreService();

  // Daftar produk yang akan ditampilkan di tampilan utama
  List<Product> _products = [];

  // Getter untuk mengakses daftar produk
  List<Product> get products => _products;

  // Konstruktor untuk menginisialisasi objek HomeViewModel
  HomeViewModel() {
    // Mendapatkan stream produk dari FirestoreService
    _firestoreService.getProducts().listen((products) {
      // Memperbarui daftar produk dengan data terbaru
      _products = products;
      // Memanggil notifyListeners untuk memperbarui UI
      notifyListeners();
    });
  }
}
