import 'package:flutter/material.dart';
import 'package:idove/utilities/InputDecorations.dart';
import 'package:idove/widgets/buttons.dart';
import 'package:ionicons/ionicons.dart';

class Status extends StatefulWidget {
  @override
  _StatusState createState() => _StatusState();
}

class _StatusState extends State<Status> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          minLines: 5,
          maxLines: 5,
          decoration: formTextFieldDecoration(
              icon: Icon(
                Ionicons.chatbubble,
                size: 20.0,
              ),
              hint: 'Share your thoughts'),
        ),
        Row(
          children: [
            RaisedButton(
              onPressed: () {},
              child: Text(
                'Share',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        )
      ],
    );
  }
}
