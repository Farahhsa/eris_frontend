import 'package:flutter/material.dart';

class MySearch extends SearchDelegate {
  List<String> suggestions = [
    'calm',
    'gelata',
    'hero',
    'musk',
  ];

  @override
  Widget? buildLeading(BuildContext context) =>
      IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back));

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
            }
          },
          icon: const Icon(Icons.clear),
        )
      ];

  @override
  Widget buildResults(BuildContext context) => Center(
        child: Text(
          query,
          style: const TextStyle(fontSize: 64),
        ),
      );

  @override
  Widget buildSuggestions(BuildContext context) {
    // List<String> suggestions = searchResults.where((searchResult) {
    //   final result = searchResult.toLowerCase();
    //   final input = searchResult.toLowerCase();
    //   return result.contains(input);
    // }).toList();
    return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          final suggestion = suggestions[index];

          return ListTile(
            title: Text(suggestion),
            onTap: () {
              query = suggestion;
              showResults(context);
            },
          );
        });
  }
}
