class Anime1 {
  final String referer;

  Anime1({
    required this.referer,
  });

  factory Anime1.fromJson(Map<String, dynamic> json) {
    return Anime1(
      referer: json['Referer'],
    );
  }
}

class Source {
  final String url;
  final bool isM3U8;
  final String quality;

  Source({required this.url, required this.isM3U8, required this.quality});

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      url: json['url'],
      isM3U8: json['isM3U8'],
      quality: json['quality'],
    );
  }
}

class Headers {
  final String referer;

  Headers({required this.referer});

  factory Headers.fromJson(Map<String, dynamic> json) {
    return Headers(
      referer: json['Referer'],
    );
  }
}
