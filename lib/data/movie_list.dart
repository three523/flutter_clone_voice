import 'dart:convert';

import 'package:kkobook_test_app/data/movie.dart';

class MovieList {
  final List<Movie> movies;

  MovieList(this.movies);

  factory MovieList.fromJson(String jsonString) {
    List<dynamic> dynamicList = json.decode(jsonString);
    List<Movie> movies =
        dynamicList.map<Movie>((movie) => Movie.fromJson(movie)).toList();
    return MovieList(movies);
  }
}
