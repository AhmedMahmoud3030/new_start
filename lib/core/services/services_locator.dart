import 'package:get_it/get_it.dart';
import 'package:new_start/features/movie/data/datasources/remote_movie_data_source.dart';
import 'package:new_start/features/movie/data/repositories/movie_repository.dart';
import 'package:new_start/features/movie/domain/repositories/base_movie_repository.dart';
import 'package:new_start/features/movie/domain/usecases/ge_now_playing_movies.dart';
import 'package:new_start/features/movie/domain/usecases/ge_popular_movies.dart';
import 'package:new_start/features/movie/domain/usecases/ge_top_rated_movies.dart';
import 'package:new_start/features/movie/domain/usecases/get_movie_details.dart';
import 'package:new_start/features/movie/presentation/controller/movie_details_bloc.dart';
import 'package:new_start/features/movie/presentation/controller/movies_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    //? Bloc
    sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));
    sl.registerFactory(() => MovieDetailsBloc(sl()));
    //?UseCases
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailsUseCase(sl()));

    //?Repository
    sl.registerLazySingleton<BaseMovieRepository>(() => MovieRepository(sl()));

    //?Data Source
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
  }
}
