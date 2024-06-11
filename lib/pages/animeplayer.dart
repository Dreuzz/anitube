import 'package:anitube/fetch_server.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text('Anitube'),
        elevation: 50,
      ),
      body: FutureBuilder<List>(
          future: fetchServer(),
          builder: (context, snapshot) {
            return ListView.builder(
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index) {
                var anime = snapshot.data![index];
                return Column(
                  children: [
                    (anime.headers.referer),
                  ],
                );
              },
            );
          }),
    );
  }
}
