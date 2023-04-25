import 'package:login_ex_arbete/src/src.dart';

class FirestoreRepository {
  FirestoreRepository({required FirestoreService firestoreService}) : _service = firestoreService;

  void saveNewPost(UserPost post) => _service.saveNewPost(post);

  Future<Stream<List<UserPost>>> listenToUserPostCollection() =>
      _service.listenToUserPostCollection();

  //Service
  final FirestoreService _service;
}
