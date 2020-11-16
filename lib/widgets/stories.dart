import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/models/story_model.dart';
import 'package:flutter_facebook_responsive_ui/widgets/widgets.dart';

class Stories extends StatelessWidget {
  final User currentUser;
  final List<Story> stories;

  const Stories({
    Key? key,
    required this.currentUser,
    required this.stories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.white,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 10,
        ),
        itemCount: 1 + stories.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: _UserStoryCard(
                  currentUser: currentUser,
                ));
          }
          final Story story = stories[index - 1];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: _StoryCard(
              story: story,
            ),
          );
        },
      ),
    );
  }
}

class _StoryCard extends StatelessWidget {
  final Story story;

  const _StoryCard({
    Key? key,
    required this.story,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          story.imageUrl,
          height: double.infinity,
          width: 110,
          fit: BoxFit.cover,
        ),
      ),
      Container(
        height: double.infinity,
        width: 110,
        decoration: BoxDecoration(
          gradient: Palette.storyGradient,
          borderRadius: BorderRadius.circular(
            12,
          ),
        ),
      ),
      Positioned(
          top: 8,
          left: 8,
          child: ProfileAvatar(
            hasBorder: !story.isViewed,
            imageUrl: story.imageUrl,
          )),
      Positioned(
        bottom: 8.0,
        left: 8,
        right: 8,
        child: Text(
          story.user.name,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      )
    ]);
  }
}

class _UserStoryCard extends StatelessWidget {
  final User currentUser;

  const _UserStoryCard({
    Key? key,
    required this.currentUser,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          currentUser.imageUrl,
          height: double.infinity,
          width: 110,
          fit: BoxFit.cover,
        ),
      ),
      Container(
        height: double.infinity,
        width: 110,
        decoration: BoxDecoration(
          gradient: Palette.storyGradient,
          borderRadius: BorderRadius.circular(
            12,
          ),
        ),
      ),
      Positioned(
        top: 8,
        left: 8,
        child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            padding: EdgeInsets.zero,
            icon: const Icon(Icons.add),
            iconSize: 30,
            color: Palette.facebookBlue,
            onPressed: () => print("Add Story"),
          ),
        ),
      ),
      Positioned(
        bottom: 8.0,
        left: 8,
        right: 8,
        child: Text(
          "Add to Story",
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      )
    ]);
  }
}
