import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagraph/state/auth/providers/auth_provider.dart';

final userIdProvider = Provider<String?>((ref) {
  String? userId = ref.watch(authStateProvider).userId;
  return userId;
});
