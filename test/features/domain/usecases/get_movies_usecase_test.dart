import 'package:clean_movie_app/core/usecase/errors/failures.dart';
import 'package:clean_movie_app/core/usecase/usecase.dart';
import 'package:clean_movie_app/features/domain/entities/movies_entity.dart';
import 'package:clean_movie_app/features/domain/usecases/get_movies_usecase.dart';
import 'package:clean_movie_app/features/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MovieRepositoryMock extends Mock implements IMovieRepository {}

void main() {
  late GetMoviesUseCase usecase;
  late IMovieRepository repository;

  setUp(() {
    repository = MovieRepositoryMock();
    usecase = GetMoviesUseCase(repository);
  });

  final tNoParams = NoParams();

  const tMovie = MovieEntity(
      title: "Dilwale Dulhania Le Jayenge",
      overview:
          "Raj is a rich, carefree, happy-go-lucky second generation NRI. Simran is the daughter of Chaudhary Baldev Singh, who in spite of being an NRI is very strict about adherence to Indian values. Simran has left for India to be married to her childhood fiancé. Raj leaves for India with a mission at his hands, to claim his lady love under the noses of her whole family. Thus begins a saga.",
      voteAverage: 8.7);

  test('should get movie entity from the repository', () async {
    when(repository)
        .calls(#getMovies)
        .thenAnswer((_) async => Right<Failure, MovieEntity>(tMovie));

    final result = await usecase.call(tNoParams);
    expect(result, Right(tMovie));
    verify(repository);
  });

  test('should return a ServerFailure when don\'t get response', () async {
    when(repository)
        .calls(#getMovies)
        .thenAnswer((_) async => Left<Failure, MovieEntity>(ServerFailure()));

    final result = await usecase.call(tNoParams);
    expect(result, Left(ServerFailure()));
    verify(repository);
  });
}
