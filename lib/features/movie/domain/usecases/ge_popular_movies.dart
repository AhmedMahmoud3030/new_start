import 'package:dartz/dartz.dart';
import 'package:new_start/features/movie/domain/repositories/base_movie_repository.dart';

import '../../../../core/error/failure.dart';
import '../entities/movie.dart';

class GetPopularMoviesUseCase {
  final BaseMovieRepository baseMovieRepository;

  GetPopularMoviesUseCase(this.baseMovieRepository);

  Future<Either<Failure, List<Movie>>> execute() async {
    return await baseMovieRepository.getPopularMovies();
  }
}
