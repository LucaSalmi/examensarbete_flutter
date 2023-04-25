import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:login_ex_arbete/src/src.dart';

class FirestoreService {
  final _firestore = FirebaseFirestore.instance;

  Future<Stream<List<UserPost>>> listenToUserPostCollection() async {
    final snapshots = _postsCollection.snapshots();
    final posts = snapshots.map(
      (event) => _getDataFromQuery(
        event,
        jsonConverter: UserPost.fromJson,
      ),
    );
    return posts;
  }

  Future<bool> saveNewPost(UserPost post) async {
    final postToSave = post.copyWith(id: newPostDocId);
    try {
      await _postsCollection.doc(postToSave.id).set(postToSave.toJson());
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  List<T> _getDataFromQuery<T>(
    QuerySnapshot<Map<String, dynamic>> querySnapshot, {
    T Function(Map<String, dynamic>)? jsonConverter,
  }) {
    assert(
      jsonConverter != null,
      'jsonConverter should not be null',
    );

    final List<T> objectsList = [];

    if (jsonConverter != null) {
      for (var element in querySnapshot.docs) {
        objectsList.add(jsonConverter(element.data()));
      }
    }

    return objectsList;
  }

  String get newPostDocId => _postsCollection.doc().id;

// ... Queries and CollectionReferences ...
  CollectionReference<Map<String, dynamic>> get _postsCollection =>
      _firestore.collection(DBConstants.postsCollection);
}
