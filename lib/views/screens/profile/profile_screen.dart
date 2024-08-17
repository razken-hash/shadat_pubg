import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadat_pubg/providers/auth/auth_provider.dart';
import 'package:shadat_pubg/views/config/assets_manager.dart';
import 'package:shadat_pubg/views/screens/auth/auth_screen.dart';
import 'package:shadat_pubg/views/themes/colors.dart';
import 'package:shadat_pubg/views/widgets/pubg_scaffold.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthenticationProvider>(
        builder: (context, authenticationProvider, child) {
      return PubgScaffold(
        backgroundImage: "pubg_3",
        content: Container(
          height: 500,
          width: double.infinity,
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: PubgColors.whiteColor.withOpacity(.7),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: PubgColors.primaryColor,
                radius: 64,
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.white24,
                  foregroundImage: NetworkImage(
                    authenticationProvider.gamer!.picture,
                  ),
                  backgroundImage: AssetImage(
                    AssetsManager.getImage(
                      "person",
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                authenticationProvider.gamer!.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: PubgColors.blackColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                authenticationProvider.gamer!.email,
                style: const TextStyle(
                  color: PubgColors.blackColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              const Divider(
                color: PubgColors.primaryColor,
              ),
              const SizedBox(height: 15),
              Text(
                "عدد الشدات لديك: ${authenticationProvider.gamer!.points} شدة",
                style: const TextStyle(
                  color: PubgColors.blackColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () async {
                  await authenticationProvider
                      .signOut()
                      .then((signOutSuccessful) {
                    if (signOutSuccessful) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AuthScreen(),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "لم يتم تسجيل الخروج، أعد المحاولة",
                          ),
                        ),
                      );
                    }
                  });
                },
                child: const Text(
                  "تسجيل الخروج",
                  style: TextStyle(
                    color: PubgColors.whiteColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
