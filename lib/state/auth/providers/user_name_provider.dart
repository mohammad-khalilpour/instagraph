import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'auth_provider.dart';

final usernameProvider = Provider<String?>((ref) {
  String? userId = ref.watch(authStateProvider).username;
  return userId;
});
