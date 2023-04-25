import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_ex_arbete/src/src.dart';

class UserPostState extends StateNotifier<UserPost> {
  UserPostState() : super(const UserPost());

  void setTitle(String title) {
    state = state.copyWith(title: title);
  }

  void setBody(String body) {
    state = state.copyWith(body: body);
  }

  void setAuthor(String author) {
    state = state.copyWith(userName: author);
  }

  void setCreatedTime() {
    state = state.copyWith(createdAt: DateTime.now());
  }

  Future<bool> saveToFirestore(WidgetRef ref) async {
    setAuthor(ref.read(RepositoryProvider.auth).currentUserName ?? 'Anonymous');
    setCreatedTime();
    return await ref.read(RepositoryProvider.firestore).saveNewPost(state);
  }
}
