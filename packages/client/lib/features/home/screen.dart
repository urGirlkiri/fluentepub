import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:fluentepub/config/palette.dart';
import 'package:fluentepub/features/home/widgets/sort_by.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class HomeScreen extends StatelessWidget {
  static Palette palette = Palette();
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(LucideIcons.menu, size: 40),
        title: Row(
          children: [
            Image.asset(
              isDarkMode
                  ? 'assets/branding/512x512-dark.png'
                  : 'assets/branding/512x512.png',
              width: 48,
              height: 48,
            ),
            const SizedBox(width: 12),
            const Text('Fluent Epub'),
            const SizedBox(width: 8),
            Expanded(
              child: Center(
                child: SizedBox(
                  height: 50,
                  width: 600,
                  child: TextField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.surface,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      isDense: true,
                      hintText: 'Search books...',
                      hintStyle: const TextStyle(fontSize: 14),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 12,
                      ),
                    ),
                  ),
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
                    color: !isDarkMode ? palette.yaleBlue : Colors.amberAccent,
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
      body: const Column(
        children: [
          Padding(
            padding: EdgeInsets.all(24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Sort by ',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SizedBox(width: 12),
                SortBy(),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                'Under Construction',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}