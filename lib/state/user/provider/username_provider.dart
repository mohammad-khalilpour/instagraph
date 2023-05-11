import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagraph/state/auth/providers/user_id_provider.dart';
import 'package:instagraph/state/user/provider/user_provider.dart';

final usernameProvider = AutoDisposeStreamProvider<String>((ref) {
  final userId = ref.watch(userIdProvider);
  final user = ref.watch(userProvider(userId!));
  return user.when(data: (userModel) {
    return Stream.value(userModel.username);
  }, error: (error, stacktrace) {
    return const Stream.empty();
  }, loading: () {
    return const Stream.empty();
  });
});
