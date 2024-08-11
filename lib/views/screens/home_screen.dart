import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shadat_pubg/views/themes/colors.dart';
import 'package:shadat_pubg/views/widgets/pubg_scaffold.dart';
import 'package:shadat_pubg/views/widgets/spin_wheel_painter.dart';
import 'package:shadat_pubg/views/widgets/spin_wheel_pointer_painter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double turns = 0;

  @override
  Widget build(BuildContext context) {
    return PubgScaffold(
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 40,
            width: 40,
            child: CustomPaint(
              painter: TriangleShape(),
              child: const Center(),
            ),
          ),
          AnimatedRotation(
            duration: const Duration(seconds: 3),
            turns: turns,
            child: Container(
              height: 320,
              width: 320,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
                border: Border.all(
                  width: 10,
                  color: Colors.yellow,
                ),
              ),
              child: CustomPaint(
                painter: SpinWheelPainter(),
                child: const Center(),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: TextButton.icon(
              onPressed: () {
                setState(() {
                  turns = turns < 2
                      ? 11 + 0.0625 * (Random().nextInt(1000) * 2 + 1)
                      : 0.0625 * (Random().nextInt(1000) * 2 + 1);
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
          ),
        ],
      ),
    );
  }
}
