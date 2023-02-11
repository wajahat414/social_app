import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_app/screens/util/util.dart';

import '../../constants.dart';
import '../../non_ui_constants.dart';

class Profile extends StatelessWidget {
  Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: GoogleFonts.openSans(color: Colors.white),
        ),
      ),
      body: Container(
        color: Colors.grey.shade200,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            mainTopArea(),
            mainBottomArea(),
          ],
        ),
      ),
    );
  }

  titleArea() {
    return Row(
      children: [
        titleAreaLeft(),
        titleAreaRight(),
      ],
    );
  }

  titleAreaLeft() {
    return Expanded(
      flex: 2,
      child: Container(
          // color: Colors.green,
          color: Colors.grey.shade200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                      src2,
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: ElevatedButton(
                        onPressed: () => true,
                        child: Text(
                          "Edit Profile",
                          style: TextStyle(fontSize: 10),
                        )),
                  )
                ],
              ),
            ],
          )),
    );
  }

  titleAreaRight() {
    return Expanded(
      flex: 4,
      child: Container(
        // color: Colors.black,
        color: Colors.grey.shade200,
        padding: EdgeInsets.only(left: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            fullName(),
            const SizedBox(
              height: 3,
            ),
            address(),
            const SizedBox(
              height: 2,
            ),
            bio(),
          ],
        ),
      ),
    );
  }

  fullName() {
    return const Text.rich(
      TextSpan(
          text: "David",
          style: TextStyle(fontWeight: FontWeight.bold),
          children: [
            TextSpan(
                text: " Bruno", style: TextStyle(fontWeight: FontWeight.normal))
          ]),
    );
  }

  address() {
    return const Text(
      "San Francisco, CA",
      style: TextStyle(color: Colors.black54),
    );
  }

  bio() {
    return Text(
      "An Artist, love music, traveling, cooking, folowing the dreams of my own",
      style: GoogleFonts.aBeeZee(color: Colors.black45),
    );
  }

  followSection() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          twoRowsOfText("109", "Posts"),
          twoRowsOfText("1.5M", "Followers"),
          twoRowsOfText("71", "Following"),
        ],
      ),
    );
  }

  twoRowsOfText(String text1, String text2) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          text1,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          text2,
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }

  grid3x3() {
    return Column(
      children: [
        Expanded(
            child: Container(
          // color: Colors.pinkAccent,
          child: row_(),
        )),
        Expanded(
            child: Container(
          // color: Colors.brown,
          child: row2_(),
        )),
        Expanded(
            child: Container(
          margin: EdgeInsets.only(bottom: 10),
          child: Image_(src1),
        )),
      ],
    );
  }

  row_() {
    return Row(
      children: [
        Expanded(
            child: Container(
          margin: EdgeInsets.only(right: 10, bottom: 10),
          child: Image_(src1),
          color: Colors.blueAccent,
        )),
        Expanded(
            child: Container(
          margin: EdgeInsets.only(right: 10, bottom: 10),
          child: Image_(src4),
          color: Colors.cyan,
        )),
        Expanded(
            child: Container(
          margin: EdgeInsets.only(bottom: 10),
          color: Colors.deepPurple,
          child: Image_(src2),
        ))
      ],
    );
  }

  row2_() {
    return Row(
      children: [
        Expanded(
            child: Container(
          color: Colors.cyan,
          margin: EdgeInsets.only(right: 10, bottom: 10),
          child: Image_(src2),
        )),
        Expanded(
          child: Container(
            color: Colors.limeAccent,
            margin: EdgeInsets.only(bottom: 10),
            child: Image_(src1),
          ),
        )
      ],
    );
  }

  mainTopArea() {
    return Expanded(
        flex: 2,
        child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.redAccent,
                      child: titleArea(),
                    )),
                Expanded(
                    flex: 1,
                    child: Container(
                      // color: Colors.amber,
                      color: Colors.grey.shade200,
                      child: followSection(),
                    )),
              ],
            )));
  }

  mainBottomArea() {
    return Expanded(
        flex: 3,
        child: Container(
          color: Colors.grey.shade200,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: grid3x3(),
        ));
  }
}
