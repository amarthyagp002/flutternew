import 'package:akary/view/home/user/cart_screen.dart';
import 'package:akary/view/home/user/page/home_page.dart';
import 'package:akary/view/home/user/page/sell_page.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  int _selectedIndex = 0;
  final _screens = [
    const HomePage(),
    SellPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.white,
          onTap: _onTapped,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.add_circle), label: 'BOOKINGS'),
            BottomNavigationBarItem(icon: Icon(Icons.handshake), label: 'SELL')
          ]),
    );
  }

  void _onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
