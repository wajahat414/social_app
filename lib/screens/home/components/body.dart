import 'package:flutter/material.dart';

import '../../../models/post_list.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        bottomOpacity: 0.0,
        bottom: const PreferredSize(
            preferredSize: Size(10, 20), child: Text("ssss")),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: (() {
                Navigator.pushNamed(context, '/notification');
              }),
              icon: Icon(
                Icons.notifications_outlined,
                color: Colors.black87,
              )),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
            child: const CircleAvatar(
              child: Text("W"),
            ),
          )
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: const [
                Text(
                  "Randomly",
                  style: TextStyle(color: Colors.black, fontSize: 30),
                ),
              ],
            ),
          ],
        ),
      ),
      body: ListView(children: postList),
    );
  }
}
