import 'package:fluentepub/config/theme/palette.dart';
import 'package:fluentepub/features/home/widgets/new_document/new_card.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class NewDocument extends StatelessWidget {
  static Palette palette = Palette();

  const NewDocument({super.key});

  static List<Map<String, dynamic>> templates = [
    {
      'title': 'Novel',
      'icon': LucideIcons.bookCopy,
      'gradient': const [Color(0xFF344966), Color(0xFF1F2D3E)],
    },
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

  void _showComingSoon(BuildContext context, String feature) {
    final isImport = feature.toLowerCase().contains('import');
    final tfeature = isImport ? '$feature feature' : '$feature Template';
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('$tfeature  is coming soon!')));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    bool isDarkMode = theme.brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    const NewCard(),
                    const SizedBox(height: 8),
                    const Text(
                      'Blank Document',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                const SizedBox(width: 16),

                GestureDetector(
                  onTap: () => _showComingSoon(context, 'Import Files'),
                  child: Column(
                    children: [
                      Container(
                        width: 220,
                        height: 300,
                        decoration: BoxDecoration(
                          color: isDarkMode
                              ? theme.colorScheme.onSecondary
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
                ),
                const SizedBox(width: 16),

                ...templates.map((template) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: GestureDetector(
                      onTap: () => _showComingSoon(context, template['title']),
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
                                    color: Colors.white.withValues(alpha: .85),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            template['title'],
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
