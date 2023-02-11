import 'dart:async';

import 'package:flutter/material.dart';
import 'package:square_percent_indicater/square_percent_indicater.dart';

class SquarePercentIndic extends StatefulWidget {
  @override
  _SquarePercentIndicState createState() => _SquarePercentIndicState();
}

class _SquarePercentIndicState extends State<SquarePercentIndic> {
  int value = 0;
  Timer? timer;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(milliseconds: 20), (Timer t) {
      setState(() {
        value = (value + 1) % 100;
        print(value);
        if (value == 99) {
          timer!.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SquarePercentIndicator(
          width: 140,
          height: 140,
          // startAngle: StartAngle.bottomRight,
          reverse: true,
          borderRadius: 12,
          shadowWidth: 1.5,
          progressWidth: 4,
          startAngle: StartAngle.bottomRight,
          shadowColor: Colors.blue,
          progressColor: Colors.grey,
          progress: value / 100,
          child: Center(
              child: Text(
            "$value %",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          )),
        ),
      ),
    );
  }
}
