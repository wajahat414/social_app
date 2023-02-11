import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:social_app/concepts/mixin_ex.dart';

class Heart extends StatefulWidget {
  const Heart({super.key});

  @override
  State<Heart> createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation? _colorAnimation;
  Animation? _sizeAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    _controller?.addListener(() {
      print(_controller?.value);
      print(_colorAnimation?.value);
      setState(() {});
    });
    _colorAnimation = ColorTween(begin: Colors.grey[400], end: Colors.red)
        .animate(_controller!);
    _sizeAnimation = TweenSequence([
      TweenSequenceItem<double>(tween: Tween(begin: 40, end: 70), weight: 50),
      TweenSequenceItem<double>(tween: Tween(begin: 70, end: 40), weight: 50)
    ]).animate(_controller!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _controller!,
          builder: (BuildContext context, _) {
            return IconButton(
                onPressed: () {
                  switch (_controller!.status) {
                    case AnimationStatus.completed:
                      _controller!.reverse();
                      break;
                    case AnimationStatus.dismissed:
                      _controller!.forward();
                      break;
                    default:
                  }
                },
                icon: Icon(
                  Icons.favorite,
                  color: _colorAnimation?.value,
                  size: _sizeAnimation?.value,
                ));
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
