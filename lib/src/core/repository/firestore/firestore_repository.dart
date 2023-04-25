import 'package:login_ex_arbete/src/src.dart';

class FirestoreRepository {
  FirestoreRepository({required FirestoreService firestoreService}) : _service = firestoreService;

  Future<bool> saveNewPost(UserPost post) async => await _service.saveNewPost(post);

  Future<Stream<List<UserPost>>> listenToUserPostCollection() =>
      _service.listenToUserPostCollection();

  //Service
  final FirestoreService _service;
}
