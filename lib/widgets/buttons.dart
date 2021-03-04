import 'package:flutter/material.dart';
import 'package:idove/utilities/Colors.dart';
import 'package:idove/utilities/TextStyles.dart';
import 'package:ionicons/ionicons.dart';

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

Widget iconButton({@required Function onPressed, @required IconData icon}) {
  return Material(
    child: InkWell(
      splashColor: Colors.grey.shade500, // inkwell color
      child: SizedBox(
        width: 30.0,
        height: 70,
        child: Icon(
          icon,
          color: PRIMARY_COLOR,
        ),
      ),
      onTap: onPressed,
    ),
  );
}
