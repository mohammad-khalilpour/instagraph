import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagraph/state/post/backend/post_storage.dart';
import 'package:instagraph/typdefs/is_loading.dart';

class PostStorageNotifier extends StateNotifier<IsLoading> {
  PostStorageNotifier() : super(false);

  final _postStorage = const PostStorage();

  set isLoading(bool value) => state = value;

  Future<void> createPost({
    required String userId,
    required String username,
    required String description,
    required Uint8List file,
  }) async {
    try {
      isLoading = true;
      await _postStorage.createPost(
        userId: userId,
        username: username,
        description: description,
        file: file,
      );
      isLoading = false;
    } catch (_) {}
  }

  Future<void> like({required String userId, required String postId}) async {
    try {
      isLoading = true;
      await _postStorage.like(
        userId: userId,
        postId: postId,
      );
      isLoading = false;
      isLoading = false;
    } catch (_) {}
  }

  Future<void> unlike({required String userId, required String postId}) async {
    try {
      isLoading = true;
      await _postStorage.unlike(
        userId: userId,
        postId: postId,
      );
      isLoading = false;
      isLoading = false;
    } catch (_) {}
  }
}
