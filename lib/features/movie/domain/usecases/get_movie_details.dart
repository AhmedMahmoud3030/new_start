import 'package:equatable/equatable.dart';
import 'package:new_start/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:new_start/core/usecase/base_usecase.dart';
import '../entities/movie_details.dart';
import '../repositories/base_movie_repository.dart';

class GetMovieDetailsUseCase
    extends BaseUseCase<MovieDetails, MovieDetailsParameters> {
  final BaseMovieRepository baseMovieRepository;
  GetMovieDetailsUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, MovieDetails>> call(
      MovieDetailsParameters parameters) async {
    return await baseMovieRepository.getMovieDetails(parameters);
  }
}

class MovieDetailsParameters extends Equatable {
  final int movieId;

  const MovieDetailsParameters(this.movieId);

  @override
  List<Object?> get props => [
        id,
      ];
}
