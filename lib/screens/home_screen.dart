import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/data/data.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/widgets/circle_button.dart';
import 'package:flutter_facebook_responsive_ui/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: false,
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            floating: true,
            title: Text(
              "Facebook",
              style: const TextStyle(
                color: Palette.facebookBlue,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2,
              ),
            ),
            actions: [
              CircleButton(
                icon: Icons.search,
                iconSize: 30,
                onPressed: () => print('search'),
              ),
              CircleButton(
                icon: Icons.message,
                iconSize: 30,
                onPressed: () => print('messenger'),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: CreatePostContainer(currentUser: currentUser),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(0.0, 10, 0.0, 5.0),
            sliver: SliverToBoxAdapter(
                child: Rooms(
              onlineUsers: onlineUsers,
            )),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(0.0, 5, 0.0, 5.0),
            sliver: SliverToBoxAdapter(
                child: Stories(
              currentUser: currentUser,
              stories: stories,
            )),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final Post post = posts[index];
                return PostContainer(post: post);
              },
              childCount: posts.length,
            ),
          )
        ],
      ),
    );
  }
}
