import 'package:clean_movie_app/features/domain/entities/movies_entity.dart';
import 'package:clean_movie_app/features/domain/entities/results_entity.dart';

class MovieModel extends MovieEntity {
  MovieModel(
      {required page,
      required results,
      required total_pages,
      required total_results})
      : super(
            page: page,
            results: results,
            total_pages: total_pages,
            total_results: total_results);

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
      page: json['page'],
      results: List.from(json['results'])
          .map((e) => ResultsEntity.fromJson(e))
          .toList(),
      total_pages: json['total_pages'],
      total_results: json['total_results']);

  Map<String, dynamic> toJson() => {};
}
