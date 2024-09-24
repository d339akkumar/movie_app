import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Get.off(HomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity, // Ensures the width covers the whole screen
        height: double.infinity, // Ensures the height covers the whole screen
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/splash.jpg'), // Path to your image
            fit: BoxFit.cover, // Makes sure the image covers the entire screen
          ),
        ),
      ),
    );
  }
}
