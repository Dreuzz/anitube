// ignore_for_file: prefer_const_constructors

import 'package:anitube/anime.dart';
import 'package:anitube/fetch_data.dart';
import 'package:anitube/pages/animeplayer.dart';
import 'package:flutter/material.dart';

class AnimeWatch extends StatefulWidget {
  final String url;

  const AnimeWatch({super.key, required this.url});

  @override
  State<AnimeWatch> createState() => _AnimeWatchState();
}

class _AnimeWatchState extends State<AnimeWatch> {
  // ignore: non_constant_identifier_names
  _FetchData() async {}

  @override
  void initState() {
    super.initState();

    _FetchData();
  }

  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'Go to the next page',
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.deepPurple[400],
        centerTitle: true,
        title: const Text('Anitube'),
        elevation: 50,
      ),
      body: FutureBuilder<List<Anime>>(
        future: fetchAnimes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index) {
                var anime = snapshot.data![index];
                return ListTile(
                  tileColor: Colors.deepPurpleAccent[100],
                  hoverColor: const Color.fromARGB(88, 193, 187, 199),
                  leading: Image.network(
                    anime.image,
                    fit: BoxFit.cover,
                  ),
                  title: Text(anime.title),
                  subtitle: Text(anime.releaseDate),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Player(
                            title: anime.title,
                            image: anime.image,
                            subtitle: anime.releaseDate),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
