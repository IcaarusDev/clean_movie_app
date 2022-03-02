import 'package:clean_movie_app/core/http_client/http_implementation.dart';
import 'package:clean_movie_app/features/presentation/controllers/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;

import 'core/utils/date_input_converter.dart';
import 'features/data/datasources/movie_datasource_implementation.dart';
import 'features/data/repositories/movie_repository_implementation.dart';
import 'features/domain/usecases/get_movies_usecase.dart';
import 'features/presentation/pages/home_page.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => HomeController(i())),
    Bind((i) => GetMoviesUseCase(i())),
    Bind((i) => MovieRepositoryImplementation(i())),
    Bind((i) => MovieDatasourceImplementation(converter: i(), client: i())),
    Bind((i) => HttpImplementation()),
    Bind((i) => DateInputConverter()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => HomePage()),
  ];
}
