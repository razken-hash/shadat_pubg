import 'package:flutter/material.dart';
import 'package:shadat_pubg/views/screens/withdraw/withdraw/withdraw_tile.dart';

class WithdrawSection extends StatelessWidget {
  const WithdrawSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        WithdrawTile(
          value: 500,
        ),
        SizedBox(height: 10),
        WithdrawTile(
          value: 1000,
        ),
        SizedBox(height: 10),
        WithdrawTile(
          value: 1500,
        ),
      ],
    );
  }
}
