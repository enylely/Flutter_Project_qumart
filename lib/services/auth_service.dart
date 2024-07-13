import 'package:firebase_auth/firebase_auth.dart';

// Class AuthService untuk mengelola autentikasi pengguna menggunakan Firebase Authentication
class AuthService {
  // Instance dari FirebaseAuth
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Fungsi untuk masuk menggunakan email dan kata sandi
  // Mengembalikan User jika berhasil, atau null jika terjadi kesalahan
  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      // Mencoba masuk dengan email dan kata sandi
      UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      // Mengembalikan objek User jika berhasil
      return result.user;
    } catch (e) {
      // Mencetak pesan kesalahan jika terjadi kesalahan
      print(e.toString());
      // Mengembalikan null jika terjadi kesalahan
      return null;
    }
  }

  // Fungsi untuk mendaftar menggunakan email dan kata sandi
  // Mengembalikan User jika berhasil, atau null jika terjadi kesalahan
  Future<User?> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      // Mencoba membuat akun dengan email dan kata sandi
      UserCredential result = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      // Mengembalikan objek User jika berhasil
      return result.user;
    } catch (e) {
      // Mencetak pesan kesalahan jika terjadi kesalahan
      print(e.toString());
      // Mengembalikan null jika terjadi kesalahan
      return null;
    }
  }

  // Fungsi untuk keluar dari akun
  Future<void> signOut() async {
    // Melakukan sign out dari FirebaseAuth
    await _firebaseAuth.signOut();
  }
}
