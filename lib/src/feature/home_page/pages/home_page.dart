import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:login_ex_arbete/src/src.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ScrollController scrollController = ScrollController();
    final isButtonVisible = ref.watch(scrollButtonState);

    scrollController.addListener(() {
      //scroll listener
      double showoffset = 10.0; //Back to top botton will show on scroll offset 10.0

      if (scrollController.offset > showoffset) {
        ref.read(scrollButtonState.notifier).state = true;
      } else {
        ref.read(scrollButtonState.notifier).state = false;
      }
    });
    final userPosts = ref.watch(userPostsStream);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
      ),
      body: userPosts.when(
        data: (posts) {
          return ListView.builder(
            controller: scrollController,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            itemBuilder: (context, index) {
              final i = index % posts.length; //<----to the right
              final item = posts[i];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: UserPostCard(post: item),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => const Center(child: Text('Error')),
      ),
      floatingActionButton: _buildFabs(
        isButtonVisible,
        scrollController,
        context,
      ),
    );
  }

  Widget _buildFabs(
    bool isButtonVisible,
    ScrollController scrollController,
    BuildContext context,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Spacer(),
        AnimatedOpacity(
          duration: const Duration(milliseconds: 500), //show/hide animation
          opacity: isButtonVisible ? 1.0 : 0.0, //set obacity to 1 on visible, or hide
          child: FloatingActionButton.extended(
            heroTag: null,
            isExtended: true,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            onPressed: () {
              scrollController.animateTo(
                  //go to top of scroll
                  0, //scroll offset to go
                  duration: const Duration(milliseconds: 500), //duration of scroll
                  curve: Curves.fastOutSlowIn //scroll type
                  );
            },
            icon: const Icon(Icons.arrow_upward),
            label: const Text('Back to top'),
          ),
        ),
        FloatingActionButton(
          onPressed: () {
            context.push(Routes.craetePost.route);
          },
          child: const Icon(Icons.create),
        ),
      ],
    );
  }
}

final scrollButtonState = StateProvider<bool>((ref) => false);
