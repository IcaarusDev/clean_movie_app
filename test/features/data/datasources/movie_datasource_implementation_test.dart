import 'package:clean_movie_app/core/errors/exceptions.dart';
import 'package:clean_movie_app/core/http_client/http_client.dart';
import 'package:clean_movie_app/core/utils/date_input_converter.dart';
import 'package:clean_movie_app/features/data/datasources/movie_datasource.dart';
import 'package:clean_movie_app/features/data/datasources/movie_datasource_implementation.dart';
import 'package:clean_movie_app/features/data/models/movie_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks/date_mock.dart';
import '../../mocks/movie_mock.dart';

class HttpClientMocking extends Mock implements HttpClient {}

class MockDateInputConverter extends Mock implements DateInputConverter {}

void main() {
  late IMovieDataSource datasource;
  late HttpClient http_client;
  late DateInputConverter converter;

  const urlExpected =
      "https://api.themoviedb.org/3/movie/top_rated?api_key=6035205f93f624b2a23ed8ebb5f8a075&language=en-US&page=1";

  void succeedMock() {
    when(() => http_client.get(any())).thenAnswer(
        (_) async => HttpResponse(data: movieMock, statusCode: 200));
  }

  setUp(() {
    http_client = HttpClientMocking();
    converter = MockDateInputConverter();
    datasource = MovieDatasourceImplementation(
      converter: converter,
      client: http_client,
    );
  });

  test('should call the get method with correct url', () async {
    succeedMock();

    await datasource.getMovies(tDate);

    verify(() => http_client.get(urlExpected)).called(1);
  });

  test('should return a MovieModel when is succeed', () async {
    succeedMock();

    final tMovieModelExpected = MovieModel(
        title: "Dilwale Dulhania Le Jayenge",
        overview:
            "Raj is a rich, carefree, happy-go-lucky second generation NRI. Simran is the daughter of Chaudhary Baldev Singh, who in spite of being an NRI is very strict about adherence to Indian values. Simran has left for India to be married to her childhood fiancé. Raj leaves for India with a mission at his hands, to claim his lady love under the noses of her whole family. Thus begins a saga.");

    final result = await datasource.getMovies(tDate);

    expect(result, tMovieModelExpected);
  });

  test('should throw a ServerException when the call is unsuccessful',
      () async {
    when(() => http_client.get(any())).thenAnswer((_) async =>
        HttpResponse(data: 'something went wrong!', statusCode: 400));

    final result = datasource.getMovies(tDate);

    expect(() => result, throwsA(ServerException()));
  });
}
