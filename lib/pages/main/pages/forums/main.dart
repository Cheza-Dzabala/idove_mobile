import 'package:flutter/material.dart';

class MainForumsPage extends StatefulWidget {
  static String id = '/forums';

  @override
  _MainForumsPageState createState() => _MainForumsPageState();
}

class _MainForumsPageState extends State<MainForumsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forums'),
      ),
      body: Center(),
    );
  }
}
