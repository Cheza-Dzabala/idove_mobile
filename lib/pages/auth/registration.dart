import 'package:flutter/material.dart';
import 'package:idove/painters/TopAuthPainer.dart';
import 'package:idove/utilities/InputDecorations.dart';
import 'package:idove/utilities/Colors.dart';
import 'package:idove/utilities/TextStyles.dart';
import 'package:idove/widgets/buttons.dart';

class RegistrationPage extends StatefulWidget {
  static String id = '/registration';
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      appBar: AppBar(
        elevation: 0.0,
        iconTheme: IconThemeData(color: PRIMARY_COLOR),
        backgroundColor: BACKGROUND_COLOR,
        title: Text(
          'Create An Account',
          style: h1TextStyle,
        ),
      ),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      'REGISTER TO CONTINUE',
                      style: textMutedStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: formTextFieldDecoration(
                                icon: Icon(
                                  Icons.mail,
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
                                  Icons.person,
                                  size: 20.0,
                                ),
                                hint: 'First Name'),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter your first name';
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
                                  Icons.person,
                                  size: 20.0,
                                ),
                                hint: 'Last Name'),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter your last name';
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
                                  Icons.verified_user,
                                  size: 20.0,
                                ),
                                hint: 'Username (Something unique)'),
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
                                  Icons.lock,
                                  size: 20.0,
                                ),
                                hint: 'Password'),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please provide a password';
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
                                  Icons.lock,
                                  size: 20.0,
                                ),
                                hint: 'Confirm Password'),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please confirm your password';
                              }
                              return null;
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 15.0),
                          ),
                          wideButton(
                            onPressed: () {
                              print('register');
                            },
                            buttonText: 'REGISTER',
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.0),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'By Signing up you agree to our ',
                              ),
                              Text(
                                'TERMS & CONDITIONS.',
                                style: textLinkStyle.copyWith(
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
