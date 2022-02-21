import 'package:clean_movie_app/core/usecase/errors/failures.dart';
import 'package:clean_movie_app/core/usecase/usecase.dart';
import 'package:clean_movie_app/features/domain/entities/movies_entity.dart';
import 'package:clean_movie_app/features/domain/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';

class GetMoviesUseCase implements Usecase<MovieEntity, NoParams> {
  final IMovieRepository repository;

  GetMoviesUseCase(this.repository);

  @override
  Future<Either<Failure, MovieEntity>> call(NoParams params) async {
    return await repository.getMovies();
  }
}
