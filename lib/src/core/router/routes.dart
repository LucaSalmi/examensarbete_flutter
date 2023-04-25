class Routes {
  static const String root = '/';
  static const String login = 'login';
  static const String home = 'home';
  static const String register = 'register';
  static const String craetePost = 'create_post';
}

extension RouteNames on String {
  String get route => this != '/' ? '/$this': this;
}