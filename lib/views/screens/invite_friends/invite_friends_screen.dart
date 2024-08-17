import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shadat_pubg/views/config/assets_manager.dart';
import 'package:shadat_pubg/views/themes/colors.dart';
import 'package:shadat_pubg/views/widgets/pubg_scaffold.dart';
import 'package:share_plus/share_plus.dart';

class InviteFriendsScreen extends StatelessWidget {
  const InviteFriendsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PubgScaffold(
      backgroundImage: "pubg_2",
      resizeToAvoidBottomInset: false,
      extendBody: false,
      extendBodyBehindAppBar: false,
      content: Container(
        height: 600,
        width: double.infinity,
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: PubgColors.whiteColor.withOpacity(.7),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            const Text(
              "أدخل رمز إحالة الصديق",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: PubgColors.blackColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const FractionallySizedBox(
              widthFactor: .6,
              child: TextField(
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 15),
            TextButton(
              onPressed: () {},
              child: const Text(
                "تأكيــد",
                style: TextStyle(
                  color: PubgColors.whiteColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              child: Divider(color: PubgColors.primaryColor),
            ),
            const Text(
              "قم بدعوة الأصدقاء والعائلة",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: PubgColors.blackColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            FractionallySizedBox(
              widthFactor: .6,
              child: TextField(
                controller: TextEditingController(
                  text: "123456",
                ),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      AssetsManager.getVector(
                        "document",
                      ),
                    ),
                  ),
                  suffixIcon: InkWell(
                    onTap: () async {
                      final result = await Share.share('123456');
                      if (result.status == ShareResultStatus.success) {}
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Transform.rotate(
                        angle: -pi / 2,
                        child: SvgPicture.asset(
                          AssetsManager.getVector(
                            "send",
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            TextButton(
              onPressed: () {},
              child: const Text(
                "مشاركة الكود",
                style: TextStyle(
                  color: PubgColors.whiteColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              child: Divider(color: PubgColors.primaryColor),
            ),
            const Text(
              "عدد الدعوات التي قمت بإرسالها\n 0",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: PubgColors.blackColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            const Text(
              "يمكنك الحصول على 10 شدات عن طريق إحالة صديق ويتمكن الصديق من الحصول على 3 لفات مجانية",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: PubgColors.blackColor,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
