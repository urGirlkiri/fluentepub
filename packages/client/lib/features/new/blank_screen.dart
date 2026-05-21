import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class NewBlankDocument extends StatelessWidget {
  const NewBlankDocument({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox.shrink(),
        title: Center(child: Text("New Document")),
        toolbarHeight: 90,
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height / 1.5,
          decoration: ShapeDecoration(
            color: theme.colorScheme.surface,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 370,
                height: 300,
                decoration: ShapeDecoration(
                  color: theme.colorScheme.surface,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                child: Icon(
                  LucideIcons.imageUp,
                  size: 80,
                  color: theme.colorScheme.primary,
                ),
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "File Path",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(width: 12),
                  SizedBox(width: 300, child: TextFormField()),
                ],
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Project Name",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(width: 12),
                  SizedBox(width: 250, child: TextFormField()),
                ],
              ),
              SizedBox(height: 12),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Author", style: TextStyle(fontWeight: FontWeight.w600)),
                  SizedBox(width: 12),
                  SizedBox(width: 300, child: TextFormField()),
                ],
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => context.pop(),
                      child: Row(
                        children: [
                          Icon(LucideIcons.x, size: 24),
                          SizedBox(width: 12),
                          Text("Cancel"),
                        ],
                      ),
                    ),
                    SizedBox(width: 12),
                    ElevatedButton(
                      onPressed: () => {},
                      child: Row(
                        children: [
                          Icon(LucideIcons.squarePen, size: 24),
                          SizedBox(width: 12),
                          Text("Create"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
