import 'package:flutter/material.dart';
import 'package:idove/painters/TopAuthPainer.dart';
import 'package:idove/utilities/Colors.dart';
import 'package:idove/utilities/InputDecorations.dart';
import 'package:idove/utilities/TextStyles.dart';
import 'package:idove/widgets/buttons.dart';

class ResetPasswordPage extends StatefulWidget {
  static String id = 'reset_password';

  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
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
          'Reset Password',
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
                            'Please enter a new password. Try not to lose it this tine :)'),
                        Padding(
                          padding: EdgeInsets.only(top: 20.0),
                        ),
                        TextFormField(
                          decoration: formTextFieldDecoration(
                              icon: Icon(
                                Icons.mail,
                                size: 20.0,
                              ),
                              hint: 'Password'),
                          obscureText: true,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter a new password';
                            }
                            return null;
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.0),
                        ),
                        TextFormField(
                          decoration: formTextFieldDecoration(
                              icon: Icon(
                                Icons.mail,
                                size: 20.0,
                              ),
                              hint: 'Confirm Password'),
                          obscureText: true,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please confirm your new password';
                            }
                            return null;
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.0),
                        ),
                        wideButton(
                            onPressed: () {}, buttonText: 'RESET PASSWORD')
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
