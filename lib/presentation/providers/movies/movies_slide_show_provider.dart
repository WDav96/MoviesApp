import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/domain/entitites/movie.dart';

import 'package:movies_app/presentation/providers/movies/movies_provider.dart';

final moviesSlideShowProvider = Provider<List<Movie>>((ref) {
  final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);

  if (nowPlayingMovies.isEmpty) return [];

  return nowPlayingMovies.sublist(0, 6);
});
