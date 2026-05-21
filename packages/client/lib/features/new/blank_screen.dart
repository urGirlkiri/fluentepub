import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class NewBlankDocument extends StatelessWidget {
  const NewBlankDocument({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => context.pop(), icon: Icon(LucideIcons.arrowLeft)),
        title: Text("New Document"),
      ),
      body:  const Placeholder(),
    );
  }
}