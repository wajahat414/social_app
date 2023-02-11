import 'package:quiver/collection.dart';

import '../non_ui_constants.dart';

class Suggestion extends DelegatingList {
  final String sourceName;
  final String suggestion;
  final String image;
  Suggestion(this.sourceName, this.suggestion, this.image) {
    list.add(this);
  }
  static List<Suggestion> list = [];
  @override
  // TODO: implement delegate
  List<Suggestion> get delegate => list;
}

void main() {}
