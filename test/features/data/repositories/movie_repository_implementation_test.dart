import 'package:clean_movie_app/core/errors/excpetions.dart';
import 'package:clean_movie_app/core/errors/failures.dart';
import 'package:clean_movie_app/features/data/datasources/movie_datasource.dart';
import 'package:clean_movie_app/features/data/models/movie_model.dart';
import 'package:clean_movie_app/features/data/repositories/movie_repository_implementation.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockMovieDataSource extends Mock implements IMovieDataSource {}

void main() {
  late MovieRepositoryImplementation repository;
  late IMovieDataSource dataSource;

  setUp(() {
    dataSource = MockMovieDataSource();
    repository = MovieRepositoryImplementation(dataSource);
  });

  final tMovieModel = MovieModel(
      title: "Dilwale Dulhania Le Jayenge",
      overview:
          "Raj is a rich, carefree, happy-go-lucky second generation NRI. Simran is the daughter of Chaudhary Baldev Singh, who in spite of being an NRI is very strict about adherence to Indian values. Simran has left for India to be married to her childhood fiancé. Raj leaves for India with a mission at his hands, to claim his lady love under the noses of her whole family. Thus begins a saga.",
      voteAverage: 8.7);

  test('should return movie model when calls the datasource', () async {
    when(dataSource).calls(#getMovies).thenAnswer((_) async => tMovieModel);

    final result = await repository.getMovies();

    expect(result, Right(tMovieModel));

    verify(dataSource).called(#getMovies).once();
  });

  test('should return a server failure when call the datasource', () async {
    when(dataSource).calls(#getMovies).thenThrow(ServerException());

    final result = await repository.getMovies();

    expect(result, Left(ServerFailure()));
    verify(dataSource).called(#getMovies).once();
  });
}
