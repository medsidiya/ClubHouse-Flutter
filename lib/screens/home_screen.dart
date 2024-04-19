import 'dart:ui';

import 'package:clubhouse_ui/constants.dart';
import 'package:clubhouse_ui/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
// import 'package:flutter/widgets.dart';

import '../widgets/RoomCard.dart';
import '../widgets/user_profile_image.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.search,
            size: 28,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(
              CupertinoIcons.envelope_open,
              size: 25,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              CupertinoIcons.calendar,
              size: 28,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              CupertinoIcons.bell,
              size: 28,
            ),
            onPressed: () {},
          ),
          GestureDetector(
            onTap: () {
              print('hello that me');
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: UserProfileImage(
                imageURL: currentUser.imageURL,
                size: 34,
              ),
            ),
          )
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          ListView(
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 100),
            children: [...roomList.map((e) => RoomCard(room: e))],
          ),
          Positioned(
            right: 0,
            left: 0,
            bottom: 0,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Theme.of(context).scaffoldBackgroundColor.withOpacity(0.1),
                    Theme.of(context).scaffoldBackgroundColor,
                  ],
                ),
              ),
            ),
          ),
           Positioned(
             bottom: 50,
             child: ElevatedButton.icon(onPressed: () {},
                icon: const Icon(
                  CupertinoIcons.add,
                  size: 21,
                  color: Colors.white,
                ),
                 label:const Text(
                   'Start a room',
                   style: TextStyle(
                     color: Colors.white,
                     fontSize: 20,
                     fontWeight: FontWeight.w500,
                   )
                 ),
                 style: ElevatedButton.styleFrom(
                   padding:const EdgeInsets.all(12),
                      backgroundColor: Colors.green,
                   shape: const RoundedRectangleBorder(
                     borderRadius: BorderRadius.all(Radius.circular(20))
                   ),
                 ),
             ),
           ),
        ],
      ),
    );
  }
}
