import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadat_pubg/providers/auth/auth_provider.dart';

import 'package:shadat_pubg/views/config/assets_manager.dart';
import 'package:shadat_pubg/views/themes/colors.dart';
import 'package:shadat_pubg/views/widgets/pubg_scaffold.dart';

class DailyPrizeScreen extends StatelessWidget {
  const DailyPrizeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthenticationProvider>(
        builder: (context, authenticationProvider, child) {
      return PubgScaffold(
        backgroundImage: "pubg_2",
        content: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    color: PubgColors.primaryColor,
                    borderRadius: BorderRadius.circular(20),
                    border:
                        Border.all(width: 2, color: PubgColors.secondaryColor),
                  ),
                  child: Text(
                    "${authenticationProvider.gamer!.points}",
                    style: const TextStyle(
                      color: PubgColors.whiteColor,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Container(
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
                      "الجائزة اليومية",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: PubgColors.blackColor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          PrizeBox(
                            prize: 1,
                          ),
                          PrizeBox(
                            prize: 2,
                          ),
                        ],
                      ),
                    ),
                    const Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          PrizeBox(
                            prize: 3,
                          ),
                          PrizeBox(
                            prize: 4,
                          ),
                        ],
                      ),
                    ),
                    const Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          PrizeBox(
                            prize: 5,
                          ),
                          PrizeBox(
                            prize: 6,
                          ),
                        ],
                      ),
                    ),
                    const PrizeBox(
                      prize: 10,
                    ),
                    const SizedBox(height: 30),
                    TextButton(
                      onPressed: () {
                        List<int> values = [1, 2, 3, 4, 5, 6, 10];
                        authenticationProvider.updatePoints(
                          points: values[Random().nextInt(values.length)],
                        );
                      },
                      child: const Text(
                        "مطالبة",
                        style: TextStyle(
                          color: PubgColors.whiteColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              const Spacer(),
              const Spacer(),
            ],
          ),
        ),
      );
    });
  }
}

class PrizeBox extends StatelessWidget {
  final int prize;
  const PrizeBox({
    super.key,
    required this.prize,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: PubgColors.primaryColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AssetsManager.getImage("golden_box")),
            const SizedBox(
              width: 10,
            ),
            Text(
              "$prize",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
