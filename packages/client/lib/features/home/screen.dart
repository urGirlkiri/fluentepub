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
    final theme = Theme.of(context);
    bool isDarkMode = theme.brightness == Brightness.dark;

    final List<Map<String, dynamic>> templates = [
      {
        'title': 'Fiction',
        'icon': LucideIcons.bookOpen,
        'gradient': const [Color(0xFF344966), Color(0xFF1F2D3E)],
      },
      {
        'title': 'Textbook',
        'icon': LucideIcons.graduationCap,
        'gradient': const [Color(0xFF8C76C2), Color(0xFF5C4A8A)],
      },
      {
        'title': 'Poetry Anthology',
        'icon': LucideIcons.feather,
        'gradient': const [Color(0xFFA03477), Color(0xFF6B1D4F)],
      },
      {
        'title': 'Cookbook',
        'icon': LucideIcons.chefHat,
        'gradient': const [Color(0xFF1BE8C1), Color(0xFF0F947A)],
      },
      {
        'title': 'Corporate Report',
        'icon': LucideIcons.fileSpreadsheet,
        'gradient': const [Color(0xFF769CDF), Color(0xFF43629B)],
      },
    ];

    final List<Map<String, String>> recentNovels = [
      {
        'title': 'Reverend Insanity',
        'author': 'Gu Zhen Ren',
        'coverUrl': 'https://images.unsplash.com/photo-1614850523459-c2f4c699c52e?q=80&w=400&auto=format&fit=crop',
      },
      {
        'title': 'Top Tier Providence',
        'author': 'Let Me Laugh',
        'coverUrl': 'https://images.unsplash.com/photo-1541701494587-cb58502866ab?q=80&w=400&auto=format&fit=crop',
      },
      {
        'title': 'Lord of the Mysteries',
        'author': 'Cuttlefish',
        'coverUrl': 'https://images.unsplash.com/photo-1518709268805-4e9042af9f23?q=80&w=400&auto=format&fit=crop',
      },
      {
        'title': 'The Perfect Run',
        'author': 'Maxime J. Durand',
        'coverUrl': 'https://images.unsplash.com/photo-1579783900882-c0d3dad7b119?q=80&w=400&auto=format&fit=crop',
      },
      {
        'title': 'Reverend Insanity',
        'author': 'Gu Zhen Ren',
        'coverUrl': 'https://images.unsplash.com/photo-1614850523459-c2f4c699c52e?q=80&w=400&auto=format&fit=crop',
      },
      {
        'title': 'Top Tier Providence',
        'author': 'Let Me Laugh',
        'coverUrl': 'https://images.unsplash.com/photo-1541701494587-cb58502866ab?q=80&w=400&auto=format&fit=crop',
      },
      {
        'title': 'Lord of the Mysteries',
        'author': 'Cuttlefish',
        'coverUrl': 'https://images.unsplash.com/photo-1518709268805-4e9042af9f23?q=80&w=400&auto=format&fit=crop',
      },
      {
        'title': 'The Perfect Run',
        'author': 'Maxime J. Durand',
        'coverUrl': 'https://images.unsplash.com/photo-1579783900882-c0d3dad7b119?q=80&w=400&auto=format&fit=crop',
      },
    ];

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
                          color: theme.colorScheme.surface,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: theme.colorScheme.primary,
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
      body: Padding(
        padding: const EdgeInsets.only(left: 100, right: 24, top: 32),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Start afresh or import new document',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 16),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 220,
                          height: 300,
                          decoration: BoxDecoration(
                            color: isDarkMode
                                ? const Color(0xFF121214)
                                : Colors.white,
                            border: Border.all(
                              color: theme.colorScheme.primary,
                              width: .5,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            LucideIcons.plusDir,
                            size: 70,
                            color: theme.colorScheme.primary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Blank Document',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const SizedBox(width: 16),

                    Column(
                      children: [
                        Container(
                          width: 220,
                          height: 300,
                          decoration: BoxDecoration(
                            color: isDarkMode
                                ? const Color(0xFF121214)
                                : Colors.white,
                            border: Border.all(
                              color: theme.colorScheme.primary,
                              width: .5,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            LucideIcons.import,
                            size: 70,
                            color: theme.colorScheme.secondary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Import Files',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const SizedBox(width: 16),

                    ...templates.map((template) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 220,
                              height: 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: theme.colorScheme.onSurface.withValues(
                                    alpha: .1,
                                  ),
                                  width: 1,
                                ),
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: template['gradient'],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: palette.inkBlack.withValues(
                                      alpha: .15,
                                    ),
                                    blurRadius: 8,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    bottom: 24,
                                    left: 16,
                                    right: 16,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 6,
                                          width: 140,
                                          color: Colors.white24,
                                        ),
                                        const SizedBox(height: 6),
                                        Container(
                                          height: 6,
                                          width: 100,
                                          color: Colors.white12,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Center(
                                    child: Icon(
                                      template['icon'],
                                      size: 56,
                                      color: Colors.white.withValues(
                                        alpha: .85,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              template['title'],
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ),
              const SizedBox(height: 40),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Recents',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        'Sort by ',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(width: 12),
                      SortBy(),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),

              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: recentNovels.map((novel) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 220,
                            height: 300,
                            decoration: BoxDecoration(
                              color: isDarkMode ? const Color(0xFF121214) : Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: theme.colorScheme.onSurface.withValues(alpha: .1),
                                width: 1,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.1),
                                  blurRadius: 6,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                novel['coverUrl']!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          SizedBox(
                            width: 220,
                            child: Text(
                              novel['title']!,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          ),
                          const SizedBox(height: 2),
                          SizedBox(
                            width: 220,
                            child: Text(
                              novel['author']!,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}