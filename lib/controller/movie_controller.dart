import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:kkobook_test_app/data/movie.dart';
import 'package:kkobook_test_app/data/movie_list.dart';
import 'package:logger/web.dart';

class MovieController extends GetxController {
  // final AWSbaseConnect provider = AWSbaseConnect();

  List<Movie> movies = [];
  Logger logger = Logger();

  // @override
  // void onInit() {
  //   super.onInit();
  //   fetchMoves();
  // }

  void fetchMoves() async {
    final response = await http.get(Uri.parse(
        'https://8gy76y4o3h.execute-api.ap-northeast-2.amazonaws.com/default/getMovieData'));
    if (response.statusCode == 200) {
      movies = MovieList.fromJson(response.body).movies;
      logger.t('fetch movies');
      update();
    } else {
      Logger().e('error log', error: 'test');
    }
  }
}

// class AWSbaseConnect extends GetConnect {
//   @override
//   void onInit() {
//     super.onInit();
//     baseUrl = 'https://8gy76y4o3h.execute-api.ap-northeast-2.amazonaws.com/';
//   }

//   Future<List<Movie>> fetchData() async {
//     final Response<Movie> response = await get<Movie>(
//       'default/getMovieData',
//       decoder: (moviesData) {
//         return MovieList.;
//       },
//     );
//     return Future.error({response.statusText});
//   }
// }
