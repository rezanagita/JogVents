import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home_page.dart'; // Import halaman beranda
import 'register_page.dart'; // Import halaman register
import 'auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthService _auth = AuthService(); // Buat instance AuthService

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    'assets/image.png',
                    height: 40,
                  ), // Logo di pojok kiri atas
                ),
                SizedBox(height: 30),
                Text(
                  'Selamat Datang di Jogvents!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'Dapatkan informasi terkini mengenai berbagai acara seru di Yogyakarta',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 30),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Kata Sandi',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // Tambahkan logika untuk lupa kata sandi di sini
                    },
                    child: Text('Lupa kata sandi?'),
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _submitForm,
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor:
                          Color(0xFFC45390), // Warna teks tombol login
                    ),
                    child: Text('Masuk'),
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: Text(
                    'atau',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {
                      // Navigasi ke halaman register
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Color(0xFFC45390),
                      side: BorderSide(
                          color: Color(
                              0xFFC45390)), // Warna stroke tombol register
                    ),
                    child: Text('Daftar Sekarang'),
                  ),
                ),
                SizedBox(height: 30),
                Image.asset(
                  'assets/loginPage.png',
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ), // Gambar di bawah tombol
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submitForm() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    try {
      // Coba login terlebih dahulu
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Navigasi ke halaman beranda jika login berhasil
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      switch (e.code) {
        case 'user-not-found':
          errorMessage =
              'Anda belum memiliki akun. Silakan daftar terlebih dahulu.';
          break;
        case 'wrong-password':
          errorMessage = 'Kata sandi yang dimasukkan salah. Silakan coba lagi.';
          break;
        default:
          errorMessage =
              'Anda belum memiliki akun. Silakan daftar terlebih dahulu.';
      }

      // Menampilkan snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
