import 'dart:async';

import 'package:flutter/material.dart';
import '../theme/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushNamed(context, '/onboarding');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage(
              "assets/splash/Rectangle 64.png",
            ),
            colorFilter: ColorFilter.mode(
              whiteColor.withOpacity(0.2),
              BlendMode.dstATop,
            ),
            fit: BoxFit.cover,
          ),
          gradient: LinearGradient(
            colors: [
              const Color(0xffFBF8F2).withOpacity(0),
              const Color(0xffD5D1D1),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        alignment: Alignment.center,
        child: const Text(
          "Wedding Bells",
          style: bolditalic30PrimaryP,
        ),
      ),
    );
  }
}
