import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shadat_pubg/views/screens/home/alert_box.dart';
import 'package:shadat_pubg/views/screens/home/win_box.dart';
import 'package:shadat_pubg/views/themes/colors.dart';

typedef AsyncCallbackInt = Future<int> Function();

class TurnerButton extends StatefulWidget {
  final AsyncCallbackInt onTurn;
  const TurnerButton({
    super.key,
    required this.onTurn,
  });

  @override
  State<TurnerButton> createState() => _TurnerButtonState();
}

class _TurnerButtonState extends State<TurnerButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      upperBound: 0.2,
    )
      ..forward()
      ..addListener(() {
        if (_animationController.isCompleted) {
          _animationController.repeat(reverse: true);
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
    return InkWell(
      onTap: () {
        widget.onTurn().then(
          (value) async {
            if (value != -1) {
              await Future.delayed(const Duration(milliseconds: 5500));
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => WinBox(
                  value: "تهانينا!\n لقد حصلت على ${value + 1} من العجلة",
                ),
              );
            } else {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => const AlertBox(
                  message:
                      "مع الأسف، لا تملك شدات أخرى، شاهد إعلانا من أجل الحصول على شدات إضافية",
                ),
              );
            }
          },
        );
      },
      child: Transform.scale(
        scale: _animationController.value + 0.9,
        child: Container(
          height: 60,
          width: 120,
          decoration: BoxDecoration(
            color: PubgColors.yellowColor,
            borderRadius: BorderRadius.circular(35),
            border: Border.all(width: 6, color: PubgColors.orangeColor),
          ),
          child: const Center(
            child: Text(
              "تدوير",
              style: TextStyle(
                fontSize: 28,
                color: PubgColors.orangeColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
