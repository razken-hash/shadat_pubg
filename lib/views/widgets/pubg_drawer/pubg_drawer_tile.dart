import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shadat_pubg/providers/drawer/drawer_item.dart';
import 'package:shadat_pubg/views/config/assets_manager.dart';
import 'package:shadat_pubg/views/themes/colors.dart';

class PubgDrawerTile extends StatelessWidget {
  final DrawerItem drawerItem;
  final bool isSelected;
  final VoidCallback onItemSelected;

  const PubgDrawerTile({
    super.key,
    required this.drawerItem,
    required this.isSelected,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 24),
          child: Divider(color: Colors.white24, height: 20),
        ),
        Stack(
          children: [
            AnimatedPositionedDirectional(
              start: 10,
              duration: const Duration(milliseconds: 300),
              height: 56,
              width: isSelected ? 278 : 0,
              child: Container(
                decoration: BoxDecoration(
                  color: PubgColors.tertiaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            ListTile(
              leading: SvgPicture.asset(
                width: 35,
                fit: BoxFit.fitWidth,
                AssetsManager.getVector(drawerItem.icon),
                color: PubgColors.whiteColor,
              ),
              title: Text(
                drawerItem.label,
                style: const TextStyle(
                  color: PubgColors.whiteColor,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
