import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'login_page.dart';
import 'register_page.dart';
import 'home_page.dart'; // Import halaman beranda
import 'detail.dart';
import 'jadwal detail.dart'; // Import halaman jadwal
import 'tiket.dart';
import 'profil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JogVents',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home:
          LoginPage(), // Ubah ke RegisterPage() untuk menguji halaman register
      routes: {
        '/ticket': (context) => TicketPage(), // Tambahkan rute untuk TicketPage
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
