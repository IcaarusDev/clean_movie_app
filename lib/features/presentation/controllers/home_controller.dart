import 'package:clean_movie_app/core/errors/failures.dart';
import 'package:clean_movie_app/features/domain/entities/movies_entity.dart';
import 'package:clean_movie_app/features/domain/usecases/get_movies_usecase.dart';
import 'package:flutter_triple/flutter_triple.dart';

class HomeController extends NotifierStore<Failure, MovieEntity> {
  final GetMoviesUseCase usecase;

  HomeController(this.usecase)
      : super(const MovieEntity(
            results: [], page: 0, total_pages: 0, total_results: 0));

  getMovies(DateTime date) async {
    setLoading(true);
    final result = await usecase(date);
    result.fold((error) => setError(error), (success) => update(success));
    setLoading(false);
  }
}
