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

  Future saveToFirestore(WidgetRef ref) async {
    setNewStatus(Status.loading);
    setAuthor(ref.read(RepositoryProvider.auth).currentUserName ?? 'Anonymous');
    final saveResult = await ref.read(RepositoryProvider.firestore).saveNewPost(state);
    if (saveResult) {
      resetState();
      setNewStatus(Status.success);
    } else {
      setNewStatus(Status.error);
    }
  }

  void setNewStatus(Status status) {
    state = state.copyWith(saveStatus: status);
  }

  void resetState() {
    state = const UserPost();
  }

  Status get status => state.saveStatus;
}
