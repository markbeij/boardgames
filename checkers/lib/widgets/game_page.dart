import 'package:flutter/material.dart';

class GamePageWidget extends StatelessWidget {
  final Widget? child;
  final String title;

  const GamePageWidget({Key? key, this.child, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: child,
      ),
    );
  }
}
