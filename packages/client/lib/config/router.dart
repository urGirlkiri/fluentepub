import 'package:fluentepub/features/home/screen.dart';
import 'package:fluentepub/features/new/blank_screen.dart';
import 'package:fluentepub/features/splash/screen.dart';
import 'package:fluentepub/features/workspace.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static const String splashRoute = '/splash';
  static const String splash = 'splash';

  static const String homeRoute = '/';
  static const String home = 'home';

  static const String newBlankDocRoute = '/new';
  static const String newBlankDoc = 'new';

  static const String workspaceRoute = '/workspace:id';
  static const String workspace = 'workspace';
}

final router = GoRouter(
  initialLocation: Routes.splashRoute,
  routes: [
    GoRoute(
      name: Routes.splash,
      path: Routes.splashRoute,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      name: Routes.home,
      path: Routes.homeRoute,
      builder: (context, state) => HomeScreen(),
    ),

    GoRoute(
      name: Routes.workspace,
      path: Routes.workspaceRoute,
      builder: (context, state) {
        final documentId = int.parse(state.pathParameters['id']!);

        return WorkSpace(documentId: documentId);
      },
    ),

    GoRoute(
      name: Routes.newBlankDoc,
      path: Routes.newBlankDocRoute,
      builder: (context, state) => NewBlankDocument(),
    ),
  ],
);
