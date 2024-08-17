import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shadat_pubg/views/config/internationalization.dart';
import 'package:shadat_pubg/views/screens/auth/auth_screen.dart';
import 'package:shadat_pubg/views/screens/pubg_screen.dart';
import 'package:shadat_pubg/views/themes/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyAAGUCZNv3Ot6l_6WxdegzsVjX7NdrA05U",
          appId: "1:357638402694:android:a5f5d3b282aa5f50125707",
          messagingSenderId: "",
          projectId: "uc-03-3c481"));
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
      home: const AuthScreen(),
    );
  }
}
