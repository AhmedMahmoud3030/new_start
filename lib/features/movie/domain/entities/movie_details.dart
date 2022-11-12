import 'package:equatable/equatable.dart';

import 'genres.dart';

class MovieDetails extends Equatable {
  final String backdropPath;
  final String title;
  final double voteAverage;
  final int id;
  final String overView;
  final String releaseDate;
  final int runtime;
  final List<Genres> genres;

  const MovieDetails({
    required this.genres,
    required this.backdropPath,
    required this.title,
    required this.voteAverage,
    required this.id,
    required this.overView,
    required this.releaseDate,
    required this.runtime,
  });

  @override
  List<Object?> get props => [
        genres,
        backdropPath,
        title,
        voteAverage,
        id,
        overView,
        releaseDate,
        runtime,
      ];
}
