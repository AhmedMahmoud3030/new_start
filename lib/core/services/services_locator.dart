import 'package:get_it/get_it.dart';
import 'package:new_start/features/movie/data/datasources/remote_movie_data_source.dart';
import 'package:new_start/features/movie/data/repositories/movie_repository.dart';
import 'package:new_start/features/movie/domain/repositories/base_movie_repository.dart';
import 'package:new_start/features/movie/domain/usecases/ge_now_playing_movies.dart';
import 'package:new_start/features/movie/presentation/controller/movies_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    //? Bloc
    sl.registerFactory(() => MoviesBloc(sl()));
    //?UseCases
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));

    //?Repository
    sl.registerLazySingleton<BaseMovieRepository>(() => MovieRepository(sl()));

    //?Data Source
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
  }
}
