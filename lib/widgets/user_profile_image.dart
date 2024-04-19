import 'package:flutter/cupertino.dart';

import '../data.dart';

class UserProfileImage extends StatelessWidget {
  final double size;
  final String imageURL;

  const UserProfileImage({
    required this.imageURL,
    required this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(size/2 - size/10),
      child: Image.network(
        imageURL,
        width: size,
        height: size,
        fit: BoxFit.cover,
      ),
    );
  }
}
