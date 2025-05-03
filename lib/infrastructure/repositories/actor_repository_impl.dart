import 'package:movies_app/domain/datasources/actors_datasource.dart';
import 'package:movies_app/domain/entitites/actor.dart';
import 'package:movies_app/domain/repositories/actors_repository.dart';

class ActorRepositoryImpl extends ActorsRepository {
  final ActorsDatasource datasource;

  ActorRepositoryImpl(this.datasource);

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) {
    return datasource.getActorsByMovie(movieId);
  }
}
