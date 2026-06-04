import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:fluentepub/config/theme/palette.dart';
import 'package:fluentepub/features/home/widgets/bottom_nav.dart';
import 'package:fluentepub/features/home/widgets/new_document/index.dart';
import 'package:fluentepub/features/home/widgets/recent_docs/index.dart';
import 'package:fluentepub/widgets/edrawer.dart';
import 'package:fluentepub/widgets/edrawer_button.dart';
import 'package:fluentepub/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class HomeScreen extends StatelessWidget {
  static Palette palette = Palette();
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    bool isDarkMode = theme.brightness == Brightness.dark;

    return Scaffold(
      drawer: EDrawer(),
      appBar: AppBar(
        leading: EDrawerButton(),
        title: Row(
          children: [
            Logo(size: 48),
            const SizedBox(width: 12),
            const Text('Fluent Epub'),
            const SizedBox(width: 8),
            Expanded(
              child: Center(
                child: SizedBox(
                  height: 50,
                  width: 600,
                  child: const SearchBar(),
                ),
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                const Icon(LucideIcons.layoutGrid, size: 32),
                const SizedBox(width: 12),
                const Icon(LucideIcons.layoutList, size: 32),
                const SizedBox(width: 12),
                IconButton(
                  icon: Icon(
                    isDarkMode ? LucideIcons.sun : LucideIcons.moon,
                    size: 28,
                    color: !isDarkMode
                        ? palette.yaleBlue
                        : Colors.amberAccent,
                  ),
                  onPressed: () {
                    AdaptiveTheme.of(context).toggleThemeMode();
                  },
                ),
              ],
            ),
          ),
        ],
        toolbarHeight: 100.0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: NewDocument()),
            const SliverToBoxAdapter(child: SizedBox(height: 40)),
            const RecentDocuments(),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNav()
    );
  }
}
