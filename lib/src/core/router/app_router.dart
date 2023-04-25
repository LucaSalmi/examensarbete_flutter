import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../src.dart';

// This is super important - otherwise, we would throw away the whole widget tree when the provider is updated.
final navigatorKey = GlobalKey<NavigatorState>();
// We need to have access to the previous location of the router. Otherwise, we would start from '/' on rebuild.
GoRouter? _previousRouter;

final routerProvider = Provider(
  (ref) {
    final bool loggedIn = ref.watch(authStateProvider);

    return GoRouter(
      initialLocation: _previousRouter?.location,
      navigatorKey: navigatorKey,
      routes: [
        GoRoute(
          path: Routes.root.route,
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: Routes.login.route,
          builder: (context, state) => const LoginPage(),
        ),
        GoRoute(
          path: Routes.register.route,
          builder: (context, state) => const RegisterUserPage(),
        ),
        GoRoute(
          path: Routes.craetePost.route,
          builder: (context, state) => const CreatePostpage(),
        ),
      ],
      redirect: (context, state) {
        // if the user is not logged in, they need to login
        final bool loggingIn = state.subloc == Routes.login.route;
        if (!loggedIn) {
          return loggingIn ? null : Routes.login.route;
        }

        // if the user is logged in but still on the login page, send them to
        // the home page
        if (loggingIn) {
          return Routes.root.route;
        }

        // no need to redirect at all
        return null;
      },
    );
  },
);

final authStateProvider =
    StateProvider<bool>((ref) => ref.watch(RepositoryProvider.auth).isSignedIn);
