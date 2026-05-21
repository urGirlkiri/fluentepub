import 'package:fluentepub/config/theme/palette.dart';
import 'package:fluentepub/widgets/progress_bar.dart';
import 'package:flutter/material.dart';

class RecentDocuments extends StatelessWidget {
  static Palette palette = Palette();

  static const List<Map<String, dynamic>> recentNovels = [
    {
      'title': 'Kai\'s Genesis',
      'author': 'Gm',
      'coverUrl': 'assets/images/kai.png',
      'progress': 12,
      'favourite': false,
    },
    {
      'title': 'Kai\'s Genesis',
      'author': 'Gm',
      'coverUrl': 'assets/images/kai.png',
      'progress': 12,
      'favourite': true,
    },
    {
      'title': 'Kai\'s Genesis',
      'author': 'Gm',
      'coverUrl': 'assets/images/kai.png',
      'progress': 12,
      'favourite': false,
    },
    {
      'title': 'Kai\'s Genesis',
      'author': 'Gm',
      'coverUrl': 'assets/images/kai.png',
      'progress': 12,
      'favourite': true,
    },
    {
      'title': 'Kai\'s Genesis',
      'author': 'Gm',
      'coverUrl': 'assets/images/kai.png',
      'progress': 12,
      'favourite': false,
    },
    {
      'title': 'Kai\'s Genesis',
      'author': 'Gm',
      'coverUrl': 'assets/images/kai.png',
      'progress': 12,
      'favourite': true,
    },
    {
      'title': 'Kai\'s Genesis',
      'author': 'Gm',
      'coverUrl': 'assets/images/kai.png',
      'progress': 12,
      'favourite': false,
    },
    {
      'title': 'Kai\'s Genesis',
      'author': 'Gm',
      'coverUrl': 'assets/images/kai.png',
      'progress': 12,
      'favourite': true,
    },
    {
      'title': 'Kai\'s Genesis',
      'author': 'Gm',
      'coverUrl': 'assets/images/kai.png',
      'progress': 12,
      'favourite': false,
    },
    {
      'title': 'Kai\'s Genesis',
      'author': 'Gm',
      'coverUrl': 'assets/images/kai.png',
      'progress': 12,
      'favourite': true,
    },
    {
      'title': 'Kai\'s Genesis',
      'author': 'Gm',
      'coverUrl': 'assets/images/kai.png',
      'progress': 12,
      'favourite': false,
    },
    {
      'title': 'Kai\'s Genesis',
      'author': 'Gm',
      'coverUrl': 'assets/images/kai.png',
      'progress': 12,
      'favourite': true,
    },
    {
      'title': 'Kai\'s Genesis',
      'author': 'Gm',
      'coverUrl': 'assets/images/kai.png',
      'progress': 12,
      'favourite': false,
    },
    {
      'title': 'Kai\'s Genesis',
      'author': 'Gm',
      'coverUrl': 'assets/images/kai.png',
      'progress': 12,
      'favourite': true,
    },
    {
      'title': 'Kai\'s Genesis',
      'author': 'Gm',
      'coverUrl': 'assets/images/kai.png',
      'progress': 12,
      'favourite': false,
    },
    {
      'title': 'Kai\'s Genesis',
      'author': 'Gm',
      'coverUrl': 'assets/images/kai.png',
      'progress': 12,
      'favourite': true,
    },
  ];

  const RecentDocuments({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SliverGrid.builder(
      itemCount: recentNovels.length,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 300,
        mainAxisExtent: 350,
        crossAxisSpacing: 14,
        mainAxisSpacing: 20,
      ),
      itemBuilder: (context, index) {
        final novel = recentNovels[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surface,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: theme.colorScheme.onSurface.withValues(
                        alpha: .1,
                      ),
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: theme.colorScheme.onSurface.withValues(
                          alpha: 0.1,
                        ),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      novel['coverUrl']!,
                      fit: BoxFit.cover,
                      cacheWidth: 300,
                      errorBuilder: (context, error, stackTrace) =>
                          const Placeholder(),
                    ),
                  ),
                ),
                if (novel['favourite'])
                    Positioned(
                      top: 4,
                      left: 4,
                      child: Icon(Icons.star, color: Colors.amber),
                    ),
                Positioned(
                  bottom: 10,
                  child: SizedBox(
                    width: 250,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: ProgressBar(percent: novel['progress']),
                    )) )
              ],
            ),
            const SizedBox(height: 8),
            Text(
              novel['title']!,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
            ),
            const SizedBox(height: 2),
            Text(
              novel['author']!,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                fontSize: 13,
              ),
            ),
          ],
        );
      },
    );
  }
}
