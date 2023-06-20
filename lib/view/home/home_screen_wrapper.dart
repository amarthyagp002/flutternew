import 'package:akary/view/home/user/user_screen.dart';
import 'package:akary/view/auth/sign_in_screen.dart';
import 'package:flutter/material.dart';

import '../../staff_profile.dart';

class HomeScreenWrapper extends StatelessWidget {
  const HomeScreenWrapper({super.key, required this.role});
  final String role;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Builder(builder: (context) {
      if (role == "USER") {
        return const UserScreen();
      } else if (role == "STAFF") {
        return const StaffProfile();
      } else {
        return const SignInScreen();
      }
    }));
  }
}
