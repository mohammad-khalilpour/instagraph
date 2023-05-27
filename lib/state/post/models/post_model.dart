import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:instagraph/constants/firebase_constants.dart';

class PostModel extends MapView<String, Object?> {
  final String postId;
  final String username;
  final String fileAddress;
  final String description;
  final List<String> comments;
  final List<String> likes;
  PostModel({
    required this.postId,
    required this.username,
    required this.fileAddress,
    required this.description,
    required this.comments,
    required this.likes,
  }) : super(
          {
            FirebaseConstants.postId: postId,
            FirebaseConstants.username: username,
            FirebaseConstants.fileAddress: fileAddress,
            FirebaseConstants.createdAt: FieldValue.serverTimestamp(),
            FirebaseConstants.description: description,
            FirebaseConstants.comments: [],
            FirebaseConstants.likes: [],
          },
        );

  factory PostModel.fromMap(Map<String, dynamic> map) {
    final comments = map[FirebaseConstants.comments] as List<dynamic>;
    final likes = map[FirebaseConstants.likes] as List<dynamic>;

    return PostModel(
      postId: map[FirebaseConstants.postId] as String,
      username: map[FirebaseConstants.username] as String,
      fileAddress: map[FirebaseConstants.fileAddress] as String,
      description: map[FirebaseConstants.description] as String,
      comments: comments.map((item) => item.toString()).toList(),
      likes: likes.map((item) => item.toString()).toList(),
    );
  }
}
