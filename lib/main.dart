import 'dart:math';

import 'package:akary/User_Details_Page.dart';
import 'package:akary/cart1.dart';
import 'package:akary/customer_profile.dart';
import 'package:akary/first_home.dart';
import 'package:akary/orders_Page.dart';

import 'package:akary/settings_page.dart';
import 'package:akary/staff_profile.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:akary/home_page.dart';
import 'package:akary/login_page.dart';
//import 'package:akary/front_end_o/selection_page.dart';
//import 'package:akary/front_end_o/splash_screen.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark,
      primarySwatch: Colors.blue),
      home: Loginpage());
  }
}
