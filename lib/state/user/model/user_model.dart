import 'dart:collection';
import 'package:instagraph/constants/firebase_constants.dart';

class UserModel extends MapView<String, Object?> {
  final String userId;
  final String username;
  final String? email;
  final String fullName;
  final String? profileDescription;
  final String? profilePicture;
  final List<String> followers;
  final List<String> following;
  final List<String> posts;

  UserModel({
    required this.userId,
    required this.username,
    required this.email,
    required this.fullName,
    required this.profileDescription,
    required this.profilePicture,
    required this.followers,
    required this.following,
    required this.posts,
  }) : super({
          FirebaseConstants.userId: userId,
          FirebaseConstants.username: username,
          FirebaseConstants.email: email,
          FirebaseConstants.fullName: fullName,
          FirebaseConstants.profileDescription: profileDescription,
          FirebaseConstants.profilePicture: profilePicture,
          FirebaseConstants.followers: followers,
          FirebaseConstants.following: following,
          FirebaseConstants.posts: posts,
        });

  UserModel copyWith(
      {String? userId,
      String? username,
      String? email,
      String? fullName,
      String? profileDescription,
      String? profilePicture,}) {
    return UserModel(
      userId: userId ?? this.userId,
      username: username ?? this.username,
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      profileDescription: profileDescription ?? this.profileDescription,
      profilePicture: profilePicture ?? this.profilePicture,
      followers: followers,
      following: followers,
      posts: posts,
    );
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    final followersList = map[FirebaseConstants.followers] as List<dynamic>;
    final followingsList = map[FirebaseConstants.following] as List<dynamic>;
    final postList = map[FirebaseConstants.posts] as List<dynamic>;

    return UserModel(
      userId: map[FirebaseConstants.userId] as String,
      username: map[FirebaseConstants.username] as String,
      email: map[FirebaseConstants.email] as String? ?? '',
      fullName: map[FirebaseConstants.fullName] as String,
      profileDescription: map[FirebaseConstants.profileDescription] as String? ?? '',
      profilePicture: map[FirebaseConstants.profilePicture] as String? ?? '',
      followers: followersList.map((item) => item.toString()).toList(),
      following: followingsList.map((item) => item.toString()).toList(),
      posts: postList.map((item) => item.toString()).toList(),
    );
  }
}
