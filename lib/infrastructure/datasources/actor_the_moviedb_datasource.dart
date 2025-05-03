import 'package:dio/dio.dart';
import 'package:movies_app/domain/datasources/actors_datasource.dart';
import 'package:movies_app/domain/entitites/actor.dart';
import 'package:movies_app/infrastructure/mappers/actor_mapper.dart';
import 'package:movies_app/infrastructure/models/the_moviedb/credits_response.dart';

class ActorTheMoviedbDatasource extends ActorsDatasource {
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
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    final response = await dio.get("/movie/$movieId/credits");

    final castResponse = CreditsResponse.fromJson(response.data);

    List<Actor> actors =
        castResponse.cast
            .map((cast) => ActorMapper.castToEntity(cast))
            .toList();

    return actors;
  }
}
