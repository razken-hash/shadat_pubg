import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shadat_pubg/views/config/assets_manager.dart';
import 'package:shadat_pubg/views/themes/colors.dart';
import 'package:shadat_pubg/views/widgets/pubg_scaffold.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PubgScaffold(
      content: Directionality(
        textDirection: TextDirection.rtl,
        child: TextButton.icon(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => PubgScaffold(),
              ),
            );
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
  }
}
