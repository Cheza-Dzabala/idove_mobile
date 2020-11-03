import 'package:flutter/material.dart';
import 'package:idove/pages/auth/forgot_password.dart';
import 'package:idove/pages/auth/login.dart';
import 'package:idove/pages/auth/registration.dart';
import 'package:idove/pages/auth/reset_password.dart';
import 'package:idove/pages/main/home.dart';
import 'package:idove/utilities/Colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iDove Mobile',
      theme: ThemeData(
        primaryColor: PRIMARY_COLOR,
        accentColor: Color(0xFF9F2241),
        buttonColor: Color(0xFF1A5632),
        dividerColor: Color(0xFFB4A269),
        errorColor: Color(0xFF9F2241),
        backgroundColor: BACKGROUND_COLOR,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Inter',
      ),
      initialRoute: LoginPage.id,
      routes: {
        LoginPage.id: (context) => LoginPage(),
        RegistrationPage.id: (context) => RegistrationPage(),
        ForgotPasswordPage.id: (context) => ForgotPasswordPage(),
        ResetPasswordPage.id: (context) => ResetPasswordPage(),
        HomePage.id: (context) => HomePage(),
      },
    );
  }
}
