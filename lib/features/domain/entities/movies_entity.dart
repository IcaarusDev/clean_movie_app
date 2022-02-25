import 'dart:ffi';

import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final String title;
  final String overview;

  const MovieEntity({required this.title, required this.overview});

  @override
  List<Object?> get props => [title, overview];
}
