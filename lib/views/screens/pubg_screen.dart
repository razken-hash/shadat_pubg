import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shadat_pubg/providers/drawer/drawer_provider.dart';
import 'package:shadat_pubg/views/config/assets_manager.dart';
import 'package:shadat_pubg/views/themes/colors.dart';
import 'package:shadat_pubg/views/widgets/pubg_drawer/pubg_drawer.dart';

class PubgScreen extends StatefulWidget {
  const PubgScreen({super.key});

  @override
  State<PubgScreen> createState() => _PubgScreenState();
}

class _PubgScreenState extends State<PubgScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late Animation<double> _scaleAnimation;

  final player = AudioPlayer();

  @override
  void initState() {
    // player.setReleaseMode(ReleaseMode.loop);
    // player.play(AssetSource(AssetsManager.getAudio("background")));
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500))
      ..addListener(() {
        setState(() {});
      });

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );

    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DrawerProvider>(
      builder: (context, drawerProvider, child) {
        return PopScope(
          canPop: !drawerProvider.isDrawerOpened,
          onPopInvoked: (didPop) {
            if (drawerProvider.isDrawerOpened) {
              drawerProvider.controlDrawer(_animationController);
            }
          },
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  AssetsManager.getImage("pubg_3"),
                ),
                fit: BoxFit.fitHeight,
              ),
            ),
            child: Scaffold(
              extendBody: false,
              resizeToAvoidBottomInset: false,
              extendBodyBehindAppBar: false,
              backgroundColor: PubgColors.primaryColor.withOpacity(.5),
              body: Stack(
                children: [
                  AnimatedPositionedDirectional(
                    curve: Curves.fastOutSlowIn,
                    duration: const Duration(milliseconds: 500),
                    start: drawerProvider.isDrawerOpened ? 0 : -288,
                    // child: PubgDrawer(
                    //   onItemSelected: () {
                    //     drawerProvider.controlDrawer(_animationController);
                    //   },
                    // ),
                    child: const Center(),
                  ),
                  Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateY(_animation.value -
                          (Directionality.of(context) == TextDirection.ltr
                                  ? 30
                                  : 85) *
                              _animation.value *
                              pi /
                              180),
                    child: Transform.translate(
                      offset: Offset(
                          (Directionality.of(context) == TextDirection.ltr
                                  ? 1
                                  : -1) *
                              _animation.value *
                              265,
                          0),
                      child: Transform.scale(
                        scale: _scaleAnimation.value,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(
                              Radius.circular(_animation.value * 25)),
                          child: Scaffold(
                            extendBody: false,
                            resizeToAvoidBottomInset: false,
                            extendBodyBehindAppBar: false,
                            backgroundColor: Colors.transparent,
                            body: Stack(
                              children: [
                                Center(
                                  child: drawerProvider.currentScreen,
                                ),
                                SafeArea(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0, vertical: 10),
                                    child: InkWell(
                                      onTap: () {
                                        drawerProvider.controlDrawer(
                                            _animationController);
                                      },
                                      child: SvgPicture.asset(
                                        width: 40,
                                        fit: BoxFit.fitWidth,
                                        color: PubgColors.whiteColor,
                                        AssetsManager.getVector("menu"),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
