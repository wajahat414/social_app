import 'package:flutter/material.dart';
import 'package:social_app/screens/util/util.dart';
import 'package:square_percent_indicater/square_percent_indicater.dart';

import '../../../animations/border_animation.dart';
import '../../../constants.dart';
import '../../../models/suggestion.dart';
import '../../../non_ui_constants.dart';
import 'suggestion_box.dart';

class SuggestionPostDialog extends StatefulWidget {
  const SuggestionPostDialog({
    super.key,
    required this.context,
  });
  final BuildContext context;
  @override
  State<SuggestionPostDialog> createState() => _SuggestionPostDialogState();
}

class _SuggestionPostDialogState extends State<SuggestionPostDialog> {
  var s1 = Suggestion("John Alia", "Post a New Picture", src1);
  var s2 = Suggestion("Emma Watson", "Post a New Picture", src2);
  var s3 = Suggestion("Wajhat", "Post a New Picture", src1);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: BorderAnimation(
        duration: Duration(seconds: 15),
      ),
      backgroundColor: Colors.red,
    );
  }
}
