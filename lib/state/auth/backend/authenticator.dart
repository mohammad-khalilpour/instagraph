import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagraph/state/auth/models/auth_result.dart';

class Authenticator {
  bool get isAlreadyLoggedIn => userId != null;
  String? get email => FirebaseAuth.instance.currentUser?.email;
  String? get userId => FirebaseAuth.instance.currentUser?.uid;
  String? get username => FirebaseAuth.instance.currentUser?.displayName;

  const Authenticator();

  Future<void> checkAuth() async {
    try {
      await FirebaseAuth.instance.currentUser?.reload();
    } catch (_) {}
  }

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<AuthResult> logIn(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return AuthResult.success;
    } catch (_) {
      return AuthResult.failure;
    }
  }

  Future<AuthResult> signUp(
      String username, String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await FirebaseAuth.instance.currentUser!.updateDisplayName(username);

      return AuthResult.success;
    } catch (_) {
      return AuthResult.failure;
    }
  }
}
