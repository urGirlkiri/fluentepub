import 'package:fluentepub/config/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class NewCard extends StatefulWidget {
  const NewCard({super.key});

  @override
  State<NewCard> createState() => _NewCardState();
}

class _NewCardState extends State<NewCard> {
  bool _isHovered = false;
  bool _isClicked = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final backgroundColor = _isClicked
        ? theme.colorScheme.surface
        : _isHovered
        ? theme.colorScheme.secondary
        : theme.colorScheme.surface;

    final accentColor = _isClicked
        ? theme.colorScheme.onSurface
        : theme.colorScheme.primary;

    return GestureDetector(
      onTap: () => setState(() {
        _isClicked = true;
        context.pushNamed(Routes.newBlankDoc);
      }),
      child: MouseRegion(
        onEnter: (event) {
          setState(() {
            _isHovered = true;
          });
        },
        onExit: (event) {
          setState(() {
            _isHovered = false;
          });
        },
        cursor: SystemMouseCursors.click,
        child: Container(
          width: 220,
          height: 300,
          decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(color: accentColor, width: .5),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(LucideIcons.plusDir, size: 70, color: accentColor),
        ),
      ),
    );
  }
}
