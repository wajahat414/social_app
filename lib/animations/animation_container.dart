import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AnimationContainer extends StatefulWidget {
  AnimationContainer({super.key});

  @override
  State<AnimationContainer> createState() => _AnimationContainerState();
}

class _AnimationContainerState extends State<AnimationContainer> {
  double opacity = 1;
  double _padding = 30;
  double width = 200;
  double height = 300;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          width: width,
          height: height,
          padding: EdgeInsets.all(_padding),
          decoration: BoxDecoration(),
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: (() => animate()), child: Text("Click ME")),
              AnimatedOpacity(
                  duration: Duration(seconds: 1),
                  opacity: opacity,
                  child: Text("I will Hide")),
            ],
          ),
        ),
      ),
    );
  }

  animate() {
    setState(() {
      opacity = 0;
      _padding = _padding * 2;
      width = width * 2;
      height = height * 3;
    });
  }
}
