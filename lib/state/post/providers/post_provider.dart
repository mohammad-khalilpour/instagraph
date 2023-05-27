import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagraph/state/post/models/post_model.dart';

import '../../../constants/firebase_constants.dart';

final postProvider = StreamProvider.family.autoDispose<PostModel, String>((ref, String postId) {
  final controller = StreamController<PostModel>();
  final sub = FirebaseFirestore.instance
      .collection(
        FirebaseConstants.posts,
      )
      .where(
        FirebaseConstants.postId,
        isEqualTo: postId,
      )
      .limit(1)
      .snapshots()
      .listen((snapshot) {
    if (snapshot.docs.isNotEmpty) {
      final doc = snapshot.docs.first;
      final json = doc.data();
      final userModel = PostModel.fromMap(json);
      controller.add(userModel);
    }
  });

  ref.onDispose(() {
      sub.cancel();
      controller.close();
    });

  return controller.stream;
});