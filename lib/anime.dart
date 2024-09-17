class Anime {
  final String id;
  final String title;
  final String releaseDate;
  final String image;

  Anime({
    required this.id,
    required this.title,
    required this.releaseDate,
    required this.image,
  });

  factory Anime.fromJson(Map<String, dynamic> json) {
    return Anime(
      id: json['id'],
      title: json['title'],
      releaseDate: json['releaseDate'],
      image: json['image'],
    );
  }
}
