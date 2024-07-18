import 'package:flutter/material.dart';
import 'detail.dart'; // Import halaman detail
import 'profil.dart';
import 'tiket.dart'; // Import halaman tiket

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hallo, Alex',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFC45390),
                        ),
                      ),
                      Text(
                        'Welcome',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.notifications, color: Colors.black),
                        onPressed: () {
                          // Tambahkan logika untuk notifikasi
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.calendar_today, color: Colors.black),
                        onPressed: () {
                          // Tambahkan logika untuk kalender
                        },
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Search events',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Events Nearby',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              // Event cards
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    EventCard(
                      image: 'assets/prambanan.png',
                      title: 'Prambanan Jazz',
                      date: '5 July 2024',
                      location: 'Prambanan Temple',
                      attendees: 40,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PrambananJazzPage(),
                          ),
                        );
                      },
                    ),
                    EventCard(
                      image: 'assets/jogetin.png',
                      title: 'Joget-in Fest',
                      date: '22 June 2024',
                      location: 'Stadion Kridosono',
                      attendees: 40,
                      onTap: () {
                        // Tambahkan logika untuk menampilkan pesan atau snackbar
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Joget-in Fest clicked!'),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Categories',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              // Category cards
              Column(
                children: [
                  CategoryCard(
                    image: 'assets/exhibition.png',
                    title: 'Exhibition',
                  ),
                  CategoryCard(
                    image: 'assets/seminar.jpg',
                    title: 'Seminar',
                  ),
                  CategoryCard(
                    image: 'assets/workshop.jpg',
                    title: 'Workshop',
                  ),
                  CategoryCard(
                    image: 'assets/sport1.jpg',
                    title: 'Sport',
                  ),
                ],
              ),
            ],
          ),
        ),
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
        onTap: (int index) {
          if (index == 1) {
            // Index 1 adalah item "Tickets"
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TicketPage()),
            );
          } else if (index == 2) {
            // Index 2 adalah item "Profile"
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          }
        },
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final String image;
  final String title;
  final String date;
  final String location;
  final int attendees;
  final VoidCallback onTap;

  EventCard({
    required this.image,
    required this.title,
    required this.date,
    required this.location,
    required this.attendees,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.white, // Set card color to white
        child: Container(
          width: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1 / 1, // Menyesuaikan aspek rasio gambar
                child: Image.asset(image, fit: BoxFit.cover),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(date),
                    SizedBox(height: 5),
                    Text(location),
                    SizedBox(height: 5),
                    Text('$attendees people coming'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String image;
  final String title;

  CategoryCard({required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white, // Set card color to white
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.asset(image, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
