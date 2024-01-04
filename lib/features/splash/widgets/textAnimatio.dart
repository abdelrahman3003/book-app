import 'package:flutter/material.dart';

class textAnimation extends StatelessWidget {
  const textAnimation({
    super.key,
    required this.slidinganmation,
  });

  final Animation<Offset> slidinganmation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidinganmation,
      builder: (context, _) {
        return SlideTransition(
          position: slidinganmation,
          child: const Text(
            "Read Free Books",
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }
}
