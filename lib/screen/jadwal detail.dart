import 'package:flutter/material.dart';

class ChooseTicketPage extends StatefulWidget {
  @override
  _ChooseTicketPageState createState() => _ChooseTicketPageState();
}

class _ChooseTicketPageState extends State<ChooseTicketPage> {
  String _selectedDate = '';
  String _selectedTicket = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Kembali ke halaman sebelumnya
          },
        ),
        title: Text('Choose Ticket'),
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
                'assets/denah.jpg', // Pastikan untuk menambahkan gambar Anda ke folder assets
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildDateButton('Fri\n5 Jul'),
                  _buildDateButton('Sat\n6 Jul'),
                  _buildDateButton('Sun\n7 Jul'),
                ],
              ),
              SizedBox(height: 16),
              _buildTicketOption(
                'Tiket Reguler - Festival - Hari 1',
                'Rp402.500',
                'Guest Starts: RAN, Yura Yunita, Nadin Amizah, Mocca Feat.Olski, JKT48, Dere, Collective, and Mitty Zasia',
              ),
              SizedBox(height: 16),
              _buildTicketOption(
                'Tiket Reguler - Super Festival - Hari 1',
                'Rp575.000',
                'Guest Starts: RAN, Yura Yunita, Nadin Amizah, Mocca Feat.Olski, JKT48, Dere, Collective, and Mitty Zasia',
              ),
              SizedBox(height: 32),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFC45390), // Warna tombol merah
                    padding: EdgeInsets.symmetric(
                        horizontal: 50, vertical: 20), // Padding tombol
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), // Radius border
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(
                        context, '/ticket'); // Navigasi ke halaman TicketPage
                  },
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                      'Book Now',
                      style: TextStyle(color: Colors.white), // Warna teks putih
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDateButton(String date) {
    return TextButton(
      onPressed: () {
        setState(() {
          _selectedDate = date;
        });
      },
      style: TextButton.styleFrom(
        backgroundColor:
            _selectedDate == date ? Color(0xFFC45390) : Colors.transparent,
        foregroundColor: _selectedDate == date ? Colors.white : Colors.black,
      ),
      child: Text(date),
    );
  }

  Widget _buildTicketOption(String title, String price, String details) {
    return TicketOption(
      title: title,
      price: price,
      details: details,
      isSelected: _selectedTicket == title,
      onSelected: () {
        setState(() {
          _selectedTicket = title;
        });
      },
    );
  }
}

class TicketOption extends StatefulWidget {
  final String title;
  final String price;
  final String details;
  final bool isSelected;
  final VoidCallback onSelected;

  TicketOption({
    required this.title,
    required this.price,
    required this.details,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  _TicketOptionState createState() => _TicketOptionState();
}

class _TicketOptionState extends State<TicketOption> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onSelected,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: widget.isSelected
              ? Color.fromARGB(255, 255, 255, 255)
              : Colors.white,
          borderRadius:
              BorderRadius.circular(20), // Border radius sesuai gambar
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
          border: widget.isSelected
              ? Border.all(color: Color(0xFFC45390), width: 2)
              : null, // Border saat dipilih
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.event_seat, color: Color(0xFFC45390)),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Visitor',
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  widget.price,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.pink,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove, color: Color(0xFFC45390)),
                      onPressed: () {},
                    ),
                    Text('1'),
                    IconButton(
                      icon: Icon(Icons.add, color: Color(0xFFC45390)),
                      onPressed: () {},
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _expanded = !_expanded;
                    });
                  },
                  child: Text(_expanded ? 'See Less' : 'See More'),
                ),
              ],
            ),
            if (_expanded)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8),
                  Text(widget.details),
                ],
              ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.payment, color: Color(0xFFC45390)),
                SizedBox(width: 8),
                Text('Payment'),
                Spacer(),
                Text('Transfer Bank - Bank Mandiri'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
