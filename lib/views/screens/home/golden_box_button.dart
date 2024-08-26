import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadat_pubg/providers/auth/auth_provider.dart';
import 'package:shadat_pubg/views/config/assets_manager.dart';
import 'package:shadat_pubg/views/screens/home/alert_box.dart';
import 'package:shadat_pubg/views/screens/home/win_box.dart';
import 'package:shadat_pubg/views/themes/colors.dart';

class GoldenBoxButton extends StatefulWidget {
  const GoldenBoxButton({super.key});

  @override
  State<GoldenBoxButton> createState() => _GoldenBoxButtonState();
}

class _GoldenBoxButtonState extends State<GoldenBoxButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      lowerBound: 0,
      upperBound: 0.2,
    )
      ..forward()
      ..addListener(() async {
        if (_animationController.isCompleted) {
          await Future.delayed(const Duration(seconds: 1)).then((value) {
            _animationController.repeat(reverse: true);
          });
        }
        setState(() {});
      });

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthenticationProvider>(
        builder: (context, authenticationProvider, child) {
      return InkWell(
        onTap: () {
          authenticationProvider.getGoldenBoxGift().then(
            (isGifted) {
              if (isGifted) {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => const WinBox(
                    value: "لقد حصلت على هديتك اليومية 1 عملة!",
                  ),
                );
              } else {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => const AlertBox(
                    message:
                        "لقد حصلت على هديتك لهذا اليوم، أعد المحاولة غدا!",
                  ),
                );
              }
            },
          );
        },
        child: AnimatedRotation(
          duration: const Duration(seconds: 1),
          turns: _animationController.status == AnimationStatus.forward
              ? 0.05
              : -0.05,
          curve: Curves.bounceInOut,
          child: Column(
            children: [
              Image.asset(
                AssetsManager.getImage("box"),
                height: 50,
              ),
              Container(
                height: 30,
                width: 90,
                decoration: BoxDecoration(
                  color: const Color(0xFFF1DEBD),
                  borderRadius: BorderRadius.circular(35),
                  border: Border.all(width: 4, color: PubgColors.yellowColor),
                ),
                child: const Center(
                  child: Text(
                    "جمـع",
                    style: TextStyle(
                      fontSize: 15,
                      color: PubgColors.orangeColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
