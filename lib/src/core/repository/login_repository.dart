import 'package:login_ex_arbete/src/src.dart';

class LoginRepository {
  LoginRepository({required LoginService authService})
      : _authService = authService;

  Future<AppUser?> createUser(String email, String password) async =>
      await _authService.createUserWithEmailAndPassword(email, password);

  Future<AppUser?> signIn(String email, String password) async =>
      await _authService.signInWithEmailAndPassword(email, password);

  final LoginService _authService;
}
