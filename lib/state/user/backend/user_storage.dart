import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagraph/constants/firebase_constants.dart';
import 'package:instagraph/state/user/model/user_model.dart';

class UserStorage {
  const UserStorage();

  Future<bool> saveUserInfo({
    required String userId,
    required String username,
    required String? email,
    required String fullName,
  }) async {
    try {
      final userInfo = await FirebaseFirestore.instance
          .collection(FirebaseConstants.users)
          .where(FirebaseConstants.userId, isEqualTo: userId)
          .limit(1)
          .get();

      if (userInfo.docs.isNotEmpty) {
        await userInfo.docs.first.reference.update({
          FirebaseConstants.username: username,
          FirebaseConstants.email: email ?? '',
          FirebaseConstants.fullName: fullName,
        });
        return true;
      }

      final user = UserModel(
        userId: userId,
        username: username,
        email: email,
        fullName: fullName,
      );

      await FirebaseFirestore.instance
          .collection(FirebaseConstants.users)
          .add(user);
      return true;
    } catch (_) {
      return false;
    }
  }
}
