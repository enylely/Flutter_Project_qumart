import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qumart/views/auth/login_view.dart';
import '../../viewmodels/auth_viewmodel.dart';

// Tampilan untuk halaman registrasi pengguna baru
class RegisterView extends StatefulWidget {
  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  // Controller untuk input email dan password
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Register',
          style: TextStyle(
            color: Color(0XFF1071bb),
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        backgroundColor: Color(0XFFe4bb81), // Judul AppBar
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'), // Input Email
            ),
            TextField(
              controller: _passwordController,
              decoration:
                  InputDecoration(labelText: 'Password'), // Input Password
              obscureText: true, // Teks password tersembunyi
            ),
            SizedBox(height: 20), // Spasi
            ElevatedButton(
              onPressed: () async {
                final email = _emailController.text;
                final password = _passwordController.text;
                // Memanggil fungsi register dari AuthViewModel menggunakan Provider
                context.read<AuthViewModel>().register(email, password);
                // Navigasi kembali ke halaman LoginView setelah registrasi selesai
                Navigator.pop(
                  context,
                  MaterialPageRoute(builder: (context) => LoginView()),
                );
              },
              child: Text('Register'), // Tombol Register
            ),
          ],
        ),
      ),
    );
  }
}
