import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagraph/state/auth/notifiers/auth_notifier.dart';
import '../models/auth_state.dart';

final authStateProvider = StateNotifierProvider<AuthStateNotifier, AuthState>(
  (ref) => AuthStateNotifier(),
);
