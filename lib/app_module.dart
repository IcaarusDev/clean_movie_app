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
    Bind.factory((i) => HomeController(i())),
    Bind.lazySingleton((i) => GetMoviesUseCase(i())),
    Bind.lazySingleton((i) => MovieRepositoryImplementation(i())),
    Bind.lazySingleton(
        (i) => MovieDatasourceImplementation(converter: i(), client: i())),
    Bind.lazySingleton((i) => http.Client()),
    Bind.lazySingleton((i) => DateInputConverter()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => HomePage()),
  ];
}
