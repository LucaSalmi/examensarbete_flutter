import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../src.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          child: Column(
            children: [
              const SizedBox(height: 100.0),
              AppTextField(
                labelText: 'Email',
                onChanged: (input) {
                  ref.read(mailInputProvider.notifier).state = input;
                },
              ),
              AppTextField(
                onChanged: (input) {
                  ref.read(passwordinputProvider.notifier).state = input;
                },
                labelText: 'Password',
                maxCharacters: 16,
                icon: _buildIcon(ref),
                hideCharacters: ref.watch(hidePasswordProvider),
              ),
              ElevatedButton(
                onPressed: () {
                  context.push(Routes.home.route);
                },
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIcon(WidgetRef ref) {
    final hidePassword = ref.watch(hidePasswordProvider);
    final hidePasswordNotifier = ref.read(hidePasswordProvider.notifier);
    return IconButton(
      icon: Icon(hidePassword ? Icons.lock_open : Icons.lock),
      onPressed: () {
        hidePasswordNotifier.state = !hidePassword;
      },
    );
  }
}

final hidePasswordProvider = StateProvider<bool>((ref) => true);
final passwordinputProvider = StateProvider<String>((ref) => '');
final mailInputProvider = StateProvider<String>((ref) => '');
