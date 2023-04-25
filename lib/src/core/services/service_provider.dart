import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_ex_arbete/src/src.dart';

class ServiceProvider {
  static final loginService = Provider((ref) => AuthService());
}
