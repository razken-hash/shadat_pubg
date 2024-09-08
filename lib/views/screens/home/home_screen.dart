// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'package:shadat_pubg/providers/auth/auth_provider.dart';
import 'package:shadat_pubg/views/config/assets_manager.dart';
import 'package:shadat_pubg/views/screens/home/alert_box.dart';
import 'package:shadat_pubg/views/screens/home/golden_box_button.dart';
import 'package:shadat_pubg/views/screens/home/rotated_light.dart';
import 'package:shadat_pubg/views/screens/home/turner_button.dart';
import 'package:shadat_pubg/views/themes/colors.dart';
import 'package:shadat_pubg/views/widgets/pubg_scaffold.dart';
import 'package:shadat_pubg/views/widgets/spin_wheel_painter.dart';
import 'package:shadat_pubg/views/widgets/spin_wheel_pointer_painter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  double turns = 0;
  double imageTurns = 0;

  late AnimationController _animationController;

  double angle = 0;
  bool back = false;
  int index = 0;

  final spinPlayer = AudioPlayer();

  @override
  void initState() {
    setState(() {
      imageTurns = 1000;
    });
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {
          angle = !back ? angle + 1 : angle - 1;
          if (angle == 3) {
            back = true;
          } else if (angle == -3) {
            back = false;
          }
        });
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
      return PubgScaffold(
        content: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SvgPicture.asset(
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fitWidth,
                color: const Color(0xFF1777AC).withOpacity(.8),
                AssetsManager.getVector("floor"),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 20,
                    width: double.infinity,
                    color: const Color(0xFF1777AC).withOpacity(.8),
                  ),
                  Transform.rotate(
                    angle: pi,
                    child: SvgPicture.asset(
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fitWidth,
                      color: const Color(0xFF1777AC).withOpacity(.8),
                      AssetsManager.getVector("floor"),
                    ),
                  ),
                ],
              ),
            ),
            const PositionedDirectional(
              start: -200,
              child: RotatedLight(
                color: PubgColors.blackColor,
              ),
            ),
            PositionedDirectional(
              bottom: -200,
              start: (MediaQuery.of(context).size.width - 400) / 2,
              child: const RotatedLight(
                color: PubgColors.whiteColor,
              ),
            ),
            SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: PubgColors.primaryColor,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            width: 2, color: PubgColors.secondaryColor),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AnimatedFlipCounter(
                            duration: const Duration(milliseconds: 500),
                            value: authenticationProvider.gamer!.turns,
                            textStyle: const TextStyle(
                              color: PubgColors.whiteColor,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Image.asset(
                            AssetsManager.getImage("wheel"),
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: PubgColors.primaryColor,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            width: 2, color: PubgColors.secondaryColor),
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
                  SizedBox(
                    height: 320,
                    width: 320,
                    child: Stack(
                      children: [
                        AnimatedRotation(
                          duration: const Duration(seconds: 5),
                          curve: Curves.easeInOutSine,
                          turns: turns,
                          child: Container(
                            height: 320,
                            width: 320,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: CustomPaint(
                              painter: SpinWheelPainter(),
                            ),
                          ),
                        ),
                        AnimatedRotation(
                          turns: _animationController.isAnimating
                              ? angle > 0
                                  ? 0.05
                                  : -0.05
                              : 0,
                          duration: const Duration(milliseconds: 200),
                          child: Center(
                            child: SizedBox(
                              height: 80,
                              width: 80,
                              child: CustomPaint(
                                painter: SpinWheelPointerPainter(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TurnerButton(
                    onTurn: () async {
                      if (authenticationProvider.canTurnWheel) {
                        await spinPlayer.play(
                          AssetSource(
                            AssetsManager.getAudio("spin"),
                          ),
                        );

                        if (_animationController.value == 0) {
                          _animationController.forward();
                        } else {
                          _animationController.reverse();
                        }
                        setState(() {
                          turns = turns -
                              (turns == 0 ? 0 : 0.0625) +
                              20 +
                              0.0625 * (Random().nextInt(8) * 2 + 1);
                        });
                        double a = turns - turns.toInt();
                        double b = a / 0.0625;
                        int intB = b.toInt();
                        index = 7 - intB ~/ 2;
                        Future.delayed(const Duration(seconds: 5))
                            .then((value) {
                          authenticationProvider.updatePoints(
                              points: index + 1);
                          authenticationProvider.updateTurns(turns: -1);
                        });
                        return index;
                      }
                      return -1;
                    },
                  ),
                  const Spacer(),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}",
                          style: const TextStyle(
                            fontSize: 20,
                            color: PubgColors.whiteColor,
                          ),
                        ),
                        const GoldenBoxButton(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
