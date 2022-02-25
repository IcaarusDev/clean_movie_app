import 'dart:convert';

import 'package:clean_movie_app/features/data/models/movie_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mocks/movie_mock.dart';

void main() {
  final tMovieModel = MovieModel(
    title: "Dilwale Dulhania Le Jayenge",
    overview:
        "Raj is a rich, carefree, happy-go-lucky second generation NRI. Simran is the daughter of Chaudhary Baldev Singh, who in spite of being an NRI is very strict about adherence to Indian values. Simran has left for India to be married to her childhood fiancé. Raj leaves for India with a mission at his hands, to claim his lady love under the noses of her whole family. Thus begins a saga.",
  );

  test('should be a subclass of MovieEntity', () {
    expect(tMovieModel, isA<MovieModel>());
  });

  test('should return a valid model', () {
    final Map<String, dynamic> jsonMap = json.decode(movieMock);

    final result = MovieModel.fromJson(jsonMap);

    expect(result, tMovieModel);
  });
}
