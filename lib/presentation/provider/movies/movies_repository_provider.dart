import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/infrastructure/datasources/the_moviedb_datasource.dart';
import 'package:movies_app/infrastructure/repositories/movie_repository_impl.dart';

//
final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(TheMoviedbDatasource());
});
