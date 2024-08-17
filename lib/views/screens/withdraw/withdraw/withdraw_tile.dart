import 'package:flutter/material.dart';
import 'package:shadat_pubg/views/config/assets_manager.dart';
import 'package:shadat_pubg/views/themes/colors.dart';

class WithdrawTile extends StatelessWidget {
  final int value;
  const WithdrawTile({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: PubgColors.primaryColor.withOpacity(.5),
      ),
      height: 80,
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  width: 20,
                ),
                Image.asset(
                  width: 60,
                  fit: BoxFit.fitWidth,
                  AssetsManager.getImage("golden_box"),
                ),
                const SizedBox(
                  width: 10,
                ),
                Center(
                  child: Text(
                    "$value",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              width: 130,
              color: PubgColors.primaryColor,
              child: const Center(
                child: Text(
                  "سحب",
                  style: TextStyle(
                    color: PubgColors.whiteColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
