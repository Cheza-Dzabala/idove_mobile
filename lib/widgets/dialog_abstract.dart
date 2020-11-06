import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idove/utilities/Colors.dart';
import 'package:idove/utilities/TextStyles.dart';

Widget iDoveAlertDialog(
    {@required List<Widget> actions,
    @required String content,
    @required String title,
    bool isSuccess = false}) {
  return AlertDialog(
    contentPadding: EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 0),
    title: Align(
      alignment: Alignment.center,
      child: Text(
        title,
        style: isSuccess
            ? textAlertDialogTitleStyle.copyWith(color: PRIMARY_COLOR)
            : textAlertDialogTitleStyle,
      ),
    ),
    content: Container(
      child: Text(
        content,
        style: textAlertDialogContentStyle,
      ),
    ),
    actions: actions,
  );
}
