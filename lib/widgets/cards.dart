import 'package:flutter/material.dart';

Container IdoveCard(
    {double width,
    Widget child,
    EdgeInsets margin,
    double verticalPadding = 20.0,
    double horizontalPadding = 20.0}) {
  return Container(
    width: width,
    margin: margin,
    child: Card(
      elevation: 10.0,
      shadowColor: Color(0XFFE5E5E5).withOpacity(0.2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: verticalPadding, horizontal: horizontalPadding),
          child: child),
    ),
  );
}
