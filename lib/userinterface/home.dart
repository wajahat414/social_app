import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:social_app/try_test/test.dart';
import 'package:social_app/userinterface/home/post.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          bottomOpacity: 0.0,
          bottom:
              PreferredSize(child: Text("ssss"), preferredSize: Size(10, 20)),
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              const Text(
                "Explore",
                style: TextStyle(color: Colors.black, fontSize: 30),
              ),
              CircleAvatar()
            ],
          ),
        ),
        body: const Body(),
        floatingActionButton: FloatingActionButton(
            onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: ((context) => Test())),
                )));
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: postList);
  }
}

final postList = [
  Post(
    Title: 'John Wick',
    subtitle: "casual",
    imageAddress:
        "https://media.istockphoto.com/id/1259095163/es/foto/empresaria-feliz-usando-m%C3%B3vil-y-port%C3%A1til-mientras-trabaja-en-casa.jpg?s=612x612&w=is&k=20&c=GsN4SkbxRa4_2vDVdWpHFrN3LWty9qfI735ntKIUlTI=",
    color: Colors.green,
  ),
  Post(
    Title: "Harry Potter",
    subtitle: "@School",
    imageAddress:
        "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80",
    color: Colors.pinkAccent,
  ),
  Post(
    Title: "Brook Las",
    subtitle: "casual",
    imageAddress:
        "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80",
    color: Colors.greenAccent,
  ),
];
