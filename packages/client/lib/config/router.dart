import 'package:fluentepub/features/home/screen.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static const String homeRoute = '/';
  static const String home = 'home';
}

final router = GoRouter(
  initialLocation: Routes.homeRoute,
  routes: [
    GoRoute(
      name: Routes.home,
      path: Routes.homeRoute,
      builder: (context, state) => HomeScreen(),
    ),
  ],
);
