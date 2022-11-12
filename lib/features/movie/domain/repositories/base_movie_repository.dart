import 'package:dartz/dartz.dart';
import 'package:new_start/features/movie/domain/entities/movie.dart';
import 'package:new_start/features/movie/domain/entities/movie_details.dart';
import 'package:new_start/features/movie/domain/usecases/get_movie_details.dart';

import '../../../../core/error/failure.dart';

abstract class BaseMovieRepository {
  Future<Either<Failure, List<Movie>>> getNowPlaying();
  Future<Either<Failure, List<Movie>>> getPopularMovies();
  Future<Either<Failure, List<Movie>>> getTopRatedMovies();
  Future<Either<Failure, MovieDetails>> getMovieDetails(
      MovieDetailsParameters parameters);
}
