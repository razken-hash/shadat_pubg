import 'package:flutter/material.dart';
import 'package:shadat_pubg/views/config/assets_manager.dart';

class PubgScaffold extends Scaffold {
  final Widget? content;
  final String backgroundImage;

  PubgScaffold({
    super.key,
    this.content,
    this.backgroundImage = "pubg_1",
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
    super.resizeToAvoidBottomInset = false,
    super.primary,
    super.drawerDragStartBehavior,
    super.extendBody = false,
    super.extendBodyBehindAppBar = false,
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
                  AssetsManager.getImage(backgroundImage),
                ),
                fit: BoxFit.fitHeight,
              ),
            ),
            child: Center(child: content),
          ),
        );
}
