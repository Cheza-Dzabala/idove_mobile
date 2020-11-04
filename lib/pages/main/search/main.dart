import 'dart:math';
import 'package:appbar_textfield/appbar_textfield.dart';
import 'package:flutter/material.dart';
import 'package:idove/utilities/Colors.dart';
import 'package:idove/utilities/TextStyles.dart';
import 'package:ionicons/ionicons.dart';

class MainSearchPage extends StatefulWidget {
  static String id = '/search_page';
  @override
  _MainSearchPageState createState() => _MainSearchPageState();
}

class _MainSearchPageState extends State<MainSearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      appBar: AppBarTextField(
        backgroundColor: BACKGROUND_COLOR,
        autofocus: false,
        textAlignVertical: TextAlignVertical.top,
        elevation: 0.0,
        searchContainerColor: PRIMARY_COLOR,
        iconTheme: IconThemeData(color: PRIMARY_COLOR),
        searchButtonIcon: Icon(Ionicons.search_outline),
        defaultHintText: 'What are we looking for today?',
        style: TextStyle(
            letterSpacing: 2.0, fontWeight: FontWeight.w400, color: WHITE),
        backBtnIcon: Icon(Ionicons.chevron_back),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                'Recent Searches',
                style: h1TextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
