import 'package:fluentepub/config/context.dart';
import 'package:fluentepub/widgets/full_star.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';

class FavouriteStar extends StatefulWidget {
  const FavouriteStar({
    super.key,
    required this.documentId,
    required this.isFavourite,
  });

  final int documentId;
  final bool isFavourite;

  @override
  State<FavouriteStar> createState() => _FavouriteStarState();
}

class _FavouriteStarState extends State<FavouriteStar> {
  bool _isHovered = false;
  static const size = 35.0;

  @override
  Widget build(BuildContext context) {
    final shouldShow = widget.isFavourite || _isHovered;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () {
          context.db.toggleFavourite(widget.documentId, !widget.isFavourite);
        },
        child: AnimatedOpacity(
          opacity: shouldShow ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 200),
          child: widget.isFavourite
              ? const FullStar(size: size)
              : Icon(
                  LucideIcons.star,
                  fill: 1,
                  color: context.theme.disabledColor,
                  size: size,
                ),
        ),
      ),
    );
  }
}
