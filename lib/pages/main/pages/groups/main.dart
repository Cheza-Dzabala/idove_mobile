import 'package:flutter/material.dart';

class MainGroupsPage extends StatefulWidget {
  static String id = '/groups';
  @override
  _MainGroupsPageState createState() => _MainGroupsPageState();
}

class _MainGroupsPageState extends State<MainGroupsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Groups'),
      ),
      body: Center(),
    );
  }
}
