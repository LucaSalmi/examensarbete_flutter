import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:login_ex_arbete/src/src.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userPosts = ref.watch(userPostsStream);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
      ),
      body: userPosts.when(
        data: (posts) {
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            itemCount: posts.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.black, width: 1.0),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  title: Text(posts[index].body ?? 'Empty'),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => const Center(child: Text('Error')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(authStateProvider.notifier).state = false;
          ref.read(RepositoryProvider.auth).logOut();
        }, //context.push(Routes.craetePost.route),
        child: const Icon(Icons.create),
      ),
    );
  }
}
