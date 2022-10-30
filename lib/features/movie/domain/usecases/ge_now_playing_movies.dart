import 'package:dartz/dartz.dart';
import 'package:new_start/features/movie/domain/repositories/base_movie_repository.dart';

import '../../../../core/error/failure.dart';
import '../entities/movie.dart';

class GetNowPlayingMoviesUseCase {
  final BaseMovieRepository baseMovieRepository;

  GetNowPlayingMoviesUseCase(this.baseMovieRepository);

  Future<Either<Failure, List<Movie>>> execute() async {
    return await baseMovieRepository.getNowPlaying();
  }
}
