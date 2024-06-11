import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:anitube/server.dart';

// Model class for Anime1 (adjust as necessary for your use case)
class Anime1 {
  final Headers headers;
  final List<Source> sources;
  final String download;

  Anime1(
      {required this.headers, required this.sources, required this.download});

  factory Anime1.fromJson(Map<String, dynamic> json) {
    var list = json['sources'] as List;
    List<Source> sourcesList = list.map((i) => Source.fromJson(i)).toList();

    return Anime1(
      headers: Headers.fromJson(json['headers']),
      sources: sourcesList,
      download: json['download'],
    );
  }

  FutureOr<dynamic>? get id => null;
}

// Fetch function
Future<List> fetchServer() async {
  try {
    final response = await http.get(Uri.https('anitube-api.vercel.app',
        '/anime/gogoanime/watch/jujutsu-kaisen-2nd-season-dub-episode-2'));
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      Anime1 anime = Anime1.fromJson(jsonResponse);
      return [anime]; // Return as a list
    } else {
      throw Exception('Failed to load anime data');
    }
  } catch (e) {
    if (kDebugMode) {
      print(e.toString());
    }
    return [];
  }
}
