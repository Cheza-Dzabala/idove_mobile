import 'package:flutter/material.dart';
import 'package:idove/utilities/Colors.dart';
import 'package:idove/utilities/TextStyles.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

Widget navigationListTile({
  @required BuildContext context,
  @required String route,
  @required String title,
  @required IconData icon,
}) {
  return ListTile(
    leading: Icon(
      icon,
      color: BACKGROUND_COLOR,
    ),
    title: Text(
      title,
      style: textNavigationTextStyle,
    ),
  );
}

SalomonBottomBarItem bottomNavigationItem({
  @required IconData icon,
  @required String title,
}) {
  return SalomonBottomBarItem(
    icon: Icon(icon),
    title: Text(
      title,
      style: textBottomNavigationBar,
    ),
  );
}
