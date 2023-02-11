import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_app/animations/animation_container.dart';
import 'package:social_app/animations/border_animation.dart';
import 'package:social_app/animations/controller_animation.dart';
import 'package:social_app/animations/hero_animation/hero_animation.dart';
import 'package:social_app/animations/tween_animation.dart';
import 'package:social_app/concepts/mixin_ex.dart';
import 'package:social_app/constants.dart';
import 'package:social_app/isolates/isolate_example.dart';
import 'package:social_app/screens/home/components/suggestion_dialog.dart';
import 'package:social_app/screens/home/home.dart';
import 'package:social_app/screens/login/login.dart';

import 'package:social_app/screens/notification/notification_page.dart';

import 'package:social_app/screens/profile_page/profile.dart';
import 'package:social_app/screens/search/search_page.dart';
import 'package:social_app/screens/suggestion_page/same_suggestion.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Randomly',
      theme: ThemeData(
          fontFamily: GoogleFonts.openSans.toString(),
          colorScheme: ColorScheme.fromSwatch(primarySwatch: myAppColor),
          primaryColor: const Color(kPrimaryCode),
          scaffoldBackgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      // home: BorderAnimation(),
      // home: Login(),
      home: HomePage(),

      routes: {
        '/suggestion': (context) => SameSuggesTion(),
        '/profile': (context) => Profile(),
        '/notification': (context) => const NotificationPage(),
        '/search': (context) => Search(),
      },
    );
  }
}
