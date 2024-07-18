import 'package:flutter/material.dart';
import 'profil.dart';
import 'home_page.dart';

class TicketPage extends StatefulWidget {
  @override
  _TicketPageState createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  int _selectedIndex = 1; // Set the initial selected index to 1 (Tickets)

  void _onItemTapped(int index) {
    if (index == 0) {
      // Navigate to home page if exists
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
        (route) => false, // This line removes all the routes in stack
      );
    } else if (index == 1) {
      // Index 1 is the "Tickets" item
      // No need to navigate since we're already on the TicketPage
    } else if (index == 2) {
      // Index 2 is the "Profile" item
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfilePage()),
      );
    }
    setState(() {
      _selectedIndex = index; // Update the selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Ticket'),
        centerTitle: true, // Mengatur teks agar berada di tengah
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: CustomPaint(
            painter: TicketPainter(),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/barcode.jpg',
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Prambanan Jazz 10:\n#SatuDekadeBersama',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(Icons.person, color: Color(0xFFC45390)),
                      SizedBox(width: 8),
                      Text('Reza Nagita Nurhazizah'),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Color(0xFFC45390)),
                      SizedBox(width: 8),
                      Text('Pelataran Candi Prambanan'),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.calendar_today, color: Color(0xFFC45390)),
                      SizedBox(width: 8),
                      Text('05/07/2024'),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.access_time, color: Color(0xFFC45390)),
                      SizedBox(width: 8),
                      Text('15:00 - 23:00'),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.code, color: Color(0xFFC45390)),
                      SizedBox(width: 8),
                      Text('Event Code: ABC1234'),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.category, color: Color(0xFFC45390)),
                      SizedBox(width: 8),
                      Text('Category: Reguler - Super Festival'),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.attach_money, color: Color(0xFFC45390)),
                      SizedBox(width: 8),
                      Text('Cost: Rp575.000'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Color(0xFFC45390)),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.rocket, color: Color(0xFFC45390)),
            label: 'Tickets',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Color(0xFFC45390)),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFFC45390),
        onTap: _onItemTapped,
      ),
    );
  }
}

class TicketPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color.fromARGB(255, 255, 229, 238)
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height * 0.45);
    path.quadraticBezierTo(
        size.width * 0.95, size.height * 0.5, size.width, size.height * 0.55);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, size.height * 0.55);
    path.quadraticBezierTo(
        size.width * 0.05, size.height * 0.5, 0, size.height * 0.45);
    path.close();

    canvas.drawPath(path, paint);

    final borderPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
