import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:social_app/models/user.dart';

class FindFriends extends StatelessWidget {
  FindFriends({super.key});
  String image1 =
      "https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1160&q=80";
  String image2 =
      "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80";

  @override
  Widget build(BuildContext context) {
    userList = [
      User("Anna William", image2),
      User("John Ellia", image1),
      User("Anna William", image2),
      User("John Ellia", image1),
      User("Anna William", image2),
      User("John Ellia", image1)
    ];
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: Icon(Icons.arrow_back_rounded),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlinedButton(
                  style: IconButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  onPressed: () => {},
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text('Suggested Accounts'),
                  )),
            ),
            Column(
              children: List.generate(6, (index) => accountTile(index)),
            )
          ],
        ),
      ),
    );
  }

  Widget accountTile(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.green,
          child: Image.network(
            userList![index].image,
            fit: BoxFit.contain,
          ),
        ),
        title: Text(userList![index].name),
        trailing:
            IconButton(onPressed: () => {}, icon: Icon(Icons.add_box_rounded)),
      ),
    );
  }

  List<User>? userList;
}

class User {
  final String name;
  final String image;
  User(this.name, this.image);
}
