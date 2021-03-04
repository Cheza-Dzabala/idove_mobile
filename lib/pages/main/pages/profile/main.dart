import 'package:flutter/material.dart';
import 'package:idove/pages/main/pages/profile/media/main.dart';
import 'package:idove/pages/main/profile/profileDisplay.dart';
import 'package:idove/services/network/profile_service.dart';
import 'package:idove/services/service_locator.dart';
import 'package:idove/utilities/Colors.dart';
import 'package:ionicons/ionicons.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

class ProfilePage extends StatefulWidget {
  static String id = '/profile';
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ProfileService _profileService = locator<ProfileService>();
  Map<String, dynamic> _profile;
  bool isInAsyncCall = false;
  bool hasError = false;
  String errorMessage = '';

  // _getProfile() async {
  //   setState(() {
  //     isInAsyncCall = true;
  //     hasError = false;
  //   });
  //   Map<String, dynamic> profile = await _profileService.getProfile();
  //   if (profile['status'] == 200) {
  //     ParseObject profileObject = profile['response'];
  //     setState(() {
  //       _profile = profileObject.toJson();
  //       isInAsyncCall = false;
  //     });
  //   } else {
  //     setState(() {
  //       isInAsyncCall = false;
  //       hasError = true;
  //       errorMessage = profile['message'];
  //     });
  //   }
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Ionicons.arrow_back_circle_outline,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Profile'),
      ),
      body: DefaultTabController(
        length: 3,
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Expanded(
                  flex: 5,
                  child: MediaCard(),
                ),
                Expanded(
                  flex: 8,
                  child: TabBarView(
                    children: [
                      Icon(Icons.directions_car),
                      Icon(Icons.directions_transit),
                      Icon(Icons.directions_bike),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/**
 *
 *
 *
  Container(
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
    ),
 */

// Widget _errorDisplay({String errorMessage, Function callback}) {
//   return Center(
//     child: Column(
//       children: [
//         Text(errorMessage),
//         SizedBox(height: 10),
//         RaisedButton(
//           onPressed: () => callback(),
//           textColor: Colors.white,
//           color: PRIMARY_COLOR,
//           child: Text('Try again'),
//         )
//       ],
//     ),
//   );
// }
//
// Widget _loadingDisplay() {
//   return Center(
//     child: CircularProgressIndicator(),
//   );
// }
