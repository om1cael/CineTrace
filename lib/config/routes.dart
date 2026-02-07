import 'package:cinetrace/ui/home/view/home_view.dart';
import 'package:go_router/go_router.dart';

final routerConfig = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (_, _) => HomeView(),
    ),
  ]
);