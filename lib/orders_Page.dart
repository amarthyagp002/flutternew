import 'package:flutter/material.dart';

class OrdersPage extends StatefulWidget {
  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  int _currentIndex = 0;

  final List<Widget> _sections = [
    SellingSection(),
    BuyingSection(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
      ),
      body: _sections[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Selling',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Buying',
          ),
        ],
      ),
    );
  }
}

class SellingSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Selling Section'),
    );
  }
}

class BuyingSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Buying Section'),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: OrdersPage(),
  ));
}
