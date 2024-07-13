import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/auth_viewmodel.dart';
import 'register_view.dart';

// Tampilan untuk halaman login
class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  // Controller untuk input email dan password
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          style: TextStyle(
            color: Color(0XFF1071bb),
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        backgroundColor: Color(0XFFe4bb81),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              width: 150,
              height: 150,
              child: Image.asset("assets/shop.jpg"), // Gambar logo toko
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
              ),
              obscureText: true, // Teks password tersembunyi
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Mengambil nilai email dan password dari controller
                      final email = _emailController.text;
                      final password = _passwordController.text;
                      // Memanggil fungsi signIn dari AuthViewModel menggunakan Provider
                      context.read<AuthViewModel>().signIn(email, password);
                    },
                    child: Text('Login'), // Tombol Login
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigasi ke halaman RegisterView ketika tombol Register ditekan
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterView()),
                      );
                    },
                    child: Text('Register'), // Tombol Register
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
