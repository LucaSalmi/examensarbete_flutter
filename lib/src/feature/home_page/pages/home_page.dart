import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: ListTile(
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.black, width: 1.0),
                borderRadius: BorderRadius.circular(5.0),
              ),
              title: Text('Item $index'),
            ),
          );
        },
      ),
    );
  }
}
