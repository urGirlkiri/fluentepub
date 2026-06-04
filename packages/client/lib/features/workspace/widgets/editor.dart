import 'package:fluentepub/config/context.dart';
import 'package:flutter/material.dart';
import 'package:super_editor/super_editor.dart';

class DocEditor extends StatefulWidget {
  const DocEditor({super.key});

  @override
  State<DocEditor> createState() => _DocEditorState();
}

class _DocEditorState extends State<DocEditor> {
  late final MutableDocument _document;
  late final MutableDocumentComposer _composer;
  late final Editor _editor;

  @override
  void initState() {
    super.initState();
    _document = MutableDocument.empty();
    _composer = MutableDocumentComposer();
    
    _editor = createDefaultDocumentEditor(
      document: _document,
      composer: _composer,
    );
  }

  @override
  void dispose() {
    _editor.dispose();
    _composer.dispose();
    _document.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final textTheme = context.textTheme;

    final themeStylesheet = defaultStylesheet.copyWith(
      addRulesAfter: [
        StyleRule(
          BlockSelector.all,
          (doc, node) => {
            "textStyle": TextStyle(
              fontSize: textTheme.bodyLarge?.fontSize,
              color: colorScheme.onSurface,
            ),
          },
        ),
        StyleRule(
          BlockSelector("blockquote"),
          (doc, node) => {
            "textStyle": TextStyle(
              color: colorScheme.onSurface.withValues(alpha: 0.8),
              fontStyle: FontStyle.italic,
            ),
          },
        ),
        StyleRule(
          BlockSelector("code"),
          (doc, node) => {
            "textStyle": TextStyle(
              color: colorScheme.onSurface,
              fontFamily: 'monospace',
            ),
            "backgroundColor": colorScheme.surface.withValues(alpha: 0.3),
            "padding": const EdgeInsets.all(16.0),
          },
        ),
      ],
    );

    return SuperEditor(
      editor: _editor,
      stylesheet: themeStylesheet,
    );
  }
}