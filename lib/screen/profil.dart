import 'package:flutter/material.dart';
import 'tiket.dart'; // assuming this is where your TicketPage is defined
import 'home_page.dart';
import 'login_page.dart';
import 'auth.dart'; // assuming this is where your AuthService is defined

class ProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Page',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 2; // Set the initial selected index to 2 (Profile)
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false, // Mengatur teks agar berada di tengah
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 120.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(
                      'assets/rizky_setiawan.jpg'), // Add your profile picture here
                ),
                SizedBox(height: 10),
                Text(
                  'Alex Marshall',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  '@alex_marshall',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Add edit profile code here
                  },
                  child: Text('Edit'),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Setting'),
                    onTap: () {
                      // Add setting code here
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Friend'),
                    onTap: () {
                      // Add friend code here
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.group),
                    title: Text('New Group'),
                    onTap: () {
                      // Add new group code here
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.support),
                    title: Text('Support'),
                    onTap: () {
                      // Add support code here
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.info),
                    title: Text('About us'),
                    onTap: () {
                      // Add about us code here
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.logout, color: Colors.red),
                    title: Text(
                      'Logout',
                      style: TextStyle(color: Colors.red),
                    ),
                    onTap: () async {
                      await _auth.signOut();
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                        (Route<dynamic> route) => false,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.rocket),
            label: 'Tickets',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.pink,
        currentIndex: _selectedIndex,
        onTap: (int index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TicketPage()),
            );
          } else if (index == 2) {
            // tidak ada navigasi karena sudah berada di halaman profil
          }
          setState(() {
            _selectedIndex = index; // Update selected index
          });
        },
      ),
    );
  }
}
