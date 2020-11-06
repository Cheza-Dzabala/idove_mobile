import 'package:flutter/material.dart';
import 'package:idove/painters/TopAuthPainer.dart';
import 'package:idove/services/network/authentication_service.dart';
import 'package:idove/services/service_locator.dart';
import 'package:idove/utilities/InputDecorations.dart';
import 'package:idove/utilities/Colors.dart';
import 'package:idove/utilities/TextStyles.dart';
import 'package:idove/widgets/buttons.dart';
import 'package:idove/widgets/dialogs.dart';
import 'package:ionicons/ionicons.dart';
import 'package:idove/extentions/InputValidators.dart';

class RegistrationPage extends StatefulWidget {
  static String id = '/registration';
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();

  String email;
  String firstName;
  String lastName;
  String userName;
  String password;
  String passwordConfirmation;
  bool isInAsyncCall = false;

  AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  void switchAsyncStatus() {
    setState(() {
      isInAsyncCall = !isInAsyncCall;
    });
  }

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
          height: deviceHeight * 0.879,
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
                                  Ionicons.mail_outline,
                                  size: 20.0,
                                ),
                                hint: 'Email Address'),
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (value) {
                              setState(() {
                                email = value;
                              });
                            },
                            validator: (value) {
                              if (!value.isEmail()) {
                                return 'Please enter a valid email address';
                              }
                              if (value.isEmpty) {
                                return 'Please enter your email address';
                              }
                              return null;
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5.0),
                          ),
                          TextFormField(
                            onChanged: (value) {
                              setState(() {
                                firstName = value;
                              });
                            },
                            decoration: formTextFieldDecoration(
                                icon: Icon(
                                  Ionicons.folder_outline,
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
                            padding: EdgeInsets.symmetric(vertical: 5.0),
                          ),
                          TextFormField(
                            onChanged: (value) {
                              setState(() {
                                lastName = value;
                              });
                            },
                            decoration: formTextFieldDecoration(
                                icon: Icon(
                                  Ionicons.folder_outline,
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
                            padding: EdgeInsets.symmetric(vertical: 5.0),
                          ),
                          TextFormField(
                            onChanged: (value) {
                              setState(() {
                                userName = value;
                              });
                            },
                            decoration: formTextFieldDecoration(
                                icon: Icon(
                                  Ionicons.shield_checkmark_outline,
                                  size: 20.0,
                                ),
                                hint: 'Username (Something easy to remember)'),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter a username';
                              }
                              return null;
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5.0),
                          ),
                          TextFormField(
                            onChanged: (value) {
                              setState(() {
                                password = value;
                              });
                            },
                            obscureText: true,
                            decoration: formTextFieldDecoration(
                                icon: Icon(
                                  Ionicons.lock_closed_outline,
                                  size: 20.0,
                                ),
                                hint: 'Password'),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please provide a password';
                              }
                              if (value != passwordConfirmation) {
                                return 'Your password and password confirmation don\'t match';
                              }
                              return null;
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5.0),
                          ),
                          TextFormField(
                            onChanged: (value) {
                              setState(() {
                                passwordConfirmation = value;
                              });
                            },
                            obscureText: true,
                            decoration: formTextFieldDecoration(
                                icon: Icon(
                                  Ionicons.lock_closed_outline,
                                  size: 20.0,
                                ),
                                hint: 'Confirm Password'),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please confirm your password';
                              }
                              if (value != password) {
                                return 'Your password and password confirmation don\'t match';
                              }
                              return null;
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 5.0),
                          ),
                          wideButton(
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                // TODO:: Implement Registration API
                                if (!isInAsyncCall) {
                                  switchAsyncStatus();
                                  Map<String, String> response =
                                      await _authenticationService.register(
                                    firstName: firstName,
                                    lastName: lastName,
                                    email: email,
                                    userName: userName,
                                    password: password,
                                    passwordConfirmation: passwordConfirmation,
                                  );
                                  switchAsyncStatus();
                                  if (int.parse(response['statusCode']) !=
                                      201) {
                                    showDialog(
                                        context: context,
                                        builder: (context) =>
                                            registrationDialog(
                                              context,
                                              response['error'],
                                              'We couldn\'t get you set up!',
                                            ));
                                  } else {
                                    showDialog(
                                      context: context,
                                      builder: (context) => registrationDialog(
                                        context,
                                        response['message'],
                                        'All Set Up',
                                        isSuccess: true,
                                      ),
                                    );
                                  }
                                } else {
                                  return;
                                }
                              }
                            },
                            buttonText:
                                isInAsyncCall ? 'REGISTERING...' : 'REGISTER',
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
