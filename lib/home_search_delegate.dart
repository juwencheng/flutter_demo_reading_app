import 'package:flutter/material.dart';

class HomeSearchDelegate extends SearchDelegate<String> {
  final recents = [
    "Stranger in a Strange Land",
    "Drop of Doubt (The Ghost Bird, #5) ",
  ];
  final cities = [
    "More Than Two: A Practical Guide to Ethical Polyamory ",
    "Stranger in a Strange Land",
    "The Game Changer: A Memoir of Disruptive Love ",
    "Nonviolent Communication: A Language of Life ",
    "Sex From Scratch: Making Your Own Relationship Rules ",
    "Friends vs. Family (The Ghost Bird, #3) ",
    "First Days (The Ghost Bird, #2) ",
    "Drop of Doubt (The Ghost Bird, #5) ",
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: transitionAnimation,
        ),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, "");
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return ListView(
      children: <Widget>[
        ListTile(
          title: Text(query),
        )
      ],
    );
  }

  Widget _highlightQueryWords(String title, String query) {
    if (query.length == 0 || !title.contains(query)) {
      return ListTile(
        title: Text(
          title,
          style: TextStyle(color: Colors.grey),
        ),
        trailing: IconButton(
            icon: Icon(Icons.subdirectory_arrow_left), onPressed: () {}),
      );
    } else {
      int queryIndex = title.indexOf(query);
      return ListTile(
        title: RichText(
            text: TextSpan(children: [
          TextSpan(
              text: title.substring(0, queryIndex),
              style: TextStyle(color: Colors.grey)),
          TextSpan(
              text: title.substring(queryIndex, queryIndex + query.length),
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
          TextSpan(
              text: title.substring(queryIndex + query.length),
              style: TextStyle(color: Colors.grey))
        ])),
        trailing: IconButton(
            icon: Icon(Icons.subdirectory_arrow_left), onPressed: () {}),
      );
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    var results = query.isEmpty
        ? recents
        : cities.where((element) {
            return element.contains(query);
          });
    return ListView(
      children: results.map((title) {
        return _highlightQueryWords(title, query);
      }).toList(),
    );
  }
}
