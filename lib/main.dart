import 'package:flutter/material.dart';
import 'package:shadat_pubg/views/screens/splash_screen.dart';

void main() {
  runApp(const ShadatPubg());
}

class ShadatPubg extends StatelessWidget {
  const ShadatPubg({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
