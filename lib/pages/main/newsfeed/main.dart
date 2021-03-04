import 'package:flutter/material.dart';
import 'package:idove/pages/main/newsfeed/status.dart';

class MainNewsfeedPage extends StatefulWidget {
  @override
  _MainNewsfeedPageState createState() => _MainNewsfeedPageState();
}

class _MainNewsfeedPageState extends State<MainNewsfeedPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      child: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Status(),
          ],
        ),
      ),
    );
  }
}
