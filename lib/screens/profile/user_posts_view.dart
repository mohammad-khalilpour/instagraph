import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagraph/state/post/providers/uesr_post_provider.dart';

class UserPostsView extends ConsumerWidget {
  const UserPostsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(userPostsProvider);
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
                  margin: const EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: const Color.fromARGB(115, 84, 84, 84),
                  ),
                  child: Center(
                    child: Image(
                      image: NetworkImage(posts.elementAt(index).fileAddress),
                    ),
                  ),
                );
              },
            );
          }
        },
        error: (error, stackTrace) {
          return const RefreshProgressIndicator();
        },
        loading: () {
          return const RefreshProgressIndicator();
        },
      ),
    );
  }
}
