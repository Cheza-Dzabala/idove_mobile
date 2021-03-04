import 'package:flutter/material.dart';
import 'package:idove/pages/auth/forgot_password.dart';
import 'package:idove/pages/auth/login.dart';
import 'package:idove/pages/auth/registration.dart';
import 'package:idove/pages/auth/reset_password.dart';
import 'package:idove/pages/main/layout.dart';
import 'package:idove/pages/main/pages/forums/main.dart';
import 'package:idove/pages/main/pages/groups/main.dart';
import 'package:idove/pages/main/pages/idovers/main.dart';
import 'package:idove/pages/main/search/main.dart';
import 'package:idove/services/service_locator.dart';
import 'package:idove/utilities/Colors.dart';
import 'package:idove/utilities/Constants.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUpServiceLocator();
  await Parse().initialize(APPLICATION_ID, SERVER_URL,
      debug: true, liveQueryUrl: LIVE_QUERY_URL, clientKey: CLIENT_KEY);
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
        LayoutPage.id: (context) => LayoutPage(),
        MainGroupsPage.id: (context) => MainGroupsPage(),
        MainForumsPage.id: (context) => MainForumsPage(),
        MainIdoversPage.id: (context) => MainIdoversPage(),
        MainSearchPage.id: (context) => MainSearchPage(),
      },
    );
  }
}
