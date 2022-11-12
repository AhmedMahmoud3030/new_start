import 'package:dartz/dartz.dart';
import 'package:new_start/core/usecase/base_usecase.dart';
import 'package:new_start/features/movie/domain/repositories/base_movie_repository.dart';

import '../../../../core/error/failure.dart';
import '../entities/movie.dart';

class GetPopularMoviesUseCase extends BaseUseCase<List<Movie>, NoParameters> {
  final BaseMovieRepository baseMovieRepository;

  GetPopularMoviesUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async {
    return await baseMovieRepository.getPopularMovies();
  }
}
