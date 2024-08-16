import 'package:flutter/material.dart';
import 'package:shadat_pubg/views/config/assets_manager.dart';
import 'package:shadat_pubg/views/themes/colors.dart';
import 'package:shadat_pubg/views/widgets/pubg_scaffold.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                foregroundImage: AssetImage(AssetsManager.getImage("person")),
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              "ABDERRAZAK KENNICHE",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: PubgColors.blackColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "ka_kenniche@esi.dz",
              style: TextStyle(
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
            const Text(
              "عدد الشدات لديك: 101 شدة",
              style: TextStyle(
                color: PubgColors.blackColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {},
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
  }
}
