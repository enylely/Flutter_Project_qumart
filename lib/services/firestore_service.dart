import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/product.dart';

// Kelas FirestoreService untuk mengelola operasi database Firestore
class FirestoreService {
  // Instance dari FirebaseFirestore
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Fungsi untuk mendapatkan stream daftar produk dari koleksi 'products'
  Stream<List<Product>> getProducts() {
    // Mendapatkan snapshot dari koleksi 'products'
    return _db.collection('products').snapshots().map((snapshot) =>
        // Mengonversi setiap dokumen dalam snapshot ke objek Product
        snapshot.docs
            .map((doc) => Product.fromFirestore(doc.data()!, doc.id))
            .toList());
  }

  // Fungsi untuk menambahkan produk baru ke koleksi 'products'
  Future<void> addProduct(Product product) {
    // Menambahkan dokumen baru ke koleksi 'products'
    return _db.collection('products').add(product.toFirestore());
  }

  // Fungsi untuk menghapus produk dari koleksi 'products' berdasarkan ID produk
  Future<void> removeProduct(String productId) {
    // Menghapus dokumen dari koleksi 'products' berdasarkan ID produk
    return _db.collection('products').doc(productId).delete();
  }
}
