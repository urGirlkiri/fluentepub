import 'package:fluentepub/config/context.dart';
import 'package:fluentepub/config/router.dart';
import 'package:fluentepub/features/workspace/widgets/editor.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class WorkSpace extends StatefulWidget {
  final int documentId;

  const WorkSpace({super.key, required this.documentId});

  @override
  State<WorkSpace> createState() => _WorkSpaceState();
}

class _WorkSpaceState extends State<WorkSpace> {
  final Logger logger = Logger('WorkSpace');
  bool _isLoading = true;

  void _showComingSoon(String feature) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('$feature coming soon!')));
  }

  @override
  void initState() {
    super.initState();
    _loadDocumentFromUrl();
  }

  Future<void> _loadDocumentFromUrl() async {
    final provider = context.readDoc;

    if (provider.selectedDocument?.id != widget.documentId) {
      final docFromDb = await context.db.getFluentDocById(widget.documentId);

      provider.setDocument(docFromDb);
    }

    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final currentBook = context.watchDoc.selectedDocument!;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () => context.goNamed(Routes.home),
              child: Row(
                children: [
                  Icon(LucideIcons.squareLibrary, size: 24),
                  SizedBox(width: 12),
                  Text("Library"),
                ],
              ),
            ),
            SizedBox(width: 12),
            ElevatedButton(
              onPressed: () => _showComingSoon('Table of Contents'),
              child: Row(
                children: [
                  Icon(LucideIcons.list, size: 24),
                  SizedBox(width: 12),
                  Text("Contents"),
                ],
              ),
            ),
            SizedBox(width: 12),
            ElevatedButton(
              onPressed: () => _showComingSoon('Note Taking'),
              child: Row(
                children: [
                  Icon(LucideIcons.messageSquareText, size: 24),
                  SizedBox(width: 12),
                  Text("Notes"),
                ],
              ),
            ),
            SizedBox(width: 12),
            ElevatedButton(
              onPressed: () => _showComingSoon('Bookmarking'),
              child: Row(
                children: [
                  Icon(LucideIcons.bookmark, size: 24),
                  SizedBox(width: 12),
                  Text("Bookmarks"),
                ],
              ),
            ),
            SizedBox(width: 12),
            ElevatedButton(
              onPressed: () => _showComingSoon('Searching'),
              child: Row(children: [Icon(LucideIcons.textSearch, size: 24)]),
            ),

            const Spacer(),
            Text(
              currentBook.title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () => _showComingSoon('Voice Reader'),
              child: Row(
                children: [
                  Icon(LucideIcons.audioLines, size: 24),
                  SizedBox(width: 12),
                  Text("Read Aloud"),
                ],
              ),
            ),
            SizedBox(width: 12),
            IconButton(
              onPressed: () => _showComingSoon('Volume'),
              icon: Icon(LucideIcons.volume2, size: 24),
            ),
            SizedBox(width: 12),
            IconButton(
              onPressed: () => _showComingSoon('Full Screen'),
              icon: Icon(LucideIcons.maximize, size: 24),
            ),
            SizedBox(width: 12),
            IconButton(
              onPressed: () => _showComingSoon('Settings'),
              icon: Icon(LucideIcons.settings, size: 24),
            ),
            SizedBox(width: 12),
            VerticalDivider(),
            IconButton(
              onPressed: () => _showComingSoon('Exporting'),
              icon: Icon(LucideIcons.download, size: 24),
            ),
          ],
        ),
      ),
      body: const DocEditor(),
    );
  }
}
