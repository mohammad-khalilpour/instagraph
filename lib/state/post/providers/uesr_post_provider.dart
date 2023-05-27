import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagraph/constants/firebase_constants.dart';
import 'package:instagraph/state/post/models/post_model.dart';
import 'package:instagraph/state/user/provider/user_provider.dart';

final userPostsProvider =
    StreamProvider.family.autoDispose<Iterable<PostModel>, String>(
  (ref, userId) {
    final controller = StreamController<Iterable<PostModel>>();

    controller.onListen = () {
      controller.sink.add([]);
    };

    final user = ref.watch(userProvider(userId));
    final username = user.when(
      data: (userModel) {
        return userModel.username;
      },
      error: (error, stacktrace) {
        return null;
      },
      loading: () {
        return null;
      },
    );

    final postInfo = FirebaseFirestore.instance
        .collection(
          FirebaseConstants.posts,
        )
        .orderBy(
          FirebaseConstants.createdAt,
          descending: true,
        )
        .where(FirebaseConstants.username, isEqualTo: username)
        .snapshots()
        .listen(
      (snapshot) {
        final documents = snapshot.docs;
        final posts = documents
            .where(
              (doc) => !doc.metadata.hasPendingWrites,
            )
            .map(
              (doc) => PostModel.fromMap(doc.data()),
            );
        controller.sink.add(posts);
      },
    );

    ref.onDispose(() {
      postInfo.cancel();
      controller.close();
    });

    return controller.stream;
  },
);
