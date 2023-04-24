import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_ex_arbete/src/src.dart';

class RepositoryProvider {
  static final auth = Provider(
    (ref) => LoginRepository(
      authService: ref.read(ServiceProvider.loginService),
    ),
  );
}