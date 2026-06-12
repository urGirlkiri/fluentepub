import 'package:fluentepub/config/providers/document.dart';
import 'package:fluentepub/config/theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fluentepub/database/index.dart';

final AppDatabase ogDb = AppDatabase();

extension ContextData on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;

  ColorScheme get colorScheme => theme.colorScheme;

  Palette get palette => const Palette();

  bool get isDarkMode => theme.brightness == Brightness.dark;

  DocumentProvider get watchDoc => watch<DocumentProvider>();
  DocumentProvider get readDoc => read<DocumentProvider>();

  String get searchQuery =>
      select<DocumentProvider, String>((p) => p.searchQuery);
  AppDatabase get db => ogDb;
}
