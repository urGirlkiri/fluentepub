import 'package:fluentepub/config/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class NewBlankDocument extends StatelessWidget {
  const NewBlankDocument({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final Size screenSize = MediaQuery.of(context).size;

    final bool isWideScreen = screenSize.width > 900;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(LucideIcons.arrowLeft, size: 24),
          onPressed: () => context.pop(),
        ),
        title: const Text("New Document Metadata"),
        centerTitle: true,
        toolbarHeight: 90,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isWideScreen ? 64.0 : 24.0,
            vertical: 32.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (isWideScreen)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildCoverPicker(theme, 400, 450),
                    const SizedBox(width: 48),
                    SizedBox(
                      width: screenSize.width / 3,
                      child: _buildFormFields(theme),
                    ),
                  ],
                )
              else
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildCoverPicker(theme, 400, 450),
                    const SizedBox(height: 32),
                    SizedBox(
                      width: screenSize.width / 3,
                      child: _buildFormFields(theme),
                    ),
                  ],
                ),

               SizedBox(height: screenSize.height/4),
              Divider(
                height: 1,
                color: theme.colorScheme.onSurface.withValues(alpha: 0.1),
              ),
              const SizedBox(height: 24),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () => context.pop(),
                    icon: const Icon(LucideIcons.x, size: 18),
                    label: const Text("Cancel"),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton.icon(
                    onPressed: () => context.replaceNamed(Routes.workspace),
                    icon: const Icon(LucideIcons.squarePen, size: 18),
                    label: const Text("Create"),
                  ),
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCoverPicker(ThemeData theme, double width, double height ) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: theme.colorScheme.onSurface.withValues(alpha: 0.1),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(LucideIcons.imageUp, size: 56, color: theme.colorScheme.primary),
          const SizedBox(height: 12),
          Text(
            "Upload Cover Image",
            style: TextStyle(
              fontSize: 13,
              color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormFields(ThemeData theme) {
    return Column(
      children: [
        _buildFormRow(
          "Title",
          TextFormField(
            decoration: const InputDecoration(hintText: "Enter book title..."),
          ),
        ),
        _buildFormRow(
          "Author",
          TextFormField(
            decoration: const InputDecoration(
              hintText: "Author or Pen name...",
            ),
          ),
        ),
        _buildFormRow(
          "Series",
          TextFormField(
            decoration: const InputDecoration(
              hintText: "Series name (Optional)...",
            ),
          ),
        ),
        _buildFormRow(
          "Tags",
          TextFormField(
            decoration: const InputDecoration(
              hintText: "Fantasy, Sci-Fi, Fiction...",
            ),
          ),
        ),
        _buildFormRow(
          "Language",
          TextFormField(
            decoration: const InputDecoration(hintText: "en, fr, es, etc..."),
          ),
        ),
        _buildFormRow(
          "Publisher",
          TextFormField(
            decoration: const InputDecoration(
              hintText: "Publisher...",
            ),
          ),
        ),
        _buildFormRow(
          "Country",
          TextFormField(
            decoration: const InputDecoration(hintText: "Country of origin..."),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                width: 120,
                child: Text(
                  "Right To Left",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              Switch(
                value: false,
                activeThumbColor: theme.colorScheme.primary,
                onChanged: (value) => {},
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFormRow(String label, Widget field) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(child: SizedBox(height: 44, child: field)),
        ],
      ),
    );
  }
}
