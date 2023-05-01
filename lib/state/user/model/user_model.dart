import 'dart:collection';
import 'dart:convert';

import 'package:instagraph/constants/firebase_constants.dart';

class UserModel extends MapView<String, String?> {
  final String userId;
  final String username;
  final String? email;
  final String fullName;

  UserModel({
    required this.userId,
    required this.username,
    required this.email,
    required this.fullName,
  }) : super({
          FirebaseConstants.userId: userId,
          FirebaseConstants.username: username,
          FirebaseConstants.email: email,
          FirebaseConstants.fullName: fullName,
        });

  UserModel copyWith(
      {String? userId, String? username, String? email, String? fullName}) {
    return UserModel(
      userId: userId ?? this.userId,
      username: username ?? this.username,
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      FirebaseConstants.userId: userId,
      FirebaseConstants.username: username,
      FirebaseConstants.email: email,
      FirebaseConstants.fullName: fullName,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        userId: map[FirebaseConstants.userId] as String,
        username: map[FirebaseConstants.username] as String,
        email: map[FirebaseConstants.email] != null
            ? map[FirebaseConstants.email] as String
            : null,
        fullName: map[FirebaseConstants.fullName] as String);
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
