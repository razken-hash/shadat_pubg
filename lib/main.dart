import 'package:flutter/material.dart';
import 'package:shadat_pubg/views/config/internationalization.dart';
import 'package:shadat_pubg/views/screens/pubg_screen.dart';
import 'package:shadat_pubg/views/screens/splash/splash_screen.dart';
import 'package:shadat_pubg/views/themes/themes.dart';

void main() {
  runApp(const ShadatPubg());
}

class ShadatPubg extends StatelessWidget {
  const ShadatPubg({super.key});

  @override
  Widget build(BuildContext context) {
    final MyLocalization myLocalization = MyLocalization();
    final MyLocalizationDelegate myLocalizationDelegate =
        MyLocalizationDelegate(myLocalization);

    return MaterialApp(
      localizationsDelegates: [myLocalizationDelegate],
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      home: const PubgScreen(),
    );
  }
}
