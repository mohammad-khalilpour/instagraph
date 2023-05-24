import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagraph/constants/firebase_constants.dart';
import 'package:instagraph/state/auth/providers/user_id_provider.dart';
import 'package:instagraph/state/post/models/post_model.dart';
import 'package:instagraph/state/user/provider/user_provider.dart';

final userPostsProvider = StreamProvider.autoDispose<Iterable<PostModel>>(
  (ref) {
    final controller = StreamController<Iterable<PostModel>>();

    controller.onListen = () {
      controller.sink.add([]);
    };

    final userId = ref.read(userIdProvider);
    final user = ref.watch(userProvider(userId!));
    final postIdList = user.when(
      data: (userModel) {
        return userModel.posts;
      },
      error: (error, stacktrace) {
        return List.empty();
      },
      loading: () {
        return List.empty();
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
        .where(FirebaseConstants.postId, whereIn: postIdList)
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
