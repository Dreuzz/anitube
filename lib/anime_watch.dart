import 'package:anitube/search_anime_delegate.dart';
import 'package:flutter/material.dart';

class AnimeWatch extends StatelessWidget {
  final String url;

  const AnimeWatch({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anime Detail'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: SearchAnimeDelegate(),
              );
            },
          ),
        ],
      ),
    );
  }
}
