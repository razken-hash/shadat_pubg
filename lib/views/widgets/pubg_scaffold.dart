import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shadat_pubg/views/config/assets_manager.dart';
import 'package:shadat_pubg/views/themes/colors.dart';

class PubgScaffold extends Scaffold {
  final Widget? content;

  PubgScaffold({
    super.key,
    this.content,
    super.appBar,
    super.floatingActionButton,
    super.floatingActionButtonLocation,
    super.floatingActionButtonAnimator,
    super.persistentFooterButtons,
    super.persistentFooterAlignment,
    super.drawer,
    super.onDrawerChanged,
    super.endDrawer,
    super.onEndDrawerChanged,
    super.bottomNavigationBar,
    super.bottomSheet,
    super.backgroundColor,
    super.resizeToAvoidBottomInset,
    super.primary,
    super.drawerDragStartBehavior,
    super.extendBody,
    super.extendBodyBehindAppBar,
    super.drawerScrimColor,
    super.drawerEdgeDragWidth,
    super.drawerEnableOpenDragGesture,
    super.endDrawerEnableOpenDragGesture,
    super.restorationId,
  }) : super(
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  AssetsManager.getImage("pubg_fighter"),
                ),
                fit: BoxFit.fitHeight,
              ),
            ),
            child: Expanded(
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Transform.rotate(
                      angle: pi,
                      child: SvgPicture.asset(
                        fit: BoxFit.fitWidth,
                        color: PubgColors.secondaryColor.withOpacity(.75),
                        AssetsManager.getVector("floor"),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    bottom: 0,
                    child: SvgPicture.asset(
                      fit: BoxFit.fitWidth,
                      color: PubgColors.secondaryColor.withOpacity(.75),
                      AssetsManager.getVector("floor"),
                    ),
                  ),
                  Center(child: content),
                ],
              ),
            ),
          ),
        );
}
