import 'dart:math';

import 'package:clubhouse_ui/models/room.dart';
import 'package:clubhouse_ui/widgets/room_user_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


import '../data.dart';
import '../widgets/user_profile_image.dart';

class RoomScreen extends StatelessWidget {
  final Room room;

  const RoomScreen({
    super.key,
    required this.room,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 130,
        leading: TextButton.icon(
          onPressed: () => Navigator.of(context).pop(),
          style: TextButton.styleFrom(
            foregroundColor: Colors.black,
          ),
          icon: const Icon(CupertinoIcons.chevron_down),
          label: const Text('Hallway'),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              CupertinoIcons.doc,
              size: 28,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          GestureDetector(
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
      body: Container(
        padding: EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${room.club} 🏠'.toUpperCase(),
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.0,
                              )),
                      Icon(CupertinoIcons.ellipsis),
                    ],
                  ),
                  Text(room.name,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                          )),
                ],
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(6.0),
              sliver: SliverGrid.count(
                crossAxisCount: 3,
                mainAxisSpacing: 20.0,
                children: room.speakers
                    .map((e) => RoomUserProfile(
                          imageURl: e.imageURL,
                          name: e.firstName,
                          size: 66,
                          isNew: Random().nextBool(),
                          isMuted: Random().nextBool(),
                        ))
                    .toList(),
              ),
            ),
            SliverToBoxAdapter(
              child: Text('Followed by speakers',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontSize: 14,
                        color: Colors.grey[500],
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                      )),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(6.0),
              sliver: SliverGrid.count(
                crossAxisCount: 4,
                mainAxisSpacing: 15.0,
                childAspectRatio: .7,
                children: room.followedBySpeakers
                    .map((e) => RoomUserProfile(
                          imageURl: e.imageURL,
                          name: e.firstName,
                          size: 66,
                          isNew: Random().nextBool(),
                        ))
                    .toList(),
              ),
            ),
            SliverToBoxAdapter(
              child: Text('Others in the room',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontSize: 14,
                        color: Colors.grey[500],
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                      )),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(6.0),
              sliver: SliverGrid.count(
                crossAxisCount: 4,
                mainAxisSpacing: 15.0,
                childAspectRatio: .7,
                children: room.others
                    .map((e) => RoomUserProfile(
                          imageURl: e.imageURL,
                          name: e.firstName,
                          size: 66,
                          isNew: Random().nextBool(),
                        ))
                    .toList(),
              ),
            ),
            SliverPadding(padding: EdgeInsets.only(bottom:50 ),),
          ],

        ),
      ),
      bottomSheet:  Container(
        padding:const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 18,
         ),
        height: 90,
        margin: EdgeInsets.only(bottom: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            TextButton(
               onPressed: () => Navigator.of(context).pop(),
              child:  Text(
                '✌ Leave quietly',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(12),
                  backgroundColor: Colors.grey[300],
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  )),
            ),
            Row(
                children: [
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[300],

                      ),
                      padding:const  EdgeInsets.all(6),
                      child: Icon(
                        CupertinoIcons.add,
                        size: 30,
                      ),
                    ),
                  ),
                  SizedBox(width: 12,),
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[300],

                      ),
                      padding:const  EdgeInsets.all(6),
                      child: Icon(
                        CupertinoIcons.hand_raised,
                        size: 30,
                      ),
                    ),
                  )
                ]
            )
          ],
        ),
      ),
    );
  }
}
