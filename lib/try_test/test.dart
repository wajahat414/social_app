import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Flexible(
            child: Container(
              color: Colors.green,
            ),
          ),
          Expanded(
            child: AspectRatio(
              aspectRatio: 1.8,
              child: Container(
                color: Colors.blue,
                // child: Image(
                //   image: NetworkImage(
                //     "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80",
                //   ),
                // ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
