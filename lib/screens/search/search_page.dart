import 'package:flutter/material.dart';
import 'package:social_app/screens/search/friend_list.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController _searchController = TextEditingController();
  FocusNode _searchFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          title: Container(
            padding: EdgeInsets.only(top: 40, left: 10, right: 10, bottom: 40),
            child: TextField(
              focusNode: _searchFocus,
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search ",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none),
                prefixIcon: Icon(Icons.search),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          FocusScope.of(context).requestFocus(_searchFocus);
                        },
                      )
                    : null,
              ),
            ),
          ),
        ),
        body: Container(
          color: Colors.grey[300],
          child: Column(
            children: [
              Expanded(child: FriendList()),
            ],
          ),
        ),
      ),
    );
  }
}
