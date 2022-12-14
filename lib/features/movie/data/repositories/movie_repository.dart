import 'package:dartz/dartz.dart';
import 'package:new_start/core/error/exception.dart';
import 'package:new_start/core/error/failure.dart';
import 'package:new_start/features/movie/data/datasources/remote_movie_data_source.dart';
import 'package:new_start/features/movie/domain/entities/movie.dart';
import 'package:new_start/features/movie/domain/entities/movie_details.dart';
import 'package:new_start/features/movie/domain/entities/recommendation.dart';
import 'package:new_start/features/movie/domain/repositories/base_movie_repository.dart';
import 'package:new_start/features/movie/domain/usecases/get_movie_details.dart';
import 'package:new_start/features/movie/domain/usecases/get_recommendation.dart';

class MovieRepository extends BaseMovieRepository {
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MovieRepository(this.baseMovieRemoteDataSource);

  @override
  Future<Either<Failure, List<Movie>>> getNowPlaying() async {
    final result = await baseMovieRemoteDataSource.getNowPlayingMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(
          failure.errorMessageModel.statusMessage,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    final result = await baseMovieRemoteDataSource.getPopularMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(
          failure.errorMessageModel.statusMessage,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    final result = await baseMovieRemoteDataSource.getTopRatedMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(
          failure.errorMessageModel.statusMessage,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(
      MovieDetailsParameters parameters) async {
    final result = await baseMovieRemoteDataSource
        .getMovieDetails(MovieDetailsParameters(parameters.movieId));
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(
          failure.errorMessageModel.statusMessage,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendation(
      RecommendationParameters parameters) async {
    final result = await baseMovieRemoteDataSource
        .getRecommendationMovies(RecommendationParameters(parameters.id));
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(
          failure.errorMessageModel.statusMessage,
        ),
      );
    }
  }
}
