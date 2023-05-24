import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:instagraph/constants/firebase_constants.dart';

class PostModel extends MapView<String, Object?> {
  final String postId;
  final String fileAddress;
  final String description;
  final List<String> comments = [];
  PostModel({
    required this.postId,
    required this.fileAddress,
    required this.description,
  }) : super(
          {
            FirebaseConstants.postId: postId,
            FirebaseConstants.fileAddress: fileAddress,
            FirebaseConstants.createdAt: FieldValue.serverTimestamp(),
            FirebaseConstants.description: description,
            FirebaseConstants.comments: [],
          },
        );


  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      postId: map[FirebaseConstants.postId] as String,
      fileAddress: map[FirebaseConstants.fileAddress] as String,
      description: map[FirebaseConstants.description] as String,
    );
  }




}
