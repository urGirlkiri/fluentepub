import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:path/path.dart' as path;

class CoverPicker extends StatefulWidget {
  const CoverPicker({
    super.key,
    required this.width,
    required this.height,
    this.selectedCoverPath,
    this.selectedCoverBytes,
    required this.onPick,
  });

  final double width;
  final double height;
  final String? selectedCoverPath;
  final Uint8List? selectedCoverBytes;
  final VoidCallback onPick;

  @override
  State<CoverPicker> createState() => _CoverPickerState();
}

class _CoverPickerState extends State<CoverPicker> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final hasCover = widget.selectedCoverPath != null;
    final label = hasCover ? 'Change cover image' : 'Upload cover image';
    final caption = widget.selectedCoverPath != null
        ? path.basename(widget.selectedCoverPath!)
        : 'Supported formats: PNG, JPG, JPEG';

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: GestureDetector(
        onTap: widget.onPick,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: _isHovering
                  ? theme.colorScheme.primary
                  : theme.colorScheme.onSurface.withValues(alpha: 0.14),
              width: _isHovering ? 2 : 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: _isHovering ? 0.15 : 0.08),
                blurRadius: _isHovering ? 16 : 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Stack(
              children: [
                if (widget.selectedCoverBytes != null)
                  Positioned.fill(
                    child: Image.memory(
                      widget.selectedCoverBytes!,
                      fit: BoxFit.cover,
                    ),
                  )
                else
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          LucideIcons.imagePlus,
                          size: 52,
                          color: theme.colorScheme.primary,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          label,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: theme.colorScheme.onSurface,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          caption,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            color: theme.colorScheme.onSurface.withValues(alpha: 0.65),
                          ),
                        ),
                      ],
                    ),
                  ),
                if (hasCover)
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withValues(alpha: 0.0),
                            Colors.black.withValues(alpha: 0.65),
                          ],
                        ),
                      ),
                      child: Text(
                        caption,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
