import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadat_pubg/providers/auth/auth_provider.dart';
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
  double turns = 0.0625 * 2;

  late AnimationController _animationController;

  double angle = 0;
  bool back = false;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
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
  Widget build(BuildContext context) {
    return Consumer<AuthenticationProvider>(
        builder: (context, authenticationProvider, child) {
      return PubgScaffold(
        content: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              SizedBox(
                height: 320,
                width: 320,
                child: Stack(
                  children: [
                    AnimatedRotation(
                      duration: const Duration(seconds: 3),
                      turns: turns,
                      child: Container(
                        height: 320,
                        width: 320,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
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
              TextButton.icon(
                onPressed: () {
                  if (_animationController.value == 0) {
                    _animationController.forward();
                  } else {
                    _animationController.reverse();
                  }
                  setState(() {
                    turns = 20 + 0.0625 * (Random().nextInt(1000) * 2 + 1);
                  });
                },
                icon: const Icon(
                  Icons.rotate_left,
                  color: PubgColors.whiteColor,
                ),
                label: const Text(
                  "تدويــر",
                  style: TextStyle(
                    color: PubgColors.whiteColor,
                  ),
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
