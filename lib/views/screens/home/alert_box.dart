// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:shadat_pubg/views/config/assets_manager.dart';
import 'package:shadat_pubg/views/themes/colors.dart';

class AlertBox extends StatelessWidget {
  final String message;
  const AlertBox({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 4, color: PubgColors.yellowColor),
            color: PubgColors.orangeColor,
          ),
          height: 280,
          padding: const EdgeInsets.all(
            10,
          ),
          width: 230,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                height: 60,
                AssetsManager.getImage("alert"),
                color: PubgColors.yellowColor,
              ),
              Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  color: PubgColors.whiteColor,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 45,
                  width: 140,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1DEBD),
                    borderRadius: BorderRadius.circular(35),
                    border: Border.all(width: 4, color: PubgColors.yellowColor),
                  ),
                  child: const Center(
                    child: Text(
                      "حسنا",
                      style: TextStyle(
                        fontSize: 15,
                        color: PubgColors.orangeColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
