import 'package:dio/dio.dart';

import 'package:movies_app/domain/datasources/movies_datasource.dart';
import 'package:movies_app/domain/entitites/movie.dart';
import 'package:movies_app/infrastructure/mappers/movie_mapper.dart';
import 'package:movies_app/infrastructure/models/the_moviedb/movie_details.dart';
import 'package:movies_app/infrastructure/models/the_moviedb/the_mobiedb_response.dart';

class TheMoviedbDatasource extends MoviesDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: "https://api.themoviedb.org/3",
      queryParameters: {
        "api_key": "a35ca342c161bd0a2a85e4a7b27b97c7",
        "language": "en-US",
      },
    ),
  );

  List<Movie> _jsonToMovies(Map<String, dynamic> json) {
    final theMovieDBResponse = TheMovieDbResponse.fromJson(json);

    final List<Movie> movies =
        theMovieDBResponse.results
            .where((moviedb) => moviedb.posterPath != '')
            .map((moviedb) => MovieMapper.theMovieDBToEntity(moviedb))
            .toList();

    return movies;
  }

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get(
      "/movie/now_playing",
      queryParameters: {"page": page},
    );

    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    final response = await dio.get(
      "/movie/popular",
      queryParameters: {"page": page},
    );

    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
    final response = await dio.get(
      "/movie/top_rated",
      queryParameters: {"page": page},
    );

    return _jsonToMovies(response.data);
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async {
    final response = await dio.get(
      "/movie/upcoming",
      queryParameters: {"page": page},
    );

    return _jsonToMovies(response.data);
  }

  @override
  Future<Movie> getMovieById(String id) async {
    final response = await dio.get("/movie/$id");
    if (response.statusCode != 200) {
      throw Exception("The movie with the ID $id not was found.");
    }

    final movieDetails = MovieDetails.fromJson(response.data);
    final Movie movie = MovieMapper.movieDetailsToEntity(movieDetails);
    return movie;
  }

  @override
  Future<List<Movie>> searchMovies(String query) async {
    final response = await dio.get(
      "/search/movie",
      queryParameters: {"query": query},
    );

    return _jsonToMovies(response.data);
  }
}
