import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagraph/state/post/notifiers/post_storage_notifier.dart';
import 'package:instagraph/typdefs/is_loading.dart';

final postStorageProvider = StateNotifierProvider<PostStorageNotifier, IsLoading>(
  (ref) => PostStorageNotifier(),
);
