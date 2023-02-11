import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TweenAnimation extends StatefulWidget {
  const TweenAnimation({super.key});

  @override
  State<TweenAnimation> createState() => _TweenAnimationState();
}

class _TweenAnimationState extends State<TweenAnimation> {
  double _val = 1;
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      duration: const Duration(seconds: 2),
      child: const Text("Tween ANimation"),
      builder: (BuildContext context, double val, Widget? child) {
        return Opacity(
          opacity: val,
          child: Padding(
            padding: EdgeInsets.only(top: val * 500),
            child: Transform.rotate(
              angle: val * 2,
              child: child,
            ),
          ),
        );
      },
    );
  }
}
