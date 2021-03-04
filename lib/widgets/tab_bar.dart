import 'package:flutter/material.dart';
import 'package:idove/utilities/Colors.dart';

class Tabs extends StatefulWidget {
  final List<String> tabs;

  const Tabs({Key key, this.tabs}) : super(key: key);
  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: TabBar(
        labelColor: Colors.white,
        unselectedLabelColor: Colors.black,
        labelStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 12.0),
        labelPadding: EdgeInsets.all(5.0),
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: PRIMARY_COLOR,
        ),
        tabs: widget.tabs.map((tab) => Text(tab)).toList(),
      ),
    );
  }
}
