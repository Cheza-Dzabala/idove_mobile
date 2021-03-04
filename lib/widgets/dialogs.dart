import 'package:flutter/material.dart';
import 'package:idove/pages/auth/login.dart';
import 'package:idove/services/network/authentication_service.dart';
import 'package:idove/services/service_locator.dart';
import 'package:idove/services/storage/user_storage_service.dart';
import 'package:idove/utilities/Colors.dart';
import 'package:idove/utilities/TextStyles.dart';
import 'package:idove/widgets/dialog_abstract.dart';

UserStorageService _userStorageService = locator<UserStorageService>();
AuthenticationService _authenticationService = locator<AuthenticationService>();

Widget loginDialog(BuildContext context) {
  return iDoveAlertDialog(
    actions: [
      FlatButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text(
          'Okay',
          style: textAlertDialogActionButtonTextStyle,
        ),
      )
    ],
    content:
        'Please verify your credentials. If you cannot remember your password, reset it and try again.',
    title: 'Couldn\'t Log You In',
  );
}

Widget logoutDialog(BuildContext context) {
  return iDoveAlertDialog(
    actions: [
      FlatButton(
        onPressed: () async {
          Map<String, String> _logout = await _authenticationService.logout();
          if (_logout['status'] == 'success') {
            await _userStorageService.clearUserData();
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => LoginPage(),
              ),
              (route) => false,
            );
          } else {
            Navigator.pop(context);
          }
        },
        child: Text(
          'YES',
          style: textAlertDialogActionButtonTextStyle.copyWith(
              color: PRIMARY_COLOR),
        ),
      ),
      FlatButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text(
          'NO',
          style: textAlertDialogActionButtonTextStyle.copyWith(
              color: ACCENT_COLOR),
        ),
      ),
    ],
    content: 'Are you sure you want to quit the iDove app?',
    title: 'Logging You Out',
  );
}

Widget registrationDialog(BuildContext context, String content, String title,
    {bool isSuccess = false}) {
  return iDoveAlertDialog(actions: [
    FlatButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: Text(
        'Okay',
        style: textAlertDialogActionButtonTextStyle,
      ),
    )
  ], content: content, title: title, isSuccess: isSuccess);
}
