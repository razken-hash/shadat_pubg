import 'package:flutter/material.dart';
import 'package:shadat_pubg/views/screens/splash_screen.dart';
import 'package:shadat_pubg/views/themes/themes.dart';

void main() {
  runApp(const ShadatPubg());
}

class ShadatPubg extends StatelessWidget {
  const ShadatPubg({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        home: const SplashScreen(),
      ),
    );
  }
}
