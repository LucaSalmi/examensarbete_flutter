import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../src.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: Routes.root.route,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: Routes.home.route,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: Routes.register.route,
      builder: (context, state) => const RegisterUserPage(),
    ),
  ],
  navigatorKey: _rootNavigatorKey,
  initialLocation: Routes.root.route, 
);