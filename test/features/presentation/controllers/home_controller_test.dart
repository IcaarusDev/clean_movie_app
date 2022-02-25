import 'package:clean_movie_app/core/errors/failures.dart';
import 'package:clean_movie_app/core/usecase/usecase.dart';
import 'package:clean_movie_app/features/domain/usecases/get_movies_usecase.dart';
import 'package:clean_movie_app/features/presentation/controllers/home_controller.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks/date_mock.dart';
import '../../mocks/movie_entity_mock.dart';

class MockGetMoviesUseCase extends Mock implements GetMoviesUseCase {}

void main() {
  late HomeController controller;
  late GetMoviesUseCase mockUseCase;
  late NoParams params;

  final tFailure = ServerFailure();

  setUp(() {
    mockUseCase = MockGetMoviesUseCase();
    controller = HomeController(mockUseCase);
  });

  test("should return a Movie from the useCase", () async {
    when(() => mockUseCase(any())).thenAnswer((_) async => Right(tMovie));

    await controller.getMovies(tDate);

    controller.observer(onState: (state) {
      expect(state, tMovie);
      verify(() => mockUseCase(tDate)).called(1);
    });
  });

  test("should return a Failure from the useCase when there is a error",
      () async {
    when(() => mockUseCase(any())).thenAnswer((_) async => Left(tFailure));

    await controller.getMovies(tDate);

    controller.observer(onError: (error) {
      expect(error, tFailure);
      verify(() => mockUseCase(tDate)).called(1);
    });
  });
}
