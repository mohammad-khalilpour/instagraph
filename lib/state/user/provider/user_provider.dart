import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagraph/constants/firebase_constants.dart';
import 'package:instagraph/state/user/model/user_model.dart';

final userProvider =
    StreamProvider.family.autoDispose<UserModel, String>((ref, String userId) {
  final controller = StreamController<UserModel>();
  final sub = FirebaseFirestore.instance
      .collection(
        FirebaseConstants.users,
      )
      .where(
        FirebaseConstants.userId,
        isEqualTo: userId,
      )
      .limit(1)
      .snapshots()
      .listen((snapshot) {
    if (snapshot.docs.isNotEmpty) {
      final doc = snapshot.docs.first;
      final json = doc.data();
      final userModel = UserModel.fromMap(json);
      controller.add(userModel);
    }
  });

  ref.onDispose(() {
      sub.cancel();
      controller.close();
    });

  return controller.stream;
});
