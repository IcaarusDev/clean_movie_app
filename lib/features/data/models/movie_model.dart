import 'package:clean_movie_app/features/domain/entities/movies_entity.dart';

class MovieModel extends MovieEntity {
  MovieModel({
    required String title,
    required String overview,
    required double voteAverage,
  }) : super(title: title, overview: overview, voteAverage: voteAverage);

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
      title: json['title'],
      overview: json['overview'],
      voteAverage: json['voteAverage']);

  Map<String, dynamic> toJson() =>
      {'title': title, 'overview': overview, 'voteAverage': voteAverage};
}
