import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadat_pubg/providers/auth/auth_provider.dart';
import 'package:shadat_pubg/providers/drawer/drawer_item.dart';
import 'package:shadat_pubg/providers/drawer/drawer_provider.dart';
import 'package:shadat_pubg/views/config/assets_manager.dart';
import 'package:shadat_pubg/views/themes/colors.dart';
import 'package:shadat_pubg/views/widgets/pubg_drawer/pubg_drawer_tile.dart';

class PubgDrawer extends StatelessWidget {
  final VoidCallback onItemSelected;

  const PubgDrawer({
    super.key,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<DrawerProvider>(
      builder: (context, drawerProvider, child) {
        return Container(
          width: 288,
          color: Colors.transparent,
          child: SafeArea(
            child: Column(
              children: [
                Consumer<AuthenticationProvider>(
                    builder: (context, authenticationProvider, child) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.white24,
                      radius: 20,
                      foregroundImage: NetworkImage(
                        authenticationProvider.gamer!.picture,
                      ),
                      backgroundImage: AssetImage(
                        AssetsManager.getImage(
                          "person",
                        ),
                      ),
                    ),
                    title: Text(
                      authenticationProvider.gamer!.name,
                      style: const TextStyle(color: Colors.white),
                    ),
                    subtitle: const Text(
                      "PUBG Enthausiast",
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }),
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(24, 32, 0, 16),
                        child: Text(
                          "تصفح",
                          style: TextStyle(
                            color: PubgColors.whiteColor.withOpacity(.7),
                            fontSize: 17,
                          ),
                        ),
                      ),
                      ...List.generate(
                        drawerProvider.browseDrawerItems.length,
                        (index) {
                          DrawerItem drawerItem =
                              drawerProvider.browseDrawerItems[index];
                          return PubgDrawerTile(
                            drawerItem: drawerItem,
                            isSelected: drawerItem.screen.runtimeType ==
                                drawerProvider.currentScreen.runtimeType,
                            onItemSelected: () {
                              drawerProvider.navigateTo(drawerItem.screen);
                              Future.delayed(const Duration(milliseconds: 200))
                                  .then(
                                (v) {
                                  onItemSelected();
                                },
                              );
                            },
                          );
                        },
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(24, 64, 0, 16),
                        child: Text(
                          "أيضا",
                          style: TextStyle(
                            color: PubgColors.whiteColor.withOpacity(.7),
                            fontSize: 17,
                          ),
                        ),
                      ),
                      ...[],
                      ...List.generate(
                        drawerProvider.moreDrawerItems.length,
                        (index) {
                          DrawerItem drawerItem =
                              drawerProvider.moreDrawerItems[index];
                          return PubgDrawerTile(
                            drawerItem: drawerItem,
                            isSelected: drawerItem.screen.runtimeType ==
                                drawerProvider.currentScreen.runtimeType,
                            onItemSelected: () {
                              if (index == 0) {
                                drawerProvider.navigateTo(drawerItem.screen);
                              } else {
                                drawerProvider.navigateTo(
                                    drawerProvider.screens[0],
                                    index: 0);
                                if (index == 1) {
                                  drawerProvider.launchWhatsApp();
                                } else {
                                  drawerProvider.shareApp();
                                }
                              }

                              Future.delayed(const Duration(milliseconds: 200))
                                  .then((v) {
                                onItemSelected();
                              });
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
