import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Sell_Interface extends StatefulWidget {
  const Sell_Interface({super.key});

  @override
  State<Sell_Interface> createState() => _Sell_InterfaceState();
}

class _Sell_InterfaceState extends State<Sell_Interface> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: const Text(
                'Which one you have to sale?',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
          ),
          SizedBox(
            height: 70,
          ),
          Container(
            width: double.infinity,
            child: const CircleAvatar(
              radius: 90,
              backgroundImage: AssetImage('assets/car1.png'),
            ),
          ),
          TextButton(onPressed: () {}, child: const Text('car')),
          const CircleAvatar(
            radius: 90,
            backgroundImage: AssetImage('assets/bike.jpg'),
          ),
          TextButton(onPressed: () {}, child: const Text('bike'))
        ],
      ),
    ));
  }
}
