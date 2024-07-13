import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import '../services/auth_service.dart';

// Kelas AuthViewModel untuk mengelola logika bisnis autentikasi dan memperbarui UI dengan ChangeNotifier
class AuthViewModel extends ChangeNotifier {
  // Instance dari AuthService
  final AuthService _authService = AuthService();

  // Variabel untuk menyimpan pengguna saat ini
  User? _user;

  // Getter untuk mengakses pengguna saat ini
  User? get user => _user;

  // Fungsi untuk masuk menggunakan email dan kata sandi
  Future<void> signIn(String email, String password) async {
    // Memanggil fungsi signInWithEmailAndPassword dari AuthService
    _user = await _authService.signInWithEmailAndPassword(email, password);
    // Memanggil notifyListeners untuk memperbarui UI
    notifyListeners();
  }

  // Fungsi untuk mendaftar menggunakan email dan kata sandi
  Future<void> register(String email, String password) async {
    // Memanggil fungsi registerWithEmailAndPassword dari AuthService
    _user = await _authService.registerWithEmailAndPassword(email, password);
    // Memanggil notifyListeners untuk memperbarui UI
    notifyListeners();
  }

  // Fungsi untuk keluar dari akun
  Future<void> signOut() async {
    // Memanggil fungsi signOut dari AuthService
    await _authService.signOut();
    // Mengatur _user menjadi null setelah keluar
    _user = null;
    // Memanggil notifyListeners untuk memperbarui UI
    notifyListeners();
  }
}
