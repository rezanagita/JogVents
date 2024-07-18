import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:JogVents/firebase_options.dart';
import 'screen/login_page.dart';
import 'screen/register_page.dart';
import 'screen/home_page.dart'; // Import halaman beranda
import 'screen/detail.dart';
import 'screen/jadwal detail.dart'; // Import halaman jadwal
import 'screen/tiket.dart';
import 'screen/profil.dart';

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
