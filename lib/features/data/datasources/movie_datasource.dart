import 'package:clean_movie_app/features/data/models/movie_model.dart';

abstract class IMovieDataSource {
  Future<MovieModel> getMovies();
}
