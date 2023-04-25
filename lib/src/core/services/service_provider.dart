import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_ex_arbete/src/src.dart';

class ServiceProvider {
  static final authService = Provider((ref) => AuthService());
  static final firestoreService = Provider((ref) => FirestoreService());
}
