import 'dart:async';

import 'package:drift/drift.dart';
import 'package:fluentepub/config/context.dart';
import 'package:fluentepub/database/index.dart';
import 'package:logging/logging.dart' as logge;
import 'package:material_ui/material_ui.dart';
import 'package:super_editor/super_editor.dart';

class DocEditor extends StatefulWidget {
  const DocEditor({super.key, required this.documentId});

  final int documentId;

  @override
  State<DocEditor> createState() => _DocEditorState();
}

class _DocEditorState extends State<DocEditor> {
  late final MutableDocument _document;
  late final MutableDocumentComposer _composer;
  late final Editor _editor;
  Timer? _debounce;
  final logge.Logger _log = logge.Logger('DocEditor');

  @override
  void initState() {
    super.initState();
    _document = MutableDocument(
      nodes: [
        ParagraphNode(
          id: Editor.createNodeId(),
          text: AttributedText('Hello there'),
          metadata: const {'blockType': header1Attribution},
        ),
        ParagraphNode(
          id: Editor.createNodeId(),
          text: AttributedText('Start typing any MD u know'),
        ),
        ListItemNode(
          id: Editor.createNodeId(),
          text: AttributedText('For example, this is a list item'),
          itemType: ListItemType.ordered,
        ),
      ],
    );
    _composer = MutableDocumentComposer();

    _editor = createDefaultDocumentEditor(
      document: _document,
      composer: _composer,
    );

    _log.info('attaching changes listener');
    _editor.addListener(
      FunctionalEditListener((changeList) {
        if (changeList.any((edit) => edit is DocumentEdit)) {
          _debounce?.cancel();
          _debounce = Timer(const Duration(seconds: 2), () async {
            _log.info('Auto-saving change to database...');

            await (context.db.update(context.db.workings)
                  ..where((t) => t.documentId.equals(widget.documentId)))
                .write(WorkingsCompanion(lastModified: Value(DateTime.now())));
          });
        }
      }),
    );
  }

  @override
  void dispose() {
    _debounce?.cancel();
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
          const BlockSelector("blockquote"),
          (doc, node) => {
            "textStyle": TextStyle(
              color: colorScheme.onSurface.withValues(alpha: 0.8),
              fontStyle: FontStyle.italic,
            ),
          },
        ),
        StyleRule(
          const BlockSelector("code"),
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
      documentOverlayBuilders: [
        DefaultCaretOverlayBuilder(
          caretStyle: CaretStyle(
            color: colorScheme.primary,
          ),
        ),
      ],
    );
  }
}
