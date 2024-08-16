import 'package:flutter/material.dart';
import 'dart:collection';

import 'package:shadat_pubg/providers/drawer/drawer_item.dart';
import 'package:shadat_pubg/views/screens/daily_prize/daily_prize_screen.dart';
import 'package:shadat_pubg/views/screens/home/home_screen.dart';
import 'package:shadat_pubg/views/screens/invite_friends/invite_friends_screen.dart';
import 'package:shadat_pubg/views/screens/profile/profile_screen.dart';
import 'package:shadat_pubg/views/screens/withdraw/withdraw_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerProvider extends ChangeNotifier {
  final List<DrawerItem> _drawerItems = [
    DrawerItem(
      screen: const HomeScreen(),
      label: "الرئيسية",
      icon: 'home',
    ),
    DrawerItem(
      screen: const ProfileScreen(),
      label: "الحساب",
      icon: 'person',
    ),
    DrawerItem(
      screen: const DailyPrizeScreen(),
      label: "الجائزة اليومية",
      icon: 'wallet',
    ),
    DrawerItem(
      screen: const WithdrawScreen(),
      label: "السحب",
      icon: 'wallet',
    ),
    DrawerItem(
      screen: const InviteFriendsScreen(),
      label: "دعوة الأصدقاء",
      icon: 'person_plus',
    ),
    DrawerItem(
      screen: const Center(),
      label: "الدعم",
      icon: 'call',
    ),
    DrawerItem(
      screen: const Center(),
      label: "مشاركة",
      icon: 'send',
    ),
  ];

  UnmodifiableListView get drawerItems => UnmodifiableListView(_drawerItems);

  UnmodifiableListView get browseDrawerItems =>
      UnmodifiableListView(_drawerItems.sublist(0, 4));

  UnmodifiableListView get moreDrawerItems =>
      UnmodifiableListView(_drawerItems.sublist(4, _drawerItems.length));

  UnmodifiableListView get screens =>
      UnmodifiableListView(_drawerItems.map((i) => i.screen).toList());
  UnmodifiableListView get labels =>
      UnmodifiableListView(_drawerItems.map((i) => i.label).toList());
  UnmodifiableListView get icons =>
      UnmodifiableListView(_drawerItems.map((i) => i.icon).toList());

  late int _currentIndex;
  int get currentIndex => _currentIndex;

  late Widget currentScreen;

  late DrawerStatus _drawerStatus;
  bool get isDrawerOpened => _drawerStatus == DrawerStatus.opened;

  DrawerProvider() {
    _currentIndex = 0;
    _drawerStatus = DrawerStatus.closed;
    currentScreen = screens[currentIndex];
  }

  void controlDrawer(AnimationController controller) {
    if (_drawerStatus == DrawerStatus.opened) {
      controller.reverse();
    } else {
      controller.forward();
    }
    _drawerStatus = _drawerStatus == DrawerStatus.closed
        ? DrawerStatus.opened
        : DrawerStatus.closed;
    ChangeNotifier();
  }

  void navigateTo(Widget screen, {int? index}) {
    currentScreen = screen;
    if (index != null) {
      _currentIndex = index;
    }
    notifyListeners();
  }
}

enum DrawerStatus { opened, closed }
