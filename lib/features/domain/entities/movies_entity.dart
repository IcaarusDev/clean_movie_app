import 'package:clean_movie_app/features/data/models/movie_model.dart';
import 'package:clean_movie_app/features/domain/entities/results_entity.dart';
import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final int page;
  final List<ResultsEntity> results;
  final int total_pages;
  final int total_results;

  const MovieEntity(
      {required this.page,
      required this.total_pages,
      required this.total_results,
      required this.results});

  @override
  List<Object?> get props => [page, total_pages, total_results, results];
}
