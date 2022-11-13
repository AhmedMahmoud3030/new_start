import 'package:equatable/equatable.dart';
import 'package:new_start/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:new_start/core/usecase/base_usecase.dart';
import 'package:new_start/features/movie/domain/repositories/base_movie_repository.dart';

import '../entities/recommendation.dart';

class GetRecommendationUseCase
    extends BaseUseCase<List<Recommendation>, RecommendationParameters> {
  final BaseMovieRepository baseMovieRepository;

  GetRecommendationUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, List<Recommendation>>> call(
      RecommendationParameters parameters) async {
    return await baseMovieRepository.getRecommendation(parameters);
  }
}

class RecommendationParameters extends Equatable {
  final int id;

  const RecommendationParameters(this.id);

  @override
  List<Object?> get props => [id];
}
