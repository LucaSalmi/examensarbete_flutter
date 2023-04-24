import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:login_ex_arbete/src/src.dart';

class RegisterUserPage extends ConsumerStatefulWidget {
  const RegisterUserPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterUserPageState();
}

class _RegisterUserPageState extends ConsumerState<RegisterUserPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register User'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              AppTextField(
                // The validator receives the text that the user has entered.
                useValidator: true,
                labelText: 'Email',
                keyboardType: TextInputType.emailAddress,
                onChanged: (input) {
                  ref.read(mailInputProvider.notifier).state = input;
                },
              ),
              AppTextField(
                // The validator receives the text that the user has entered.
                useValidator: true,
                labelText: 'Password',
                onChanged: (input) {
                  ref.read(passwordinputProvider.notifier).state = input;
                },
              ),
              AppTextField(
                // The validator receives the text that the user has entered.
                useValidator: true,
                labelText: 'Name',
                onChanged: (input) {
                  ref.read(nameInputProvider.notifier).state = input;
                },
              ),
              const SizedBox(height: 30),
              ref.watch(loadingStateProvider)
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () async {
                        // Validate returns true if the form is valid, or false otherwise.
                        if (_formKey.currentState!.validate()) {
                          ref.read(loadingStateProvider.notifier).state = true;
                          final newUser = await ref.read(RepositoryProvider.auth).createUser(
                                ref.read(mailInputProvider.notifier).state!,
                                ref.read(passwordinputProvider.notifier).state!,
                              );
                          ref.read(loadingStateProvider.notifier).state = false;
                          if (newUser != null && newUser.error == null && context.mounted) {
                            context.go(Routes.home.route);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(newUser?.error ?? 'Something went wrong')),
                            );
                          }
                        }
                      },
                      child: const Text('Submit'),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
