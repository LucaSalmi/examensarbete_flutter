import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_ex_arbete/src/core/models/user.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;

  bool get isSignedIn => _auth.currentUser != null;
  String? get currentUserName => _auth.currentUser?.displayName ?? _auth.currentUser?.email;

  void logOut() => _auth.signOut();

  Future<AppUser?> signInWithEmailAndPassword(String email, String password) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = userCredential.user;
      return AppUser(uid: user?.uid, mail: user?.email, name: user?.displayName);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return const AppUser(error: 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        return const AppUser(error: 'Wrong password provided for that user.');
      }
    }
    return null;
  }

  Future<AppUser?> createUserWithEmailAndPassword(String email, String password) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = userCredential.user;
      return AppUser(uid: user?.uid, mail: user?.email, name: user?.displayName);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return const AppUser(error: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        return const AppUser(error: 'The account already exists for that email.');
      }
    } catch (e) {
      return AppUser(error: e.toString());
    }
    return null;
  }
}
