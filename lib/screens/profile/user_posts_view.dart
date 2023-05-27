import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagraph/state/post/providers/uesr_post_provider.dart';
import 'package:instagraph/widgets/post_page.dart';

class UserPostsView extends ConsumerWidget {
  final String username;
  const UserPostsView({
    required this.username,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(userPostsProvider(username));
    return RefreshIndicator(
      onRefresh: () {
        return Future.delayed(
          const Duration(
            seconds: 1,
          ),
        );
      },
      child: posts.when(
        data: (posts) {
          if (posts.isEmpty) {
            return const Text('you have no posts');
          } else {
            return GridView.builder(
              itemCount: posts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, childAspectRatio: 0.85),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.all(1.5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: const Color.fromARGB(115, 84, 84, 84),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PostPage(
                            postId: posts.elementAt(index).postId,
                          ),
                        ),
                      );
                    },
                    child: Center(
                      child: AspectRatio(
                        aspectRatio: 0.85,
                        child: Image(
                          image: NetworkImage(
                            posts.elementAt(index).fileAddress,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
        error: (error, stackTrace) {
          return const Text('data');
        },
        loading: () {
          return const RefreshProgressIndicator();
        },
      ),
    );
  }
}
