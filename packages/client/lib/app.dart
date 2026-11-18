import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:fluentepub/config/router/index.dart';
import 'package:fluentepub/config/theme/dark_theme.dart';
import 'package:fluentepub/config/theme/light_theme.dart';
import 'package:material_ui/material_ui.dart';

class FluentEpub extends StatelessWidget {
  const FluentEpub({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: lightTheme(),
      dark: darkTheme(),
      initial: AdaptiveThemeMode.system,
      builder: (theme, darkTheme) => MaterialApp.router(
        title: 'Fluent Epub',
        debugShowCheckedModeBanner: false,
        theme: theme,
        darkTheme: darkTheme,
        routerConfig: router,
      ),
    );
  }
}
