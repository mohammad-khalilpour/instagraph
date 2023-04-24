import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagraph/constants/firebase_constants.dart';
import 'package:instagraph/state/user/model/user_model.dart';

class UserStorage {
  final usersCollection =
      FirebaseFirestore.instance.collection(FirebaseConstants.users);

  Future<bool> saveUserInfo({
    required String userId,
    required String username,
    required String? email,
  }) async {
    try {
      final userInfo = await usersCollection
          .where(FirebaseConstants.userId, isEqualTo: userId)
          .limit(1)
          .get();

      if (userInfo.docs.isNotEmpty) {
        await userInfo.docs.first.reference.update({
          FirebaseConstants.username: username,
          FirebaseConstants.email: email ?? '',
        });
        return true;
      }

      final user = UserModel(
        userId: userId,
        username: username,
        email: email,
      );

      await usersCollection.add(user);
      return true;
    } catch (_) {
      return false;
    }
  }
}
