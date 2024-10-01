import 'dart:async';

import 'package:flutter/material.dart';
import 'package:roz_dhan/color_theme.dart';
import 'package:roz_dhan/screens/home_screen.dart';
import 'package:roz_dhan/screens/login_screen.dart';
import 'package:roz_dhan/services/shared_prefs.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () async {
      bool isLoggedIn = await SharedPrefs.isUserLoggedIn();
      _navigateToHomeOrLogin(isLoggedIn: isLoggedIn);
    });
  }

  void _navigateToHomeOrLogin({required bool isLoggedIn}) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>
            isLoggedIn ? const HomeScreen() : const LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: ColorTheme.backgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  width: size.width * 0.4,
                  height: size.height * 0.25,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.error,
                        size: 100, color: Colors.red);
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: size.height * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Powered by ',
                    style: TextStyle(
                        fontSize: size.width * 0.04, color: Colors.black),
                  ),
                  Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: size.width * 0.04,
                  ),
                  Text(
                    ' Roz Dhan',
                    style: TextStyle(
                        fontSize: size.width * 0.04, color: Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
