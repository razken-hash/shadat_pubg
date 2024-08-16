import 'package:flutter/material.dart';
import 'package:shadat_pubg/views/themes/colors.dart';

class DailyPrizeScreen extends StatelessWidget {
  const DailyPrizeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Daily Prize Screen",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: PubgColors.primaryColor,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
