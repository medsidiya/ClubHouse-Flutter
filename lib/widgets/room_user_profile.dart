import 'package:clubhouse_ui/widgets/user_profile_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data.dart';

class RoomUserProfile extends StatelessWidget {
  final String imageURl;
  final String name;
  final double size;
  final bool isNew;
  final bool isMuted;

  const RoomUserProfile({
    super.key,
    required this.imageURl,
    required this.name,
    this.size = 42,
    this.isNew = false,
    this.isMuted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: UserProfileImage(
                imageURL: imageURl,
                size: size,
              ),
            ),
            if (isNew)
              Positioned(
                left: 0,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 2),
                          blurRadius: 4,
                        ),
                      ]),
                  child: const Text(
                    '🎉',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            if (isMuted)
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 2),
                          blurRadius: 4,
                        ),
                      ]),
                  child: Icon(
                    CupertinoIcons.mic_fill,
                  ),
                ),
              )
          ],
        ),
        Flexible(
          child: Text(
            name,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
