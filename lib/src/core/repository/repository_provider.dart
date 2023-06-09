import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_ex_arbete/src/src.dart';

class RepositoryProvider {
  static final auth = Provider(
    (ref) => AuthRepository(
      authService: ref.read(ServiceProvider.authService),
    ),
  );
  static final firestore = Provider(
    (ref) => FirestoreRepository(
      firestoreService: ref.read(ServiceProvider.firestoreService),
    ),
  );
}
