import 'package:window_manager/window_manager.dart';
import 'package:anitube/pages/homepage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'fetch_data.dart';

void main() {
  runApp(const MyApp());

  windowManager.waitUntilReadyToShow().then((_) async {
    await windowManager.setAsFrameless();
  });

  if (kDebugMode) {
    print(fetchAnimes());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimeWatch(
        url: '',
      ),
    );
  }
}
