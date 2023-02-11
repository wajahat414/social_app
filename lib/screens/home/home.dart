import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:social_app/screens/find_freinds/find_friends.dart';
import 'package:social_app/screens/home/components/svg_icon.dart';
import 'package:social_app/screens/search/search_page.dart';
import 'package:social_app/screens/suggestion_page/same_suggestion.dart';

import 'components/body.dart';
import 'components/my_bottom_app_bar.dart';
import 'components/suggestion_dialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String assetPen = 'assets/icons/pen_icon.svg';
  final String sameSugggestionAsset = 'assets/icons/same_suggestion.svg';

  Widget? svgIcon;
  Widget? sameSuggestionIcon;

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static List<Widget> _widgetOptions = <Widget>[
    Body(),
    FindFriends(),
    SameSuggesTion(),
  ];

  @override
  void initState() {
    // TODO: implement initState

    svgIcon = SvgPicture.asset(assetPen,
        color: Colors.white, semanticsLabel: 'A red up arrow');
    sameSuggestionIcon = SvgPicture.asset(sameSugggestionAsset,
        color: Colors.white, semanticsLabel: 'A red u');

    Container myWidget = Container(
      width: 50,
      height: 50,
      child: SvgPicture.asset('assets/your_svg.svg'),
    );

    Icon myIcon = Icon(
      Icons.favorite,
      color: Colors.green,
      size: 50.0,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _selectedIndex != 3
          ? _widgetOptions.elementAt(_selectedIndex)
          : _widgetOptions.elementAt(0),
      bottomNavigationBar: newBottomAppBar(),
    );
  }

  Container newBottomAppBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Colors.black.withOpacity(.1),
          )
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: GNav(
            rippleColor: Colors.grey[300]!,
            hoverColor: Colors.grey[100]!,
            gap: 8,
            activeColor: Colors.black,
            iconSize: 24,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            duration: Duration(milliseconds: 400),
            tabBackgroundColor: Colors.grey[100]!,
            color: Colors.black,
            tabs: [
              GButton(
                icon: Icons.home_outlined,
                text: 'Home',
              ),
              GButton(
                icon: Icons.search_outlined,
                text: 'Search',
                onPressed: () {
                  Get.to(FindFriends());
                },
              ),
              GButton(
                icon: Icons.home_outlined,
                leading: Container(
                  width: 40,
                  height: 40,
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          _selectedIndex = 2;
                        });
                      },
                      icon: SvgPicture.asset(
                        sameSugggestionAsset,
                        color: Colors.black,
                      )),
                ),
              ),
              GButton(
                icon: Icons.home_outlined,
                leading: Container(
                  width: 40,
                  height: 40,
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          _selectedIndex = 3;
                          _dialogBuilder(context);
                        });
                      },
                      icon: SvgPicture.asset(
                        assetPen,
                        color: Colors.black,
                      )),
                ),
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              print(index);
              if (index != 3) {
                setState(() {
                  _selectedIndex = index;
                });
              }
            },
          ),
        ),
      ),
    );
  }
}

Future<void> _dialogBuilder(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return SuggestionPostDialog(context: context);
    },
  );
}
