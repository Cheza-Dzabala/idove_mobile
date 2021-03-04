import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:idove/services/network/profile_service.dart';
import 'package:idove/utilities/Colors.dart';
import 'package:idove/utilities/InputDecorations.dart';
import 'package:idove/widgets/buttons.dart';
import 'package:ionicons/ionicons.dart';
import 'package:country_picker/country_picker.dart';

class ProfileDisplay extends StatefulWidget {
  final profile;
  final ProfileService profileService;
  const ProfileDisplay({
    Key key,
    this.profile,
    this.profileService,
  }) : super(key: key);

  @override
  _ProfileDisplayState createState() => _ProfileDisplayState();
}

class _ProfileDisplayState extends State<ProfileDisplay> {
  double spaceHeight = 15.0;
  DateTime selectedDate = DateTime.now();
  String gender = '';

  void _pickAvatar() async {
    FilePickerResult result = await FilePicker.platform.pickFiles();
    if (result != null) {
      File file = File(result.files.single.path);
    } else {
      // User canceled the picker
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1950, 1),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      print(picked.toString().split(' ')[0]);
      widget.profileService.setDateOfBirth("${picked.toLocal()}".split(' ')[0]);
    }
  }

  void country(BuildContext context, method) {
    return showCountryPicker(
      context: context,
      showPhoneCode:
          true, // optional. Shows phone code before the country name.
      onSelect: (Country country) {
        widget.profileService.setCountry(country.name, method);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Profile information is auto saved as you type and change values. Remove everything by clearing a field.',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade600,
            ),
          ),
          SizedBox(height: spaceHeight + 10.0),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: DropdownButton<String>(
              isExpanded: true,
              value: widget.profile['gender'] == ''
                  ? 'Select Gender'
                  : widget.profile['gender'],
              icon: Icon(Ionicons.chevron_down),
              iconSize: 20,
              elevation: 16,
              underline: SizedBox(),
              hint: Text('Select  Gender'),
              onChanged: (newValue) {
                widget.profileService.setGender(newValue);
                setState(() {
                  gender = newValue;
                });
              },
              items: <String>['Select Gender', 'Male', 'Female', 'NB']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          SizedBox(height: spaceHeight),
          GestureDetector(
            onTap: () => _selectDate(context),
            child: Container(
              padding: EdgeInsets.all(10.0),
              height: 60.0,
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              child: Row(
                children: [
                  Text(
                    '${widget.profile['date_of_birth'] == '' ? 'Date Of Birth' : widget.profile['date_of_birth']}',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: spaceHeight),
          GestureDetector(
            onTap: () => country(context, 'nationality'),
            child: Container(
              padding: EdgeInsets.all(10.0),
              height: 60.0,
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              child: Row(
                children: [
                  Text(
                    '${widget.profile['nationality'] == '' ? 'Nationality' : widget.profile['nationality']}',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: spaceHeight),
          GestureDetector(
            onTap: () => country(context, 'country_of_residence'),
            child: Container(
              padding: EdgeInsets.all(10.0),
              height: 60.0,
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              child: Row(
                children: [
                  Text(
                    '${widget.profile['country_of_residence'] == '' ? 'Country of Residence' : widget.profile['country_of_residence']}',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: spaceHeight),
          TextFormField(
            initialValue: widget.profile['city_of_residence'],
            decoration: formTextFieldDecoration(
              icon: Icon(
                Ionicons.location_outline,
                size: 20.0,
              ),
              hint: 'City Of Residence',
            ),
            onChanged: (text) {
              widget.profileService.setCity(text);
            },
          ),
          SizedBox(height: spaceHeight),
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
          SizedBox(height: spaceHeight),
          TextFormField(
            initialValue: widget.profile['twitter'],
            decoration: formTextFieldDecoration(
                icon: Icon(
                  Ionicons.logo_twitter,
                  size: 20.0,
                ),
                hint: 'Twitter Url'),
            onChanged: (text) {
              widget.profileService.setTwitter(text);
            },
          ),
          SizedBox(height: spaceHeight),
          TextFormField(
            initialValue: widget.profile['linkedIn'],
            decoration: formTextFieldDecoration(
                icon: Icon(
                  Ionicons.logo_linkedin,
                  size: 20.0,
                ),
                hint: 'LinkedIn Url'),
            onChanged: (text) {
              widget.profileService.setLinkedIn(text);
            },
          ),
          SizedBox(height: spaceHeight),
          TextFormField(
            initialValue: widget.profile['website'],
            decoration: formTextFieldDecoration(
                icon: Icon(
                  Ionicons.earth_outline,
                  size: 20.0,
                ),
                hint: 'Website Url'),
            onChanged: (text) {
              widget.profileService.setWebsite(text);
            },
          ),
          SizedBox(height: spaceHeight),
          TextFormField(
            initialValue: widget.profile['pve_work'],
            minLines: 5,
            maxLines: 10,
            decoration: formTextFieldDecoration(
                icon: Icon(
                  Ionicons.hammer_outline,
                  size: 20.0,
                ),
                hint: 'P.V.E work'),
            onChanged: (text) {
              widget.profileService.setPVEWork(text);
            },
          ),
          SizedBox(height: spaceHeight),
          TextFormField(
            initialValue: widget.profile['summary'],
            minLines: 5,
            maxLines: 10,
            decoration: formTextFieldDecoration(
                icon: Icon(
                  Ionicons.clipboard_outline,
                  size: 20.0,
                ),
                hint: 'Summary'),
            onChanged: (text) {
              widget.profileService.setSummary(text);
            },
          ),
          SizedBox(height: spaceHeight),
          TextFormField(
            initialValue: widget.profile['fun_facts'],
            minLines: 5,
            maxLines: 10,
            decoration: formTextFieldDecoration(
                icon: Icon(
                  Ionicons.happy_outline,
                  size: 20.0,
                ),
                hint: 'Fun Facts'),
            onChanged: (text) {
              widget.profileService.setFunFacts(text);
            },
          ),
          SizedBox(height: spaceHeight),
          SizedBox(height: spaceHeight),
        ],
      ),
    );
  }
}

/**

    Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
    ClipOval(
    child: Material(
    color: Colors.grey.shade300, // button color
    child: InkWell(
    splashColor: Colors.grey.shade500, // inkwell color
    child: SizedBox(
    width: 55,
    height: 55,
    child: Icon(
    Ionicons.person_outline,
    color: Colors.white,
    ),
    ),
    onTap: () {
    _pickAvatar();
    },
    ),
    ),
    ),
    ClipRect(
    child: Material(
    color: Colors.grey.shade300, // button color
    child: InkWell(
    splashColor: Colors.grey.shade500, // inkwell color
    child: SizedBox(
    width: MediaQuery.of(context).size.width / 2,
    height: 70,
    child: Icon(
    Ionicons.image_outline,
    color: Colors.white,
    ),
    ),
    onTap: () {},
    ),
    ),
    ),
    ],
    ),
    SizedBox(height: spaceHeight),
*/
