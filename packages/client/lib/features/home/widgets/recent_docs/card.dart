import 'package:fluentepub/config/context.dart';
import 'package:fluentepub/config/router/routes.dart';
import 'package:fluentepub/database/models/fluent_doc.dart';
import 'package:fluentepub/features/home/widgets/recent_docs/cover.dart';
import 'package:fluentepub/features/home/widgets/recent_docs/favourite_star.dart';
import 'package:fluentepub/widgets/progress_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

class DocCard extends StatelessWidget {
  const DocCard({super.key, required this.novel});

  final FluentDoc novel;

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
            onDoubleTap: () {
              context.readDoc.setDocument(novel);
              context.goNamed(
                Routes.workspace,
                pathParameters: {'id': novel.id.toString()},
              );
            },
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surface,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: theme.colorScheme.onSurface.withValues(
                        alpha: isSelected ? 1 : .1,
                      ),
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
                    child: CoverImage(imagePath: novel.coverUrl),
                  ),
                ),
                Positioned(
                  top: 4,
                  left: 4,
                  child: FavouriteStar(
                    documentId: novel.id,
                    isFavourite: novel.favourite,
                  ),
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
