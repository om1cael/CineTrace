import 'package:cinetrace/ui/home/view/home_view.dart';
import 'package:cinetrace/ui/movie/view/movie_view.dart';
import 'package:cinetrace/ui/reviews/view/review_creation_view.dart';
import 'package:go_router/go_router.dart';

final routerConfig = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (_, _) => HomeView(),
    ),
    GoRoute(
      path: '/movies/:id',
      builder: (_, state) {
        final movieId = state.pathParameters['id'];
        return MovieView(movieId: movieId);
      }
    ),
    GoRoute(
      path: '/reviews/:id',
      builder: (_, state) {
        final movieId = state.pathParameters['id'];
        return ReviewCreationView(movieId: movieId);
      }
    ),
  ]
);