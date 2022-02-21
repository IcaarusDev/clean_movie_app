import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final String title;
  final String overview;
  final double voteAverage;

  const MovieEntity({
    required this.title,
    required this.overview,
    required this.voteAverage,
  });

  @override
  List<Object?> get props => [title, overview, voteAverage];
}
