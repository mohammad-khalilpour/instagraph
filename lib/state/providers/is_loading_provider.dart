import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagraph/state/auth/providers/auth_provider.dart';

final isLoadingProvider =
    Provider<bool>((ref) => ref.watch(authStateProvider).isLoading);
