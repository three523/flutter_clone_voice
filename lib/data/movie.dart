class Movie {
  final String title;
  final String keyword;
  final String poster;
  final bool like;

  const Movie(this.title, this.keyword, this.poster, this.like);

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(json['title'], json['keyword'], json['poster'], json['like']);
  }
}
