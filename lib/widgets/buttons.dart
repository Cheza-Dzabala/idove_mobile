import 'package:flutter/material.dart';
import 'package:idove/utilities/Colors.dart';
import 'package:idove/utilities/TextStyles.dart';

Widget wideButton(
    {@required Function onPressed,
    @required String buttonText,
    Color color = PRIMARY_COLOR}) {
  return SizedBox(
    width: double.infinity * 0.80,
    child: RaisedButton(
      color: color,
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(17.0),
        child: Text(
          buttonText,
          style: buttonTextStyle,
        ),
      ),
    ),
  );
}
