import 'package:flutter/material.dart';

class MainIdoversPage extends StatefulWidget {
  static String id = '/idovers';

  @override
  _MainIdoversPageState createState() => _MainIdoversPageState();
}

class _MainIdoversPageState extends State<MainIdoversPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('iDovers'),
      ),
      body: Center(),
    );
  }
}
