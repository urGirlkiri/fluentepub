import 'package:fluentepub/config/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class WorkSpace extends StatefulWidget {
  const WorkSpace({super.key});

  @override
  State<WorkSpace> createState() => _WorkSpaceState();
}

class _WorkSpaceState extends State<WorkSpace> {
  @override
  Widget build(BuildContext context) {

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
              onPressed: () => context.goNamed(Routes.home),
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
              onPressed: () => context.goNamed(Routes.home),
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
              onPressed: () => context.goNamed(Routes.home),
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
              onPressed: () => context.goNamed(Routes.home),
              child: Row(children: [Icon(LucideIcons.textSearch, size: 24)]),
            ),

            const Spacer(),
            ElevatedButton(
              onPressed: () => context.goNamed(Routes.home),
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
              onPressed: () {},
              icon: Icon(LucideIcons.volume2, size: 24),
            ),
            SizedBox(width: 12),
            IconButton(
              onPressed: () {},
              icon: Icon(LucideIcons.maximize, size: 24),
            ),
            SizedBox(width: 12),
            IconButton(
              onPressed: () {},
              icon: Icon(LucideIcons.settings, size: 24),
            ),
            SizedBox(width: 12),
            VerticalDivider(),
            IconButton(
              onPressed: () {},
              icon: Icon(LucideIcons.printer, size: 24),
            ),
          ],
        ),
      ),
      body: const Placeholder(),
    );
  }
}
