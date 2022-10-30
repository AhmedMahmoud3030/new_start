import 'package:flutter/material.dart';
import 'package:new_start/features/movie/data/datasources/remote_movie_data_source.dart';
import 'package:new_start/features/movie/data/repositories/movie_repository.dart';
import 'package:new_start/features/movie/domain/repositories/base_movie_repository.dart';
import 'package:new_start/features/movie/domain/usecases/ge_now_playing_movies.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  _MovieScreenState createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    BaseMovieRemoteDataSource baseMovieRemoteDataSource =
        MovieRemoteDataSource();
    BaseMovieRepository baseMovieRepository =
        MovieRepository(baseMovieRemoteDataSource);
    final result =
        await GetNowPlayingMoviesUseCase(baseMovieRepository).execute();
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('data'),
      ),
    );
  }
}
