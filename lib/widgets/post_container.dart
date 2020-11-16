import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/models/post_model.dart';
import 'package:flutter_facebook_responsive_ui/widgets/widgets.dart';

class PostContainer extends StatelessWidget {
  final Post post;

  const PostContainer({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.symmetric(vertical: 5),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _PostHeader(post: post),
        ],
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;

  const _PostHeader({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(imageUrl: post.user.imageUrl),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(post.user.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  )),
              Row(
                children: [
                  Text(
                    "${post.timeAgo} - ",
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
                  Icon(
                    Icons.public,
                    color: Colors.grey[400],
                    size: 12,
                  ),
                ],
              )
            ],
          ),
        ),
        IconButton(
          icon: const Icon(Icons.more_horiz),
          onPressed: () => print("More Pressed"),
        )
      ],
    );
  }
}
