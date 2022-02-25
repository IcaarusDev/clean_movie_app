import 'dart:convert';

import 'package:clean_movie_app/core/errors/exceptions.dart';
import 'package:clean_movie_app/core/http_client/http_client.dart';
import 'package:clean_movie_app/core/utils/date_input_converter.dart';
import 'package:clean_movie_app/core/utils/keys/movie_api_keys.dart';
import 'package:clean_movie_app/features/data/datasources/api/movie_endpoints.dart';
import 'package:clean_movie_app/features/data/datasources/movie_datasource.dart';
import 'package:clean_movie_app/features/data/models/movie_model.dart';

class MovieDatasourceImplementation implements IMovieDataSource {
  final DateInputConverter converter;
  final HttpClient client;

  MovieDatasourceImplementation(
      {required this.converter, required this.client});

  @override
  Future<MovieModel> getMovies(DateTime date) async {
    final response = await client.get(MovieEndpoints.api(MovieApiKeys.apiKey));

    if (response.statusCode == 200) {
      return MovieModel.fromJson(jsonDecode(response.data));
    } else {
      throw ServerException();
    }
  }
}
