import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:fluentepub/config/palette.dart';
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
        leading: Icon(LucideIcons.menu, size: 32),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              isDarkMode
                  ? 'assets/branding/512x512-dark.png'
                  : 'assets/branding/512x512.png',
              width: 40,
              height: 40,
            ),
            const SizedBox(width: 12),
            const Text('Fluent Epub'),
            const SizedBox(width: 8),
            Expanded(
              child: Center(
                child: Container(
                  height: 40,
                  width: 600,
                  decoration: BoxDecoration(
                    border: Border.all(color: palette.yaleBlue, width: 1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 8),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                Icon(LucideIcons.layoutGrid, size: 32),
                const SizedBox(width: 12),
                Icon(LucideIcons.layoutList, size: 32),
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
      ),
      body: const Center(child: Text('Under Construction')),
    );
  }
}
