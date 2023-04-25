import 'package:flutter/widgets.dart';

class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget({
    this.errorMessage = 'Something went wrong',
    super.key,
  });

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(errorMessage));
  }
}
