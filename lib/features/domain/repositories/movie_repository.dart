import 'package:clean_movie_app/core/usecase/errors/failures.dart';
import 'package:clean_movie_app/features/domain/entities/movies_entity.dart';
import 'package:dartz/dartz.dart';

abstract class IMovieRepository {
  Future<Either<Failure, MovieEntity>> getMovies();
}
