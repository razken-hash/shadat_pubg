import 'package:flutter/material.dart';
import 'package:shadat_pubg/views/themes/colors.dart';
import 'package:shadat_pubg/views/widgets/pubg_scaffold.dart';

class InviteFriendsScreen extends StatelessWidget {
  const InviteFriendsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PubgScaffold(
      backgroundImage: "pubg_1",
      content: const Center(
        child: Text(
          "Invite Friends Screen",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: PubgColors.whiteColor,
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
