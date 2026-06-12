import 'package:fluentepub/features/cloud_sync/screen.dart';
import 'package:fluentepub/features/help_feedback/screen.dart';
import 'package:fluentepub/features/home/screen.dart';
import 'package:fluentepub/features/new/blank/screen.dart';
import 'package:fluentepub/features/settings/screen.dart';
import 'package:fluentepub/features/splash/screen.dart';
import 'package:fluentepub/features/workspace/screen.dart';
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

  static const String settingsRoute = '/settings';
  static const String settings = 'settings';

  static const String cloudSyncRoute = '/cloud';
  static const String cloudSync = 'cloudSync';

  static const String helpFeedbackRoute = '/help';
  static const String helpFeedback = 'helpFeedback';
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
      builder: (context, state) => const HomeScreen(),
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
      builder: (context, state) => const NewBlankDocument(),
    ),

    GoRoute(
      name: Routes.settings,
      path: Routes.settingsRoute,
      builder: (context, state) => const SettingsScreen(),
    ),

    GoRoute(
      name: Routes.cloudSync,
      path: Routes.cloudSyncRoute,
      builder: (context, state) => const CloudSyncScreen(),
    ),

    GoRoute(
      name: Routes.helpFeedback,
      path: Routes.helpFeedbackRoute,
      builder: (context, state) => const HelpFeedbackScreen(),
    ),
  ],
);
