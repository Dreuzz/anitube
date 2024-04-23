class Anime {
  final String id;
  final String title;
  final String releaseDate;
  final String image;
  final String url;

  Anime(
      {required this.id,
      required this.title,
      required this.releaseDate,
      required this.image,
      required this.url});

  factory Anime.fromJson(Map<String, dynamic> json) {
    return Anime(
      id: json['id'],
      title: json['title'],
      releaseDate: json['releaseDate'],
      image: json['image'],
      url: json['url'],
    );
  }
}
