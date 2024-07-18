import 'package:flutter/material.dart';

class PrambananJazzPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Detail', style: TextStyle(color: Colors.black)),
        centerTitle: true, // Center the title text
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/prambanan1.jpg', // Make sure to add your image to assets
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 16),
              Text(
                'Prambanan Jazz 10',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    Icons.calendar_today,
                    color:
                        Color(0xFFC45390), // Mengatur warna ikon menjadi pink
                  ),
                  SizedBox(width: 8),
                  Text('05 Jul 2024 - 07 Jul 2024'),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    Icons.access_time,
                    color: Color(0xFFC45390),
                  ),
                  SizedBox(width: 8),
                  Text('Gates Open | 13.00'),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: Color(0xFFC45390),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Pelataran Candi Prambanan, Jln.Raya Solo, Yogyakarta',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text(
                'Get to know',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Enjoy a weekend to remember for jazz lovers at Prambanan Jazz 2024 #SatuDekadeBersama\n'
                'Sing along with the star-studded lineup Maliq & D’Essentials, Kahitna, Tulus, and more to be\n'
                'announced On 5, 6, and 7 July 2024, celebrate the magical moments against the stunning backdrop of\n'
                'the Prambanan temple\n'
                'Grab your tickets now and make some beautiful memories at Prambanan Temple',
              ),
              SizedBox(height: 16),
              Text(
                'Organizers',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(
                        'assets/rizky_setiawan.jpg'), // Add the organizer image to assets
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Rizky Setiawan',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('Social Event Manager'),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text(
                'More Information',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      color: Color(0xFFC45390),
                    ),
                    SizedBox(width: 16),
                    Text('Facilities'),
                  ],
                ),
              ),
              SizedBox(height: 2.0), // Adjust the height as needed
              GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    Icon(
                      Icons.help_outline,
                      color: Color(0xFFC45390),
                    ),
                    SizedBox(width: 16),
                    Text('Xperience Help Center'),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/choose-ticket');
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color(
                        0xFFC45390)), // Mengatur warna latar belakang menjadi pink
                    minimumSize: MaterialStateProperty.all<Size>(
                      Size(double.infinity,
                          50), // Mengatur lebar minimum menjadi maksimal (panjang penuh) dan tinggi 50
                    ),
                  ),
                  child: Text(
                    'Buy Ticket',
                    style: TextStyle(
                        color:
                            Colors.white), // Mengatur warna teks menjadi putih
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
