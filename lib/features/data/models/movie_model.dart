import 'package:clean_movie_app/features/domain/entities/movies_entity.dart';

class MovieModel extends MovieEntity {
  MovieModel({required String title, required String overview})
      : super(title: title, overview: overview);

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      MovieModel(title: json['title'], overview: json['overview']);

  Map<String, dynamic> toJson() => {'title': title, 'overview': overview};
}
