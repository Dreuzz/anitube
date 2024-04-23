import 'package:flutter/material.dart';
import 'Anime.dart';
import 'fetch_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Anime"),
          centerTitle: true,
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
                    leading: Image.network(
                      anime.image,
                      width: 70, // You can adjust the width as needed
                      height: double
                          .infinity, // Adjust the height to fit your layout
                      fit: BoxFit
                          .cover, // This ensures the image covers the space neatly
                    ),
                    title: Text(anime.title),
                    subtitle: Text(anime.releaseDate),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
