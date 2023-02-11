import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class IsolateTest extends StatefulWidget {
  const IsolateTest({super.key});

  @override
  State<IsolateTest> createState() => _IsolateTestState();
}

class _IsolateTestState extends State<IsolateTest> {
  int _count = 0;

  @override
  void initState() {
    Isolate.spawn(isolateFunction, 10000000000);

    // Isolate.spawn(runInfinite, 10000);
    super.initState();
  }

  static isolateFunction(int finalNum) async {
    int _count = 0;
    for (int i = 0; i < finalNum; i++) {
      _count++;

      if (_count % 100 == 0) {
        print('isolate $_count');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Code'),
      ),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            Text(_count.toString()),
            TextButton(
              child: const Text("Add"),
              onPressed: () async {
                _count++;
                print(_count);
                setState(() {});
              },
            ),
          ])),
    );
  }
}
