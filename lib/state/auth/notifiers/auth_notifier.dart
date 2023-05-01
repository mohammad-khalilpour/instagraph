import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagraph/state/auth/backend/authenticator.dart';
import 'package:instagraph/state/auth/models/auth_state.dart';
import 'package:instagraph/state/user/backend/user_storage.dart';

import '../models/auth_result.dart';

class AuthStateNotifier extends StateNotifier<AuthState> {
  final _authenticator = const Authenticator();
  final _userStorage = const UserStorage();

  AuthStateNotifier() : super(const AuthState.unknown()) {
    _authenticator.checkAuth();
    if (_authenticator.isAlreadyLoggedIn) {
      state = AuthState(
        result: AuthResult.success,
        isLoading: false,
        userId: _authenticator.userId,
      );
    }
  }

  Future<void> logOut() async {
    state = state.copyWithIsLoading(true);
    await _authenticator.logOut();
    state = const AuthState.unknown();
  }

  Future<void> logIn(String email, String password) async {
    state = state.copyWithIsLoading(true);
    final result = await _authenticator.logIn(email, password);
    state = AuthState(
      result: result,
      isLoading: false,
      userId: _authenticator.userId,
    );
  }

  Future<void> signUp(
      String username, String email, String password, String fullName) async {
    state = state.copyWithIsLoading(true);
    final result = await _authenticator.signUp(username, email, password);
    state = AuthState(
      result: result,
      isLoading: false,
      userId: _authenticator.userId,
    );
    saveUserInfo(fullName: fullName);
  }

  Future<void> saveUserInfo({required String fullName}) =>
      _userStorage.saveUserInfo(
        userId: _authenticator.userId!,
        username: _authenticator.username!,
        email: _authenticator.email,
        fullName: fullName,
      );
}
