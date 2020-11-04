import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:idove/pages/auth/forgot_password.dart';
import 'package:idove/pages/main/layout.dart';
import 'package:idove/utilities/InputDecorations.dart';
import 'package:idove/pages/auth/registration.dart';
import 'package:idove/painters/TopAuthPainer.dart';
import 'package:idove/utilities/Colors.dart';
import 'package:idove/utilities/TextStyles.dart';
import 'package:idove/widgets/buttons.dart';
import 'package:ionicons/ionicons.dart';

class LoginPage extends StatefulWidget {
  static String id = '/';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
//      appBar: AppBar(
//        backgroundColor: BACKGROUND_COLOR,
//        elevation: 0.0,
//      ),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Container(
          width: deviceWidth,
          height: deviceHeight,
          child: CustomPaint(
            painter: TopAuthPainter(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 80.0),
                        child: Image(
                          width: 150,
                          image: AssetImage('assets/images/auLogo.png'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: BorderedText(
                          strokeWidth: 2.0,
                          strokeColor: Colors.white,
                          child: Text(
                            'Welcome to iDove Mobile',
                            style: h1TextStyle,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Text(
                          'SIGN IN TO CONTINUE',
                          style: textMutedStyle,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 80.0),
                    child:
                        loginBox(context, deviceHeight, deviceWidth, _formKey),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget loginBox(
    BuildContext context, double height, double width, GlobalKey formKey) {
  return Form(
    key: formKey,
    child: Column(
      children: [
        TextFormField(
          decoration: formTextFieldDecoration(
              icon: Icon(
                Ionicons.mail_outline,
                size: 20.0,
              ),
              hint: 'Email Address'),
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0),
        ),
        TextFormField(
          decoration: formTextFieldDecoration(
              icon: Icon(
                Ionicons.lock_closed_outline,
                size: 20.0,
              ),
              hint: 'Password'),
          obscureText: true,
          validator: (value) {
            if (value.isEmpty) {
              return 'Please enter a password';
            }
            return null;
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, ForgotPasswordPage.id);
              },
              child: Text(
                'Forgot Password?',
                style: textLinkStyle,
              ),
            ),
          ),
        ),
        wideButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, LayoutPage.id);
            },
            buttonText: 'LOGIN'),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Don\'t have an account? '),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RegistrationPage.id);
                },
                child: Text(
                  'Create a new account',
                  style: textLinkStyle,
                ),
              ),
            ],
          ),
        ),
        Text(
          'ABOUT THE APP',
          style: textLinkStyle.copyWith(fontWeight: FontWeight.w700),
        ),
      ],
    ),
  );
}
