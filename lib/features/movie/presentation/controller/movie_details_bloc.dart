import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_start/core/utils/request_state.dart';
import 'package:new_start/features/movie/domain/entities/movie_details.dart';
import 'package:new_start/features/movie/domain/entities/recommendation.dart';
import 'package:new_start/features/movie/domain/usecases/get_movie_details.dart';
import 'package:new_start/features/movie/domain/usecases/get_recommendation.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(this.getMovieDetailsUseCase, this.getRecommendationUseCase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetRecommendationMoviesEvent>(_getRecommendationMovies);
  }

  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetRecommendationUseCase getRecommendationUseCase;

  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result =
        await getMovieDetailsUseCase(MovieDetailsParameters(event.id));
    result.fold(
        (l) => emit(state.copyWith(
              movieDetailsState: RequestState.error,
              movieDetailsMessage: l.message,
            )),
        (r) => emit(state.copyWith(
              movieDetailsState: RequestState.loaded,
              movieDetails: r,
            )));
  }

  FutureOr<void> _getRecommendationMovies(GetRecommendationMoviesEvent event,
      Emitter<MovieDetailsState> emit) async {
    final result =
        await getRecommendationUseCase(RecommendationParameters(event.id));
    result.fold(
        (l) => emit(state.copyWith(
            recommendationState: RequestState.error,
            recommendationMessage: l.message)),
        (r) => emit(state.copyWith(
              recommendationState: RequestState.loaded,
              recommendation: r,
            )));
  }
}
