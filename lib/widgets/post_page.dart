import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagraph/state/post/providers/post_provider.dart';
import 'package:instagraph/widgets/post_card.dart';

class PostPage extends ConsumerWidget {
  final String postId;
  const PostPage({
    required this.postId,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final post = ref.watch(postProvider(postId));
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: post.when(
          data: (post) {
            return PostCard(
              post: post,
            );
          },
          error: (object, stacktrace) => const Text('post is unavailable'),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
