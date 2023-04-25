import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:login_ex_arbete/src/src.dart';

class CreatePostpage extends ConsumerStatefulWidget {
  const CreatePostpage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CreatePostpageState();
}

class _CreatePostpageState extends ConsumerState<CreatePostpage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final createPostProvider = ref.read(CreatePostProviders.createPostNotifier);
    final isFormLoading = ref.watch(formSavingProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Post'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              AppTextField(
                labelText: 'Title',
                onChanged: (value) {
                  createPostProvider.setTitle(value);
                },
                useValidator: true,
              ),
              AppTextField(
                labelText: 'Body',
                onChanged: (value) {
                  createPostProvider.setBody(value);
                },
                useValidator: true,
              ),
              isFormLoading
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          ref.read(formSavingProvider.notifier).state = true;
                          final success = await createPostProvider.saveToFirestore(ref);
                          if (success && context.mounted) {
                            context.pop();
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Failed to save, try again later'),
                              ),
                            );
                          }
                          ref.read(formSavingProvider.notifier).state = false;
                        }
                      },
                      child: const Text('Save Post'),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

final formSavingProvider = StateProvider<bool>((ref) => false);
