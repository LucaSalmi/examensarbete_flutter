import 'package:login_ex_arbete/src/src.dart';

class AuthRepository {
  AuthRepository({required AuthService authService}) : _authService = authService;

  bool get isSignedIn => _authService.isSignedIn;

  Future<AppUser?> createUser(String email, String password) async =>
      await _authService.createUserWithEmailAndPassword(email, password);

  Future<AppUser?> signIn(String email, String password) async =>
      await _authService.signInWithEmailAndPassword(email, password);

  final AuthService _authService;
}
