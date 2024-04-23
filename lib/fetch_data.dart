import 'dart:convert';
import 'Anime.dart'; // Ensure this matches the filename and class name
import 'package:http/http.dart' as http;

Future<List<Anime>> fetchAnimes() async {
  try {
    final response = await http.get(Uri.parse(
        'https://consument-api-dreuzzz.vercel.app/anime/gogoanime/popular'));
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      List<dynamic> results =
          jsonResponse['results']; // Access the nested "results" array
      return results.map((data) => Anime.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load anime list');
    }
  } catch (e) {
    print(e.toString());
    return [];
  }
}
