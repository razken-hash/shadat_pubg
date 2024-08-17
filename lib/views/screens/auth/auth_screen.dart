import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shadat_pubg/providers/auth/auth_provider.dart';
import 'package:shadat_pubg/views/config/assets_manager.dart';
import 'package:shadat_pubg/views/screens/pubg_screen.dart';
import 'package:shadat_pubg/views/themes/colors.dart';
import 'package:shadat_pubg/views/widgets/pubg_scaffold.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthenticationProvider>(
      create: (context) => AuthenticationProvider(),
      child: Consumer<AuthenticationProvider>(
          builder: (context, authenticationProvider, child) {
        return PubgScaffold(
          content: Directionality(
            textDirection: TextDirection.rtl,
            child: TextButton.icon(
              onPressed: () async {
                authenticationProvider.signIn().then((gamer) {
                  if (gamer != null) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const PubgScreen(),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "لم يتم تسجيل الدخول، أعد المحاولة",
                        ),
                      ),
                    );
                  }
                });
              },
              icon: SvgPicture.asset(
                AssetsManager.getVector("google"),
                width: 30,
              ),
              label: const Text(
                "تسجيل الدخول",
                style: TextStyle(
                  color: PubgColors.whiteColor,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
