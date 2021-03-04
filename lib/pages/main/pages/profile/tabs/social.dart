import 'package:flutter/material.dart';
import 'package:idove/services/network/profile_service.dart';
import 'package:idove/utilities/InputDecorations.dart';
import 'package:ionicons/ionicons.dart';

class Social extends StatefulWidget {
  final profile;
  final ProfileService profileService;
  const Social({Key key, this.profile, this.profileService}) : super(key: key);
  @override
  _SocialState createState() => _SocialState();
}

class _SocialState extends State<Social> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          initialValue: widget.profile['facebook'],
          decoration: formTextFieldDecoration(
              icon: Icon(
                Ionicons.logo_facebook,
                size: 20.0,
              ),
              hint: 'Facebook Url'),
          onChanged: (text) {
            widget.profileService.setFacebook(text);
          },
        ),
      ],
    );
  }
}
