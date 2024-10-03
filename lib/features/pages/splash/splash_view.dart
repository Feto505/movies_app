import 'dart:async';

import 'package:flutter/material.dart';

import '../../../core/config/page_routes_name.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2),
        () => Navigator.pushReplacementNamed(context, PageRoutesName.layout));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/splash_screen.png',
          fit: BoxFit.fill,
          width: double.infinity,
        ),
      ),
    );
  }
}
