import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_ex_arbete/src/src.dart';

final userPostsStream = StreamProvider.autoDispose<List<UserPost>>(
  (ref) async* {
    yield* await ref.watch(RepositoryProvider.firestore).listenToUserPostCollection();
  },
);
