import 'package:fluentepub/features/home/screen.dart';
import 'package:fluentepub/features/new/blank_screen.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static const String homeRoute = '/';
  static const String home = 'home';

  static const String newBlankDocRoute = '/new';
  static const String newBlankDoc = 'new';
}

final router = GoRouter(
  initialLocation: Routes.homeRoute,
  routes: [
    GoRoute(
      name: Routes.home,
      path: Routes.homeRoute,
      builder: (context, state) => HomeScreen(),
    ),

    GoRoute(
      name: Routes.newBlankDoc,
      path: Routes.newBlankDocRoute,
      builder: (context, state) => NewBlankDocument(),
    ),
  ],
);
