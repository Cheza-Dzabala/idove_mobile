import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:idove/pages/main/search/main.dart';
import 'package:idove/utilities/Colors.dart';
import 'package:idove/utilities/Navigation.dart';
import 'package:ionicons/ionicons.dart';

class LayoutPage extends StatefulWidget {
  static String id = '/home_page';
  @override
  _LayoutPageState createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  int _selectedTab = 0;
  List<Widget> _widgets = pageWidgets;

  void _handleIndexChange(int i) {
    setState(() {
      _selectedTab = i;
    });
  }

  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return BackdropScaffold(
      frontLayerBorderRadius: BorderRadius.only(
        topRight: Radius.elliptical(25.0, 25.0),
        topLeft: Radius.elliptical(25.0, 25.0),
      ),
      stickyFrontLayer: true,
      appBar: BackdropAppBar(
        title: Text('Welcome back, Cheza.'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, MainSearchPage.id);
              },
              child: Icon(Ionicons.search_outline),
            ),
          ),
        ],
      ),
      backLayer: BackdropNavigationBackLayer(
        items: navigationMenu(context),
        onTap: (int position) {
          Navigator.pushNamed(context, navMap[position]);
        },
      ),
      frontLayer: Container(
          height: deviceHeight,
          width: deviceWidth,
          child: Column(
            children: [
              Expanded(
                flex: 9,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: _widgets.elementAt(_selectedTab),
                ),
              ),
              Expanded(
                flex: 2,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: bottomNavigationBar(
                    handleIndexChange: _handleIndexChange,
                    selectedTab: _selectedTab,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
