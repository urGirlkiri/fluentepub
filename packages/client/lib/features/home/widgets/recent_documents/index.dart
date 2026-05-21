import 'package:fluentepub/config/palette.dart';
import 'package:fluentepub/features/home/widgets/recent_documents/sort_by.dart';
import 'package:flutter/material.dart';

class RecentDocuments extends StatelessWidget {
  static Palette palette = Palette();

  static const List<Map<String, String>> recentNovels = [
    {
      'title': 'Reverend Insanity',
      'author': 'Gu Zhen Ren',
      'coverUrl':
          'https://images.unsplash.com/photo-1614850523459-c2f4c699c52e?q=80&w=400&auto=format&fit=crop',
    },
    {
      'title': 'Top Tier Providence',
      'author': 'Let Me Laugh',
      'coverUrl':
          'https://images.unsplash.com/photo-1541701494587-cb58502866ab?q=80&w=400&auto=format&fit=crop',
    },
    {
      'title': 'Lord of the Mysteries',
      'author': 'Cuttlefish',
      'coverUrl':
          'https://images.unsplash.com/photo-1518709268805-4e9042af9f23?q=80&w=400&auto=format&fit=crop',
    },
    {
      'title': 'The Perfect Run',
      'author': 'Maxime J. Durand',
      'coverUrl':
          'https://images.unsplash.com/photo-1579783900882-c0d3dad7b119?q=80&w=400&auto=format&fit=crop',
    },
    {
      'title': 'Reverend Insanity',
      'author': 'Gu Zhen Ren',
      'coverUrl':
          'https://images.unsplash.com/photo-1614850523459-c2f4c699c52e?q=80&w=400&auto=format&fit=crop',
    },
    {
      'title': 'Top Tier Providence',
      'author': 'Let Me Laugh',
      'coverUrl':
          'https://images.unsplash.com/photo-1541701494587-cb58502866ab?q=80&w=400&auto=format&fit=crop',
    },
    {
      'title': 'Lord of the Mysteries',
      'author': 'Cuttlefish',
      'coverUrl':
          'https://images.unsplash.com/photo-1518709268805-4e9042af9f23?q=80&w=400&auto=format&fit=crop',
    },
    {
      'title': 'The Perfect Run',
      'author': 'Maxime J. Durand',
      'coverUrl':
          'https://images.unsplash.com/photo-1579783900882-c0d3dad7b119?q=80&w=400&auto=format&fit=crop',
    },
    {
      'title': 'Reverend Insanity',
      'author': 'Gu Zhen Ren',
      'coverUrl':
          'https://images.unsplash.com/photo-1614850523459-c2f4c699c52e?q=80&w=400&auto=format&fit=crop',
    },
    {
      'title': 'Top Tier Providence',
      'author': 'Let Me Laugh',
      'coverUrl':
          'https://images.unsplash.com/photo-1541701494587-cb58502866ab?q=80&w=400&auto=format&fit=crop',
    },
    {
      'title': 'Lord of the Mysteries',
      'author': 'Cuttlefish',
      'coverUrl':
          'https://images.unsplash.com/photo-1518709268805-4e9042af9f23?q=80&w=400&auto=format&fit=crop',
    },
    {
      'title': 'The Perfect Run',
      'author': 'Maxime J. Durand',
      'coverUrl':
          'https://images.unsplash.com/photo-1579783900882-c0d3dad7b119?q=80&w=400&auto=format&fit=crop',
    },
    {
      'title': 'Reverend Insanity',
      'author': 'Gu Zhen Ren',
      'coverUrl':
          'https://images.unsplash.com/photo-1614850523459-c2f4c699c52e?q=80&w=400&auto=format&fit=crop',
    },
    {
      'title': 'Top Tier Providence',
      'author': 'Let Me Laugh',
      'coverUrl':
          'https://images.unsplash.com/photo-1541701494587-cb58502866ab?q=80&w=400&auto=format&fit=crop',
    },
    {
      'title': 'Lord of the Mysteries',
      'author': 'Cuttlefish',
      'coverUrl':
          'https://images.unsplash.com/photo-1518709268805-4e9042af9f23?q=80&w=400&auto=format&fit=crop',
    },
    {
      'title': 'The Perfect Run',
      'author': 'Maxime J. Durand',
      'coverUrl':
          'https://images.unsplash.com/photo-1579783900882-c0d3dad7b119?q=80&w=400&auto=format&fit=crop',
    },
  ];

  const RecentDocuments({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    bool isDarkMode = theme.brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Recents',
              style: TextStyle(fontSize: 18),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
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
          ],
        ),
        const SizedBox(height: 16),

        Wrap(
          spacing: 14,
          runSpacing: 50,
          children: [
            ...recentNovels.map((novel) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 300,
                    height: 400,
                    decoration: BoxDecoration(
                      color: isDarkMode
                          ? const Color(0xFF121214)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: theme.colorScheme.onSurface.withValues(
                          alpha: .1,
                        ),
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
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
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
                        color: theme.colorScheme.onSurface.withValues(
                          alpha: 0.6,
                        ),
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              );
            }),
          ],
        ),
      ],
    );
  }
}
