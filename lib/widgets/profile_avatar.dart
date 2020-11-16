import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';

class ProfileAvatar extends StatelessWidget {
  final String imageUrl;
  final bool isActive;
  final bool hasBorder;

  const ProfileAvatar({
    Key? key,
    required this.imageUrl,
    this.isActive = false,
    this.hasBorder = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 20.0,
          backgroundColor: Palette.facebookBlue,
          child: CircleAvatar(
            radius: hasBorder ? 17 : 20,
            backgroundColor: Colors.grey[200],
            backgroundImage: NetworkImage(
              imageUrl,
            ),
          ),
        ),
        isActive
            ? Positioned(
                bottom: 0.0,
                right: 0.0,
                child: Container(
                    height: 15,
                    width: 15,
                    decoration: BoxDecoration(
                        color: Palette.online,
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 2,
                          color: Colors.white,
                        ))),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
