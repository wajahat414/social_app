import 'dart:async';

import 'package:flutter/material.dart';
import 'package:social_app/constants.dart';
import 'package:social_app/models/suggestion.dart';
import 'package:square_percent_indicater/square_percent_indicater.dart';

import '../../util/util.dart';

class SuggestionBox extends StatefulWidget {
  SuggestionBox(
      {super.key, required this.suggestion, this.callBack, this.indexs});
  Suggestion? suggestion;
  Function? callBack;
  int? indexs;

  @override
  State<SuggestionBox> createState() => _SuggestionBoxState();
}

class _SuggestionBoxState extends State<SuggestionBox> {
  String image_ = "";

  String suggestionText = "";

  String suggestionSource = "";

  List<Suggestion> iterator = Suggestion.list;
  int index = 0;
  int value = 0;
  Timer? timer;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(Suggestion.list);
    index = widget.indexs! % iterator.length;
    image_ = iterator[index].image;
    suggestionText = iterator[index].suggestion;
    suggestionSource = iterator[index].sourceName;

    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey),
          borderRadius: BorderRadius.circular(30)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(
                width: 0,
              ),
              Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.red,
                    backgroundImage: NetworkImage(image_),
                  ),
                  Container(
                      padding: EdgeInsets.only(top: dpadding / 1),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 3,
                                  color: Colors.black.withOpacity(0.7)))),
                      child: Text("$suggestionSource")),
                ],
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.menu_sharp))
            ],
          ),
          Text("$suggestionText"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  onPressed: () {
                    setState(() {
                      index = ++index % iterator.length;
                      print("index$index");
                      widget.callBack!();
                    });
                  },
                  child: Text("See more")),
              OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  onPressed: () {},
                  child: Text("    post    "))
            ],
          )
        ],
      ),
    );
  }
}
