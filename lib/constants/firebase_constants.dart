import 'package:flutter/foundation.dart';

@immutable
class FirebaseConstants {
  //user constants
  static const users = 'users';
  static const userId = 'uid';
  static const username = 'username';
  static const email = 'email';
  static const fullName = 'fullName';
  static const profileDescription = 'description';
  static const profilePicture = 'profilePic';
  static const followers = 'followers';
  static const following = 'following';
  static const posts = 'posts';

  // post constants
  static const postId = 'postId';
  static const fileAddress = 'fileAddress';
  static const description = 'description';
  static const comments = 'comments';
  static const createdAt = 'createdAt';
  static const likes = 'likes';
}
