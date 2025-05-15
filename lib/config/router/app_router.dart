import 'package:go_router/go_router.dart';

import 'package:movies_app/presentation/screens/screens.dart';
import 'package:movies_app/presentation/views/views.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return HomeScreen(childView: child);
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const HomeView(),
          routes: [
            GoRoute(
              path: '/movie/:id',
              name: MovieScreen.name,
              builder: (context, state) {
                final movieId = state.pathParameters["id"] ?? "no_id";
                return MovieScreen(movieId: movieId);
              },
            ),
          ],
        ),

        GoRoute(
          path: '/favorites',
          builder: (context, state) => const FavoritesView(),
        ),
      ],
    ),

    /*GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(childView: HomeView()),
    ),

    GoRoute(
      path: '/movie/:id',
      name: MovieScreen.name,
      builder: (context, state) {
        final movieId = state.pathParameters["id"] ?? "no_id";
        return MovieScreen(movieId: movieId);
      },
    ),*/
  ],
);
