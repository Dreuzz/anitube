import 'package:anitube/fetch_data.dart';
import 'package:flutter/material.dart';

class SearchAnimeDelegate extends SearchDelegate<String> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    // Actions for the AppBar.
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // A leading icon on the left of the AppBar.
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Show some result based on the selection.
    return GestureDetector(
      onTap: () {
        if (query.isNotEmpty) {
          fetchAnimes();
        }
      },
      child: const Center(
        child: Text('Search for anime'),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    throw UnimplementedError();
  }
}
