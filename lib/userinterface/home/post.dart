// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Post extends StatefulWidget {
  String Title;
  String subtitle;
  String imageAddress;
  Color color;
  static int count = 0;

  Post({
    Key? key,
    required this.Title,
    required this.subtitle,
    required this.imageAddress,
    required this.color,
  }) : super(key: key);

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  int likes = 0;

  int shares = 0;

  int comments = 0;

  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    print(Post.count);
    return Container(
      // color: color,
      decoration: const BoxDecoration(
          border: Border(
              left: BorderSide(color: Colors.grey, width: 0.2),
              right: BorderSide(color: Colors.grey, width: 0.2),
              bottom: BorderSide(color: Colors.grey, width: 0.2))),
      height: (MediaQuery.of(context).size.height / 100) * 65,
      margin: EdgeInsets.symmetric(
          horizontal: (MediaQuery.of(context).size.width / 100) * 5),
      child: Column(
        children: [
          Expanded(
            flex: 0,
            child: Container(
              // color: Colors.amber,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: widget.color,
                ),
                title: Text(
                  widget.Title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                subtitle: Text(
                  widget.subtitle,
                  style: Theme.of(context).textTheme.caption,
                ),
                trailing: const Icon(Icons.kebab_dining_outlined),
              ),
            ),
          ),
          //Image Placement
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            child: Expanded(
              flex: 7,
              child: AspectRatio(
                aspectRatio: 4 / 5,
                child: Container(
                  child: Container(
                    padding: EdgeInsets.all(0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image(
                        image: NetworkImage(
                          widget.imageAddress,
                        ),
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
          //Post Buttons
          ,
          PostButtons(),
        ],
      ),
    );
  }

  PostButtons() {
    return Row(children: [
      PairButtonCounter(),
    ]);
  }

  PairButtonCounter() {
    return Flexible(
      child: ListTile(
        leading: IconButton(
          icon: Icon(isLiked
              ? Icons.favorite_rounded
              : Icons.favorite_border_outlined),
          onPressed: (() {
            isLiked = !isLiked;
          }),
        ),
        trailing: Icon(Icons.comment_sharp),
        title: Icon(Icons.share),
      ),
    );
  }
}
