// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shadat_pubg/providers/auth/auth_provider.dart';
import 'package:shadat_pubg/views/config/assets_manager.dart';
import 'package:shadat_pubg/views/screens/home/alert_box.dart';
import 'package:shadat_pubg/views/screens/home/win_box.dart';
import 'package:shadat_pubg/views/themes/colors.dart';
import 'package:shadat_pubg/views/widgets/pubg_scaffold.dart';

class DailyPrizeScreen extends StatefulWidget {
  const DailyPrizeScreen({super.key});

  @override
  State<DailyPrizeScreen> createState() => _DailyPrizeScreenState();
}

class _DailyPrizeScreenState extends State<DailyPrizeScreen> {
  int selectedPrise = 0;

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
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: PubgColors.primaryColor,
                    borderRadius: BorderRadius.circular(20),
                    border:
                        Border.all(width: 2, color: PubgColors.secondaryColor),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AnimatedFlipCounter(
                        duration: const Duration(milliseconds: 500),
                        value: authenticationProvider.gamer!.points,
                        textStyle: const TextStyle(
                          color: PubgColors.whiteColor,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Image.asset(
                        AssetsManager.getImage("money"),
                        height: 20,
                      ),
                    ],
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
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          PrizeBox(
                            prize: 1,
                            isSelected: selectedPrise == 1,
                          ),
                          PrizeBox(
                            prize: 2,
                            isSelected: selectedPrise == 2,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          PrizeBox(
                            prize: 3,
                            isSelected: selectedPrise == 3,
                          ),
                          PrizeBox(
                            prize: 4,
                            isSelected: selectedPrise == 4,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          PrizeBox(
                            prize: 5,
                            isSelected: selectedPrise == 5,
                          ),
                          PrizeBox(
                            prize: 6,
                            isSelected: selectedPrise == 6,
                          ),
                        ],
                      ),
                    ),
                    PrizeBox(
                      prize: 10,
                      isSelected: selectedPrise == 10,
                    ),
                    const SizedBox(height: 30),
                    TextButton(
                      onPressed: () {
                        List<int> prises = [1, 2, 3, 4, 5, 6, 10];
                        int dailyPrise =
                            prises[Random().nextInt(prises.length)];
                        authenticationProvider
                            .getDailyPrise(prise: dailyPrise)
                            .then(
                          (isPrised) {
                            selectedPrise = dailyPrise;
                            if (isPrised) {
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) => WinBox(
                                  value:
                                      "لقد حصلت على جائزتك اليومية $selectedPrise عملة!",
                                ),
                              );
                            } else {
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) => const AlertBox(
                                  message:
                                      "لقد حصلت على جائزتك لهذا اليوم، أعد المحاولة غدا!",
                                ),
                              );
                            }
                          },
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
  final bool isSelected;
  const PrizeBox({
    super.key,
    required this.prize,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: isSelected ? PubgColors.yellowColor : PubgColors.primaryColor,
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
