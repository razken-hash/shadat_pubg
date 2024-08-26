import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadat_pubg/providers/auth/auth_provider.dart';
import 'package:shadat_pubg/providers/drawer/drawer_provider.dart';
import 'package:shadat_pubg/views/config/internationalization.dart';
import 'package:shadat_pubg/views/screens/splash/splash_screen.dart';
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

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthenticationProvider>(
          create: (context) => AuthenticationProvider(),
        ),
        ChangeNotifierProvider<DrawerProvider>(
          create: (context) => DrawerProvider(),
        ),
      ],
      child: MaterialApp(
        localizationsDelegates: [myLocalizationDelegate],
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        home: const SplashScreen(),
      ),
    );
  }
}
