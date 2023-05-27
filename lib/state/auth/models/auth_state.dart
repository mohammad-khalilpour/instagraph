// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:instagraph/state/auth/models/auth_result.dart';

class AuthState {
  final AuthResult? result;
  final bool isLoading;
  final String? username;
  final String? userId;

  const AuthState({
    required this.result,
    required this.isLoading,
    required this.username,
    required this.userId,
  });

  const AuthState.unknown()
      : result = null,
        isLoading = false,
        username = null,
        userId = null;

  AuthState copyWithIsLoading(bool isLoading) {
    return AuthState(
      result: result,
      isLoading: isLoading,
      username: username,
      userId: userId,
    );
  }

  @override
  bool operator ==(covariant AuthState other) =>
      identical(this, other) ||
      (other.result == result &&
          other.isLoading == isLoading &&
          other.userId == userId);

  @override
  int get hashCode => Object.hash(
        result,
        isLoading,
        userId,
      );
}
