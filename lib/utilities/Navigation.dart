import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idove/pages/auth/login.dart';
import 'package:idove/pages/main/messages/main.dart';
import 'package:idove/pages/main/newsfeed/main.dart';
import 'package:idove/pages/main/pages/forums/main.dart';
import 'package:idove/pages/main/pages/groups/main.dart';
import 'package:idove/pages/main/pages/idovers/main.dart';
import 'package:idove/pages/main/profile/main.dart';
import 'package:idove/pages/main/settings/main.dart';
import 'package:idove/utilities/Colors.dart';
import 'package:idove/utilities/GesturedListTile.dart';
import 'package:idove/widgets/buttons.dart';
import 'package:idove/widgets/dialogs.dart';
import 'package:ionicons/ionicons.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

List<Widget> pageWidgets = <Widget>[
  MainNewsfeedPage(),
  MainProfilePage(),
  MainMessagesPage(),
  MainSettingsPage()
];

List<String> navMap = [
  MainGroupsPage.id,
  MainForumsPage.id,
  MainIdoversPage.id
];

List<Widget> navigationMenu(BuildContext context) {
  return [
    navigationListTile(
      context: context,
      route: MainGroupsPage.id,
      title: 'Groups',
      icon: Ionicons.people_outline,
    ),
    navigationListTile(
      context: context,
      route: MainForumsPage.id,
      title: 'Forums',
      icon: Ionicons.clipboard_outline,
    ),
    navigationListTile(
      context: context,
      route: MainIdoversPage.id,
      title: 'iDovers',
      icon: Ionicons.globe_outline,
    ),
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 50.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: wideButton(
            onPressed: () async {
              showDialog(
                context: context,
                builder: (context) => logoutDialog(context),
              );
            },
            buttonText: 'LOGOUT',
            color: ACCENT_COLOR),
      ),
    ),
  ];
}

Widget bottomNavigationBar({Function handleIndexChange, int selectedTab}) {
  return SalomonBottomBar(
    margin: EdgeInsets.only(left: 16, right: 16, bottom: 25),
    currentIndex: selectedTab,
    onTap: handleIndexChange,
    selectedItemColor: ACCENT_COLOR,
    unselectedItemColor: PRIMARY_COLOR,
    items: [
      bottomNavigationItem(icon: Ionicons.newspaper_outline, title: 'Newsfeed'),
      bottomNavigationItem(icon: Ionicons.person_outline, title: 'Profile'),
      bottomNavigationItem(
          icon: Ionicons.mail_unread_outline, title: 'Messages'),
      bottomNavigationItem(icon: Ionicons.settings_outline, title: 'Settings'),
    ],
  );
}
