import 'package:fluentepub/config/context.dart';
import 'package:fluentepub/config/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedDoc = context.watchDoc.selectedDocument;
    final theme = context.theme;

    return selectedDoc == null
        ? const SizedBox.shrink()
        : Container(
            color: theme.colorScheme.surface,
            height: 80,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(width: 12),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Row(
                      children: [
                        Text(
                          selectedDoc.title,
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        VerticalDivider(),
                        selectedDoc.totalPages == 0
                            ? Text(
                                    'Empty',
                                    style: TextStyle(
                                      color: theme.colorScheme.primary,
                                    ),
                                  )
                            : Row(
                                children: [
                                  Text(
                                    'p.${selectedDoc.lastPage}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    '/',
                                    style: TextStyle(
                                      color: theme.colorScheme.primary,
                                    ),
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    '${selectedDoc.totalPages}',
                                    style: TextStyle(
                                      color: theme.colorScheme.primary,
                                    ),
                                  ),
                                ],
                              ),
                      ],
                    ),
                  ),

                  const Spacer(),

                  ElevatedButton(
                    onPressed: () => context.pushNamed(
                      Routes.workspace,
                      pathParameters: {'id': selectedDoc.id.toString()},
                    ),
                    child: SizedBox(
                      height: 80,
                      child: Row(
                        children: [
                          Icon(LucideIcons.bookText, size: 32),
                          SizedBox(width: 10),
                          Text('Continue Reading'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
