import 'package:flutter/material.dart';
import 'package:idove/pages/auth/reset_password.dart';
import 'package:idove/painters/TopAuthPainer.dart';
import 'package:idove/utilities/Colors.dart';
import 'package:idove/utilities/InputDecorations.dart';
import 'package:idove/utilities/TextStyles.dart';
import 'package:idove/widgets/buttons.dart';
import 'package:ionicons/ionicons.dart';

class ForgotPasswordPage extends StatefulWidget {
  static String id = '/forgot_password';
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        iconTheme: IconThemeData(color: PRIMARY_COLOR),
        backgroundColor: BACKGROUND_COLOR,
        title: Text(
          'Recover Password',
          style: h1TextStyle,
        ),
      ),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Container(
          color: BACKGROUND_COLOR,
          height: deviceHeight * 0.88,
          width: deviceWidth,
          child: CustomPaint(
            painter: TopAuthPainter(),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 80.0),
                  child: Image(
                    width: 150,
                    image: AssetImage('assets/images/auLogo.png'),
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        Text(
                            'Please enter your email address. Once you request a reset, you will be emailed a link that will allow you to reset your password.'),
                        Padding(
                          padding: EdgeInsets.only(top: 20.0),
                        ),
                        TextFormField(
                          decoration: formTextFieldDecoration(
                              icon: Icon(
                                Ionicons.mail_outline,
                                size: 20.0,
                              ),
                              hint: 'Email Address'),
                          obscureText: false,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter your email address';
                            }
                            return null;
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.0),
                        ),
                        wideButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, ResetPasswordPage.id);
                            },
                            buttonText: 'START RESET')
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
