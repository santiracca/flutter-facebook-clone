import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/models/user_model.dart';
import 'package:flutter_facebook_responsive_ui/widgets/widgets.dart';

class Rooms extends StatelessWidget {
  final List<User> onlineUsers;

  const Rooms({Key? key, required this.onlineUsers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      color: Colors.white,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        scrollDirection: Axis.horizontal,
        itemCount: 1 + onlineUsers.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                ),
                child: _CreateRoomButton());
          }
          final User user = onlineUsers[index - 1];

          return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ProfileAvatar(
                imageUrl: user.imageUrl,
                isActive: true,
              ));
        },
      ),
    );
  }
}

class _CreateRoomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      color: Colors.white,
      borderSide: BorderSide(
        width: 3,
        color: Colors.blueAccent,
      ),
      onPressed: () => print("Create Room"),
      child: Row(
        children: [
          ShaderMask(
            shaderCallback: (rect) =>
                Palette.createRoomGradient.createShader(rect),
            child: Icon(
              Icons.video_call,
              size: 35,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 4),
          Text("Create\nRoom"),
        ],
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    );
  }
}
