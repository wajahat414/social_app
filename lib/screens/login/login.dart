import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:social_app/try_test/test.dart';

class Login extends StatelessWidget {
  var userctrler;

  IconData? prefixIcon = Icons.person;
  Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log In'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(colors: [
                  Colors.transparent,
                  Theme.of(context).colorScheme.primary
                ])),
            height: 70,
            duration: Duration(seconds: 1),
            child: TextFormField(
              textAlignVertical: TextAlignVertical.center,
              expands: true,
              minLines: null,
              maxLines: null,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(prefixIcon),
                  hintText: 'Username',
                  hintStyle: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(fontSize: 20)),
            ),
          )
        ],
      ),
    );
  }
}
