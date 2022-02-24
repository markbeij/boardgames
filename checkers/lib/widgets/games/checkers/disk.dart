import 'package:flutter/material.dart';

class DiskWidget extends StatelessWidget {
  final Color color;
  final bool isKing;
  const DiskWidget({Key? key, required this.color, this.isKing = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        child: AspectRatio(
            aspectRatio: 1,
            child: Stack(children: [
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color,
                ),
              ),
              if (isKing)
                Container(
                  alignment: Alignment.center,
                  child: const Text('K'),
                )
            ])));
  }
}
