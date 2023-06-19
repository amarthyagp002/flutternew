// import 'package:car/cart.dart';
// import 'package:car/cart1.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/src/widgets/placeholder.dart';
import 'LoginScreen.dart';
import '../cart1.dart';
import 'signup.dart';
import '../selection.dart';
import '../first_home.dart';
import '../NewSplash.dart';
import 'sell_interface.dart';
import 'sell_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            brightness: Brightness.dark, primarySwatch: Colors.purple),
        home: Cart());
  }
}
