import 'dart:async';

import 'package:akary/view/home/home_screen_wrapper.dart';
import 'package:akary/service/auth_service.dart';
import 'package:akary/view/auth/sign_in_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () async {
      final bool isUserLoggedIn = AuthService.isUserLoggedIn();
      if (isUserLoggedIn) {
        final String role = await AuthService.getRole();
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (BuildContext context) => HomeScreenWrapper(
              role: role,
            ),
          ),
        );
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (BuildContext context) => const SignInScreen(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Wrap(
          direction: Axis.vertical,
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            const Image(
              image: AssetImage('assets/splash_screen_logo.png'),
              width: 300,
              height: 300,
            ),
            Transform.translate(
              offset: const Offset(0, -50),
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText('Akary',
                      textStyle: GoogleFonts.pirataOne(
                        fontSize: 46.0,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey[800],
                      ),
                      speed: const Duration(milliseconds: 200),
                      cursor: ""),
                ],
                totalRepeatCount: 1,
                pause: const Duration(milliseconds: 500),
                displayFullTextOnTap: true,
                stopPauseOnTap: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
