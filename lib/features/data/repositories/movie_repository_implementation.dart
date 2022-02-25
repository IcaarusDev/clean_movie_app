import 'package:clean_movie_app/core/errors/exceptions.dart';
import 'package:clean_movie_app/core/errors/failures.dart';
import 'package:clean_movie_app/features/data/datasources/movie_datasource.dart';
import 'package:clean_movie_app/features/domain/entities/movies_entity.dart';
import 'package:clean_movie_app/features/domain/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';

class MovieRepositoryImplementation implements IMovieRepository {
  final IMovieDataSource dataSource;

  MovieRepositoryImplementation(this.dataSource);

  @override
  Future<Either<Failure, MovieEntity>> getMovies(DateTime date) async {
    try {
      final result = await dataSource.getMovies(date);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
