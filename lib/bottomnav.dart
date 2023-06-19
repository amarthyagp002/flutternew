import 'package:akary/cart1.dart';
import 'package:akary/home_page.dart';
import 'package:akary/sell.dart';
import 'package:flutter/material.dart';

class Bottomnav extends StatefulWidget {
  const Bottomnav({super.key});

  @override
  State<Bottomnav> createState() => _BottomnavState();
}

class _BottomnavState extends State<Bottomnav> {
  int _selectedIndex = 0;
  final _screens1 = [
     homepage(),
     SellPage(),
     Cart()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens1[_selectedIndex],
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.white,
          onTap: _ontapped,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'HOME'),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_circle), label: 'BOOKINGS'),
            BottomNavigationBarItem(icon: Icon(Icons.handshake), label: 'ACCOUNT')
          ]),
    );
  }

  void _ontapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}