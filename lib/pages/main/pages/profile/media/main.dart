import 'package:flutter/material.dart';
import 'package:idove/widgets/cards.dart';
import 'package:idove/widgets/tab_bar.dart';

class MediaCard extends StatefulWidget {
  @override
  _MediaCardState createState() => _MediaCardState();
}

class _MediaCardState extends State<MediaCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Image.network(
                  'https://images.pexels.com/photos/132037/pexels-photo-132037.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                  height: 150.0,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  padding: EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0, 0), // changes position of shadow
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    radius: 30.0,
                    backgroundImage: NetworkImage(
                      'https://pbs.twimg.com/profile_images/1091674301777018880/t0zqSzOw.jpg',
                      scale: 2.0,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Tabs(
          tabs: ['SOCIAL', 'INFO', 'OTHER'],
        )
      ]),
    );
  }
}
