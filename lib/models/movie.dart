class Movie {
  String? title;
  String? original_title;
  String? backdrop_path;
  String? overview;
  String? poster_path;
  String? release_date;
  double? vote_average;

  Movie({
    required this.title,
    required this.original_title,
    required this.backdrop_path,
    required this.overview,
    required this.poster_path,
    required this.release_date,
    required this.vote_average,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'] ?? "title",
      original_title: json['original_title'],
      backdrop_path: json['backdrop_path'],
      overview: json['overview'],
      poster_path: json['poster_path'],
      release_date: json['release_date'],
      vote_average: json['vote_average'],
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'original_title': original_title,
        'backdrop_path': backdrop_path,
        'overview': overview,
        'poster_path': poster_path,
        'release_date': release_date,
        'vote_average': vote_average,
      };
}
