import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Notifications'),
        ),
        body: ListView.builder(
            itemCount: notifiCationList.length,
            itemBuilder: ((context, index) =>
                tile_notification(index, context))));
  }

  ListTile tile_notification(int index, BuildContext context) => ListTile(
      tileColor: index % 2 != 0
          ? Theme.of(context).primaryColor.withOpacity(0.3)
          : Colors.white,
      minVerticalPadding: 5,
      leading: CircleAvatar(
        radius: 30,
        backgroundColor: Theme.of(context).primaryColor,
        child: Text(
          "${notifiCationList[index].from}",
          style: GoogleFonts.openSans(),
        ),
      ),
      contentPadding: EdgeInsets.symmetric(vertical: 10),
      subtitle: Text(
        "${notifiCationList[index].recievedTime.difference(DateTime.now()).inMinutes} minutes ago",
        style: GoogleFonts.openSans(
            color: Theme.of(context).primaryColor.withOpacity(0.9),
            fontSize: 12),
      ),
      title: Text("${notifiCationList[index].message}"),
      trailing: IconButton(
        icon: Icon(Icons.menu_book),
        onPressed: (() {}),
      ));
}

final notifiCationList = [
  Notification("ALi", "Post a picture of smiling",
      DateTime.now().add(Duration(minutes: 1))),
  Notification("John", "Post a picture of plant",
      DateTime.now().add(Duration(minutes: 2))),
  Notification("Bhat", "Post a picture of gardening",
      DateTime.now().add(Duration(minutes: 3))),
  Notification("Alez", "Post a picture of Running", DateTime.now()),
  Notification("Soma", "Post a picture of going to School", DateTime.now()),
  Notification("nomi", "Post a picture of smiling", DateTime.now()),
  Notification("ALi", "Post a picture of smiling", DateTime.now()),
  Notification("ALi", "Post a picture of smiling", DateTime.now()),
  Notification("ALi", "Post a picture of smiling", DateTime.now()),
  Notification("ALi", "Post a picture of smiling", DateTime.now()),
];

class Notification {
  final String from;
  final String message;
  final DateTime recievedTime;

  Notification(this.from, this.message, this.recievedTime);
}
