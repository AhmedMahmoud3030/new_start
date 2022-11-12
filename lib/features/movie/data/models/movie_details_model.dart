import 'package:new_start/features/movie/data/models/genres_model.dart';
import 'package:new_start/features/movie/domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel({
    required super.genres,
    required super.backdropPath,
    required super.title,
    required super.voteAverage,
    required super.id,
    required super.overView,
    required super.releaseDate,
    required super.runtime,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
        backdropPath: json["backdrop_path"],
        id: json["id"],
        title: json["title"],
        overView: json["overview"],
        releaseDate: json["release_date"],
        genres: List<GenresModel>.from(
          json["genres"].map(
            (x) => GenresModel.fromJson(x),
          ),
        ),
        runtime: json["runtime"],
        voteAverage: json["vote_average"].toDouble(),
      );
}
