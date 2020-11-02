import 'package:flutter/material.dart';
import 'package:idove/utilities/ColorSwatch.dart';

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
        primaryColor: Color(0xFF1A5632),
        accentColor: Color(0xFF9F2241),
        buttonColor: Color(0xFF9F2241),
        dividerColor: Color(0xFFB4A269),
        errorColor: Color(0xFF9F2241),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Inter',
      ),
      home: MyHomePage(title: 'Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
        ),
      ),
      body: Center(),
    );
  }
}
