import 'package:clean_movie_app/core/errors/failures.dart';
import 'package:clean_movie_app/core/usecase/usecase.dart';
import 'package:clean_movie_app/features/domain/entities/movies_entity.dart';
import 'package:clean_movie_app/features/domain/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';

class GetMoviesUseCase implements Usecase<MovieEntity, DateTime> {
  final IMovieRepository repository;

  GetMoviesUseCase(this.repository);

  @override
  Future<Either<Failure, MovieEntity>> call(DateTime? date) async {
    return date != null
        ? await repository.getMovies(date)
        : Left(NullParamFailure());
  }
}
