import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/presentation/providers/providers.dart';
import 'package:movies_app/presentation/widgets/widgets.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();

    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final slideShowMovies = ref.watch(moviesSlideShowProvider);

    return Column(
      children: [
        CustomAppbar(),

        MoviesSlideShow(movies: slideShowMovies),

        MovieHorizontalListView(
          movies: nowPlayingMovies,
          title: "At cinema",
          subTitle: "April 12th",
        ),
      ],
    );
  }
}
