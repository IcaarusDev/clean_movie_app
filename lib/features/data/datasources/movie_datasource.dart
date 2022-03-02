import 'package:clean_movie_app/features/data/models/movie_model.dart';
import 'package:clean_movie_app/features/domain/entities/movies_entity.dart';

abstract class IMovieDataSource {
  Future<MovieEntity> getMovies(DateTime date);
}
