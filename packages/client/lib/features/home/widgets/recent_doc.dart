import 'package:fluentepub/config/context.dart';
import 'package:fluentepub/database/index.dart';
import 'package:fluentepub/widgets/progress_bar.dart';
import 'package:flutter/material.dart';

class RecentDocCard extends StatelessWidget {
  const RecentDocCard({super.key, required this.novel});

  final Document novel;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final selectedDoc = context.watchDoc.selectedDocument;
    final isSelected = selectedDoc?.id == novel.id;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => context.readDoc.setDocument(novel),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surface,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: theme.colorScheme.onSurface.withValues(alpha: isSelected ? 1: .1),
                      width: isSelected ? 5 : 1,
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
                      novel.coverUrl ?? 'assets/images/blank.png',
                      fit: BoxFit.cover,
                      cacheWidth: 300,
                      errorBuilder: (context, error, stackTrace) =>
                          const Placeholder(),
                    ),
                  ),
                ),
                if (novel.favourite)
                  const Positioned(
                    top: 4,
                    left: 4,
                    child: Icon(Icons.star, color: Colors.amber),
                  ),
                Positioned(
                  left: 10,
                  right: 10,
                  bottom: 10,
                  child: ProgressBar(percent: (novel.progress / 100).round()),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          novel.title,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
        ),
        const SizedBox(height: 2),
        Text(
          novel.author ?? 'Anonymous',
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: TextStyle(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
