import 'dart:collection';
import 'dart:convert';

import 'package:instagraph/constants/firebase_constants.dart';

class UserModel extends MapView<String, String?> {
  final String userId;
  final String username;
  final String? email;


  UserModel({
    required this.userId,
    required this.username,
    required this.email,
  }) : super({
    FirebaseConstants.userId: userId,
    FirebaseConstants.username: username,
    FirebaseConstants.email: email,
  });

  UserModel copyWith({
    String? userId,
    String? username,
    String? email,
  }) {
    return UserModel(
      userId: userId ?? this.userId,
      username: username ?? this.username,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'userName': username,
      'email': email,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['userId'] as String,
      username: map['userName'] as String,
      email: map['email'] != null ? map['email'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
