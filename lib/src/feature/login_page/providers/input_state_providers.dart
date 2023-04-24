import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final passwordinputProvider = StateProvider<String?>((ref) => null);
final mailInputProvider = StateProvider<String?>((ref) => null);
final nameInputProvider = StateProvider<String?>((ref) => null);
final loadingStateProvider = StateProvider<bool>((ref) => false);
