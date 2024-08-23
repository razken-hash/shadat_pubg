import 'package:flutter/material.dart';
import 'package:shadat_pubg/views/themes/colors.dart';

class TurnerButton extends StatefulWidget {
  final VoidCallback onTurn;
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
        widget.onTurn();
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
                fontSize: 30,
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
