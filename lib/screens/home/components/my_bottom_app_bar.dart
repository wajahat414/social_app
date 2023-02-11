import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:social_app/constants.dart';

class myBottomAppBar extends StatefulWidget {
  myBottomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  State<myBottomAppBar> createState() => _myBottomAppBarState();
}

class _myBottomAppBarState extends State<myBottomAppBar> {
  final String assetName = 'assets/icons/pen_icon.svg';
  final String sameSugggestionAsset = 'assets/icons/same_suggestion.svg';

  Widget? svgIcon;
  Widget? sameSuggestionIcon;

  @override
  void initState() {
    // TODO: implement initState
    svgIcon = SvgPicture.asset(assetName,
        color: Colors.white, semanticsLabel: 'A red up arrow');
    sameSuggestionIcon = SvgPicture.asset(sameSugggestionAsset,
        color: Colors.white, semanticsLabel: 'A red up arrow');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      color: Theme.of(context).primaryColor,
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: dpadding + 0.0),
              child: IconButton(
                tooltip: 'home page',
                icon: const Icon(Icons.home_outlined, size: 27),
                onPressed: () {},
              ),
            ),
            Spacer(
              flex: 1,
            ),
            IconButton(
              tooltip: 'search',
              icon: const Icon(
                Icons.search_outlined,
                size: 27,
              ),
              onPressed: () {},
            ),
            const Spacer(
              flex: 3,
            ),
            IconButton(
              tooltip: 'Same Suggestion',
              icon: sameSuggestionIcon!,
              onPressed: () {
                Navigator.pushNamed(context, '/suggestion');
              },
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.only(right: dpadding + 0.0),
              child: IconButton(
                tooltip: 'Notifications',
                icon: svgIcon!,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
