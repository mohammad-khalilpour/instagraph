import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagraph/state/auth/providers/user_id_provider.dart';
import 'package:instagraph/state/post/models/post_model.dart';
import 'package:instagraph/state/post/providers/post_provider.dart';
import 'package:instagraph/state/post/providers/post_storage_provider.dart';

class PostCard extends ConsumerWidget {
  final PostModel post;
  const PostCard({
    required this.post,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUserId = ref.read(userIdProvider);
    bool isliked() {
      return post.likes.contains(currentUserId);
    }

    return LayoutBuilder(builder: (context, constraints) {
      final width = constraints.maxWidth;
      return Column(
        children: [
          SizedBox(
            width: width,
            child: AspectRatio(
              aspectRatio: 1.3,
              child: Image(
                image: NetworkImage(post.fileAddress),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Row(
            children: [
              Column(
                children: [
                  IconButton(
                    icon: isliked()
                        ? const Icon(Icons.favorite)
                        : const Icon(Icons.favorite_border),
                    onPressed: () {
                      isliked()
                          ? ref.read(postStorageProvider.notifier).unlike(
                                userId: currentUserId!,
                                postId: post.postId,
                              )
                          : ref.read(postStorageProvider.notifier).like(
                                userId: currentUserId!,
                                postId: post.postId,
                              );
                    },
                  ),
                  Text(post.likes.length.toString()),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    icon: const Icon(Icons.mode_comment_rounded),
                    onPressed: () {},
                  ),
                  Text(post.comments.length.toString()),
                ],
              ),
            ],
          ),
          Text(post.username + post.description),
        ],
      );
    });
  }
}
