import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_ex_arbete/src/src.dart';

class CreatePostProviders {
  static final createPostProvider = StateNotifierProvider<UserPostState, UserPost>(
    (ref) => UserPostState(),
  );
  static AlwaysAliveRefreshable<UserPostState> get createPostNotifier =>
      createPostProvider.notifier;
}
