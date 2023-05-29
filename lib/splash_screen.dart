import 'dart:async';
import 'package:ads/home.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splashscreen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(const Duration(seconds: 3), _goNext);
  }

  _goNext() {
    Navigator.pushReplacementNamed(context, MyHomePage.routeName);
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromRGBO(20, 10, 38, 1),
      body: SafeArea(
        child: Center(
          child: Text('Ads app', style: TextStyle(color: Colors.white, fontSize: 20),),
        ),
      ),
    );
  }
}
