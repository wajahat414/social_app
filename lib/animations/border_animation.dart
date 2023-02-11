import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:social_app/screens/home/components/suggestion_box.dart';

import '../models/suggestion.dart';
import '../non_ui_constants.dart';

class BorderAnimation extends StatefulWidget {
  final Duration duration;
  const BorderAnimation({super.key, required this.duration});

  @override
  State<BorderAnimation> createState() => _BorderAnimationState();
}

class _BorderAnimationState extends State<BorderAnimation>
    with TickerProviderStateMixin {
  double border_width = 10;
  final s1 = Suggestion("John Alia", "Post a New Picture", src1);
  int value = 0;
  AnimationController? _controllerRight;
  Tween<double>? progressTweenRight;
  Animation<double>? progressAnimationRight;
  AnimationController? _controllerLeft;
  Tween<double>? progressTweenLeft;
  Animation<double>? progressAnimationLeft;
  AnimationController? _controllerTopRight;
  Tween<double>? progressTweenTopRigth;
  Animation<double>? progressAnimationTopRight;
  AnimationController? _controllerTopLeft;
  Tween<double>? progressTweenTopLeft;
  Animation<double>? progressAnimationTopLeft;
  AnimationController? _controllerBottomLeft;
  Tween<double>? progressTweenBottomLeft;
  Animation<double>? progressAnimationBottomLeft;
  AnimationController? _controllerBottomRight;
  Tween<double>? progressTweenBottomRight;
  Animation<double>? progressAnimationBottomRight;
  int index = 0;
  @override
  void dispose() {
    // TODO: implement dispose
    _controllerBottomLeft!.dispose();
    _controllerRight!.dispose();
    _controllerLeft!.dispose();

    _controllerBottomRight!.dispose();
    _controllerTopLeft!.dispose();
    _controllerTopRight!.dispose();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    initalize();
    _controllerTopLeft!.forward();
    _controllerTopRight!.forward();

    _controllerTopLeft!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controllerLeft!.forward();
      }
    });
    _controllerTopRight!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controllerRight!.forward();
      }
    });
    _controllerRight!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controllerBottomRight!.forward();
      }
    });
    _controllerLeft!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controllerBottomLeft!.forward();
      }
    });
    _controllerBottomLeft!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        showNextSuggestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double widthX = 333;
    double heightX = 400;

    return Container(
      width: widthX,
      height: heightX,
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      child: Scaffold(
        body: Center(
          child: ClipRRect(
            child: Row(
              children: [
                left(heightX),
                Container(
                  width: widthX - 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      top(widthX),
                      Expanded(
                          child: SuggestionBox(
                        suggestion:
                            Suggestion.list[index % Suggestion.list.length],
                        callBack: performAnimation,
                        indexs: index,
                      )),
                      bottom(widthX)
                    ],
                  ),
                ),
                right(heightX),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void performAnimation() {
    setState(() {
      _controllerTopLeft!.reset();
      _controllerTopRight!.reset();
      _controllerRight!.reset();
      _controllerLeft!.reset();
      _controllerBottomLeft!.reset();
      _controllerBottomRight!.reset();

      _controllerTopLeft!.forward();
      _controllerTopRight!.forward();
    });
  }

  Row bottom(double widthX) {
    return Row(
      children: [
        Container(
          width: (widthX - 40) / 2,
          height: border_width,
          color: Colors.yellow,
          child: progressBar(0, progressAnimationBottomLeft!),
        ),
        Container(
          width: (widthX - 40) / 2,
          height: border_width,
          color: Colors.red,
          child: progressBar(2, progressAnimationBottomRight!),
        ),
      ],
    );
  }

  Row top(double widthX) {
    return Row(
      children: [
        Container(
          width: (widthX - 40) / 2,
          height: border_width,
          color: Colors.yellow,
          child: progressBar(2, progressAnimationTopLeft!),
        ),
        Container(
          width: (widthX - 40) / 2,
          height: border_width,
          color: Colors.red,
          child: progressBar(0, progressAnimationTopRight!),
        ),
      ],
    );
  }

  Container right(double heightX) {
    return Container(
      width: border_width,
      height: heightX,
      color: Colors.amberAccent,
      child: progressBar(-3, progressAnimationRight!),
    );
  }

  Container left(double heightX) {
    return Container(
      width: border_width,
      height: heightX,
      color: Colors.amberAccent,
      child: progressBar(-3, progressAnimationLeft!),
    );
  }

  AnimatedBuilder progressBar(int turn, Animation progressAnimation) {
    return AnimatedBuilder(
      animation: progressAnimation,
      builder: (BuildContext context, Widget? child) {
        return RotatedBox(
          quarterTurns: turn,
          child: LinearProgressIndicator(
            minHeight: 20,
            backgroundColor: Colors.pink.shade500,
            color: Colors.red,
            value: progressAnimation.value,
            valueColor: AlwaysStoppedAnimation(Colors.white),
          ),
        );
      },
    );
  }

  void initalize() {
    final divider4 = Duration(microseconds: 4);
    final divider8 = Duration(microseconds: 8);
    _controllerRight = AnimationController(
        vsync: this,
        duration: Duration(
            microseconds: (widget.duration.inMicroseconds / 4).round()));
    progressTweenRight = Tween(begin: 0, end: 1);
    progressAnimationRight = progressTweenRight!.animate(_controllerRight!);
    //
    _controllerLeft = AnimationController(
        vsync: this,
        duration: Duration(
            microseconds: (widget.duration.inMicroseconds / 4).round()));
    progressTweenLeft = Tween(begin: 0, end: 1);
    progressAnimationLeft = progressTweenLeft!.animate(_controllerLeft!);
    //
    _controllerTopLeft = AnimationController(
        vsync: this,
        duration: Duration(
            microseconds: (widget.duration.inMicroseconds / 8).round()));
    progressTweenTopLeft = Tween(begin: 0, end: 1);
    progressAnimationTopLeft =
        progressTweenTopLeft!.animate(_controllerTopLeft!);
    //

    _controllerTopRight = AnimationController(
        vsync: this,
        duration: Duration(
            microseconds: (widget.duration.inMicroseconds / 8).round()));
    progressTweenTopRigth = Tween(begin: 0, end: 1);
    progressAnimationTopRight =
        progressTweenTopRigth!.animate(_controllerTopRight!);
    //bottom left
    _controllerBottomLeft = AnimationController(
        vsync: this,
        duration: Duration(
            microseconds: (widget.duration.inMicroseconds / 8).round()));
    progressTweenBottomLeft = Tween(begin: 0, end: 1);
    progressAnimationBottomLeft =
        progressTweenBottomLeft!.animate(_controllerBottomLeft!);
//bottom right
    _controllerBottomRight = AnimationController(
        vsync: this,
        duration: Duration(
            microseconds: (widget.duration.inMicroseconds / 8).round()));
    progressTweenBottomRight = Tween(begin: 0, end: 1);
    progressAnimationBottomRight =
        progressTweenBottomRight!.animate(_controllerBottomRight!);
  }

  void showNextSuggestion() {
    setState(() {
      print("Next Suggestion");
      ++index;
      performAnimation();
    });
  }
}
