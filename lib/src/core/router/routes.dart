class Routes {
  static const String root = '/';
  static const String login = 'login';
  static const String home = 'home';
}

extension RouteNames on String {
  String get route => this != '/' ? '/$this': this;
}