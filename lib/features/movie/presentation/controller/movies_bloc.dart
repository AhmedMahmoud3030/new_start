import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_start/core/utils/request_state.dart';
import 'package:new_start/features/movie/domain/usecases/ge_now_playing_movies.dart';
import 'package:new_start/features/movie/presentation/controller/movies_event.dart';
import 'package:new_start/features/movie/presentation/controller/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  MoviesBloc(this.getNowPlayingMoviesUseCase) : super(const MoviesState()) {
    on<GetNowPlayingEvent>((event, emit) async {
      final result = await getNowPlayingMoviesUseCase.execute();
      result.fold(
        (l) => emit(MoviesState(
          nowPlayingState: RequestState.error,
          nowPlayingMessage: l.message,
        )),
        (r) => emit(
          MoviesState(
            nowPlayingState: RequestState.loaded,
            nowPlayingMovies: r,
          ),
        ),
      );

      return;
    });
  }
}
