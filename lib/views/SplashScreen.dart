import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:plant_cart/views/homeView.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    timer();
  }

  void timer() {
    Future.delayed(
        const Duration(seconds: 1),
        () async => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeView()),
              )
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Container(child: Lottie.asset("assets/logo.json"))),
    );
  }
}
