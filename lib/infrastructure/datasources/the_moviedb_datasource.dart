import 'package:dio/dio.dart';

import 'package:movies_app/domain/datasources/movie_datasource.dart';
import 'package:movies_app/domain/entitites/movie.dart';
import 'package:movies_app/infrastructure/mappers/movie_mapper.dart';
import 'package:movies_app/infrastructure/models/the_moviedb/the_mobiedb_response.dart';

class TheMoviedbDatasource extends MovieDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: "https://api.themoviedb.org/3",
      queryParameters: {
        "api_key": "a35ca342c161bd0a2a85e4a7b27b97c7",
        "language": "en-US",
      },
    ),
  );

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get("/movie/now_playing");

    final theMovieDBResponse = TheMovieDbResponse.fromJson(response.data);

    return theMovieDBResponse.results
        .map((movie) => MovieMapper.theMovieDBToEntity(movie))
        .toList();
  }
}
