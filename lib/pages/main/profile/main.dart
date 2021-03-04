import 'dart:io';

import 'package:flutter/material.dart';
import 'package:idove/pages/main/profile/profileDisplay.dart';
import 'package:idove/services/network/profile_service.dart';
import 'package:idove/services/service_locator.dart';
import 'package:idove/utilities/Colors.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class MainProfilePage extends StatefulWidget {
  @override
  _MainProfilePageState createState() => _MainProfilePageState();
}

class _MainProfilePageState extends State<MainProfilePage> {
  ProfileService _profileService = locator<ProfileService>();
  Map<String, dynamic> _profile;
  bool isInAsyncCall = false;
  bool hasError = false;
  String errorMessage = '';

  _getProfile() async {
    setState(() {
      isInAsyncCall = true;
      hasError = false;
    });
    Map<String, dynamic> profile = await _profileService.getProfile();
    if (profile['status'] == 200) {
      ParseObject profileObject = profile['response'];
      setState(() {
        _profile = profileObject.toJson();
        isInAsyncCall = false;
      });
    } else {
      setState(() {
        isInAsyncCall = false;
        hasError = true;
        errorMessage = profile['message'];
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      child: isInAsyncCall
          ? _loadingDisplay()
          : hasError
              ? _errorDisplay(
                  errorMessage: errorMessage,
                  callback: _getProfile(),
                )
              : ProfileDisplay(
                  profile: _profile,
                  profileService: _profileService,
                ),
    );
  }
}

Widget _errorDisplay({String errorMessage, Function callback}) {
  return Center(
    child: Column(
      children: [
        Text(errorMessage),
        SizedBox(height: 10),
        RaisedButton(
          onPressed: () => callback(),
          textColor: Colors.white,
          color: PRIMARY_COLOR,
          child: Text('Try again'),
        )
      ],
    ),
  );
}

Widget _loadingDisplay() {
  return Center(
    child: CircularProgressIndicator(),
  );
}
