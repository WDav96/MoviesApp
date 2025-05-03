import 'package:movies_app/infrastructure/datasources/actor_the_moviedb_datasource.dart';
import 'package:movies_app/infrastructure/repositories/actor_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorsRepositoryProvider = Provider((ref) {
  return ActorRepositoryImpl(ActorTheMoviedbDatasource());
});
