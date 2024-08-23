import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadat_pubg/providers/auth/auth_provider.dart';
import 'package:shadat_pubg/views/screens/auth/auth_screen.dart';
import 'package:shadat_pubg/views/screens/pubg_screen.dart';
import 'package:shadat_pubg/views/themes/colors.dart';
import 'package:shadat_pubg/views/widgets/pubg_scaffold.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double progress = 0;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 1)).then((_) {
      setState(() {
        progress = 200;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return PubgScaffold(
      backgroundImage: "pubg_0",
      content: Center(
        child: Container(
          width: 200,
          height: 20,
          margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * .5,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              width: 2,
              color: PubgColors.tertiaryColor,
            ),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: AnimatedContainer(
              duration: const Duration(seconds: 1),
              curve: Curves.easeInToLinear,
              color: PubgColors.tertiaryColor,
              width: progress,
              height: 20,
              onEnd: () async {
                final stream = AuthenticationProvider.authStateChanges;
                await stream.firstWhere((User? user) {
                  if (user != null) {
                    Provider.of<AuthenticationProvider>(context, listen: false)
                        .createGamer(user)
                        .then((value) {
                      if (mounted) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => const PubgScreen()),
                        );
                      }

                      return true; // Stop listening after navigating
                    });
                  } else {
                    if (mounted) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const AuthScreen()),
                      );
                    }
                  }
                  return false;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
