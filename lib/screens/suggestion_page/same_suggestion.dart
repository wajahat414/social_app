import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants.dart';
import '../../non_ui_constants.dart';
import '../util/util.dart';

class SameSuggesTion extends StatelessWidget {
  const SameSuggesTion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          shadowColor: Colors.transparent,
          bottomOpacity: 0,
          title: Text(
            "Same Suggestion",
            style: GoogleFonts.pacifico(color: Colors.black, fontSize: 30),
          ),
          centerTitle: false,
        ),
        body: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 3,
          childAspectRatio: 1 / 2,
          children: List.generate(100, (index) {
            return index % 2 == 0 ? ovalImagePair() : inverseOvalImagePair();
          }),
        ));
  }

  inverseOvalImagePair() {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(70),
              clipBehavior: Clip.hardEdge,
              child: Image_(src1),
            ),
          ),
        ),
        Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.all(10),
              color: Colors.transparent,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(70),
                  clipBehavior: Clip.hardEdge,
                  child: Image_(src4)),
            )),
      ],
    );
  }

  ovalImagePair() {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            padding: EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(70),
              clipBehavior: Clip.hardEdge,
              child: Image_(src2),
            ),
          ),
        ),
        Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(10),
              color: Colors.transparent,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(70),
                clipBehavior: Clip.hardEdge,
                child: Image_(src1),
              ),
            )),
      ],
    );
  }
}
