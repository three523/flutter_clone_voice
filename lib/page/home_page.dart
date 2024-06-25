import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kkobook_test_app/controller/movie_controller.dart';
import 'package:kkobook_test_app/data/movie.dart';
import 'package:logger/web.dart';

class HomePage extends StatelessWidget {
  HomePage() {
    Logger().t('HomePage Log');
    // Get.put(MovieController());
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<MovieController>(
          init: MovieController(),
          builder: (controller) {
            return Column(
              children: [
                ElevatedButton(
                  onPressed: controller.fetchMoves,
                  child: Text('test'),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.movies.length,
                    itemBuilder: (context, index) {
                      return movieWidget(controller.movies[index]);
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget movieWidget(Movie movie) {
    return Column(
      children: [
        Image.network(movie.poster),
        Text(movie.title),
      ],
    );
  }
}
