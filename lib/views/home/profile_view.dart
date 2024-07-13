import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/auth_viewmodel.dart';

// Tampilan untuk halaman profil pengguna
class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Menggunakan context.watch untuk mendapatkan instance AuthViewModel dari Provider
    final authViewModel = context.watch<AuthViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(
            color: Color(0XFF1071bb),
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        backgroundColor: Color(0XFFe4bb81), // Judul AppBar
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Row(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.grey.withOpacity(0.5),
                  child: Image.asset(
                    "assets/profil.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                    '${authViewModel.user?.email ?? 'Guest'}'), // Menampilkan email pengguna atau 'Guest' jika tidak ada pengguna yang masuk
                SizedBox(height: 20), // Spasi
              ],
            ),
          ),
          SizedBox(
            height: 480,
          ),
          ElevatedButton(
            onPressed: () {
              authViewModel
                  .signOut(); // Memanggil fungsi signOut dari AuthViewModel saat tombol Logout ditekan
            },
            child: Text('Logout'), // Tombol Logout
          ),
        ],
      ),
    );
  }
}
