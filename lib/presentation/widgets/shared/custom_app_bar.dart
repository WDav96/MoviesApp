import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/presentation/delegates/search_movie_delegate.dart';
import 'package:movies_app/presentation/providers/providers.dart';

class CustomAppbar extends ConsumerWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;

    return SafeArea(
      bottom: false,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Icon(Icons.movie, color: colors.primary),

              const SizedBox(width: 5),

              Text("Movies App", style: titleStyle),

              Spacer(),

              IconButton(
                onPressed: () {
                  //final searchedMovies = ref.read(searchedMoviesProvider);
                  final searchQuery = ref.read(searchQueryProvider);

                  showSearch(
                    query: searchQuery,
                    context: context,
                    delegate: SearchMovieDelegate(
                      searchMovies:
                          ref
                              .read(searchedMoviesProvider.notifier)
                              .searchMoviesByQuery,
                    ),
                  ).then((movie) {
                    if (movie == null) return;
                    context.push("/movie/${movie.id}");
                  });
                },
                icon: Icon(Icons.search),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
