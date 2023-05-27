import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:instagraph/constants/firebase_constants.dart';
import 'package:instagraph/state/post/models/post_model.dart';
import 'package:instagraph/state/user/backend/user_storage.dart';
import 'package:uuid/uuid.dart';

class PostStorage {
  const PostStorage();

  Future<void> createPost({
    required String userId,
    required String username,
    required String description,
    required Uint8List file,
  }) async {
    final storage = FirebaseStorage.instance;
    final postId = const Uuid().v4();

    final postsRef = storage.ref().child('posts').child(postId);
    await postsRef.putData(file);
    String downloadUrl = await postsRef.getDownloadURL();

    final post = PostModel(
      postId: postId,
      username: username,
      fileAddress: downloadUrl,
      description: description,
      comments: [],
      likes: [],
    );
    await FirebaseFirestore.instance
        .collection(FirebaseConstants.posts)
        .add(post);
    await const UserStorage().addPost(
      userId: userId,
      postId: postId,
    );
  }

  Future<void> like({required String userId, required String postId}) async {
    final postInfo = await FirebaseFirestore.instance
        .collection(FirebaseConstants.posts)
        .where(FirebaseConstants.postId, isEqualTo: postId)
        .limit(1)
        .get();

    postInfo.docs.first.reference.update({
      FirebaseConstants.likes: FieldValue.arrayUnion([userId])
    });
  }

  Future<void> unlike({required String userId, required String postId}) async {
    final postInfo = await FirebaseFirestore.instance
        .collection(FirebaseConstants.posts)
        .where(FirebaseConstants.postId, isEqualTo: postId)
        .limit(1)
        .get();

    postInfo.docs.first.reference.update({
      FirebaseConstants.likes: FieldValue.arrayRemove([userId])
    });
  }
}
