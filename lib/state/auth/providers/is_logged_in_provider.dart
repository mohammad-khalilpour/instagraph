import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagraph/state/auth/models/auth_result.dart';
import 'package:instagraph/state/auth/providers/auth_provider.dart';

final isLoggedInProvider = AutoDisposeProvider<bool>(
  (ref) => ref.watch(authStateProvider).result == AuthResult.success,
);
