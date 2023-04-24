import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../src.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 100.0),
              AppTextField(
                labelText: 'Email',
                keyboardType: TextInputType.emailAddress,
                onChanged: (input) {
                  ref.read(mailInputProvider.notifier).state = input;
                },
                useValidator: true,
              ),
              AppTextField(
                onChanged: (input) {
                  ref.read(passwordinputProvider.notifier).state = input;
                },
                labelText: 'Password',
                maxCharacters: 16,
                icon: _buildIcon(ref),
                hideCharacters: ref.watch(hidePasswordProvider),
                useValidator: true,
              ),
              TextButton(
                onPressed: () => context.push(Routes.register.route),
                child: const Text('Register'),
              ),
              ref.watch(loadingStateProvider)
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          final user = await ref.read(RepositoryProvider.auth).signIn(
                                ref.read(mailInputProvider.notifier).state!,
                                ref.read(passwordinputProvider.notifier).state!,
                              );
                          if (user != null && user.error == null && context.mounted) {
                            context.push(Routes.home.route);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(user?.error ?? 'Something went wrong')),
                            );
                          }
                        }
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
