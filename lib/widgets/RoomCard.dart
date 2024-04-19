import 'package:clubhouse_ui/models/room.dart';
import 'package:clubhouse_ui/screens/room_screen.dart';
import 'package:clubhouse_ui/widgets/user_profile_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoomCard extends StatelessWidget {
  final Room room;

  const RoomCard({
    super.key,
    required this.room,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() => Navigator.of(context).push(MaterialPageRoute(
        fullscreenDialog: true,
        builder: (_) => RoomScreen(room: room),
      )),
      child: Padding(
        padding: const EdgeInsets.only(top: 6.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${room.club} 🏠'.toUpperCase(),
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                      ),
                ),
                Text(
                  room.name,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 100,
                        child: Stack(
                          children: [
                            UserProfileImage(
                              imageURL: room.speakers[1].imageURL,
                              size: 48.0,
                            ),
                            Positioned(
                              left: 28.0,
                              top: 24.0,
                              child: UserProfileImage(
                                imageURL: room.speakers[0].imageURL,
                                size: 48.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ...room.speakers.map((e) => Text(
                                  '${e.firstName} ${e.lastName} 🗨',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(fontSize: 16.0),
                                )),
                            const SizedBox(
                              height: 8,
                            ),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                      text:
                                          '${room.speakers.length + room.followedBySpeakers.length + room.others.length}'),
                                  const WidgetSpan(
                                    child: Icon(
                                      CupertinoIcons.person_fill,
                                      size: 18.0,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '  / ${room.speakers.length}',
                                  ),
                                  const WidgetSpan(
                                    child: Icon(
                                      CupertinoIcons.chat_bubble_fill,
                                      size: 18.0,
                                      color: Colors.grey,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
