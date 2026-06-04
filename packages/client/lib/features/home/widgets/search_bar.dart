import 'package:fluentepub/config/context.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final searchQuery = context.searchQuery;
    final theme = context.theme;
    bool isDarkMode = context.isDarkMode;
    final palette = context.palette;

    return TextField(
      onChanged: (value) {
        context.readDoc.setSearchQuery(value);
      },
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search, size: 20),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: isDarkMode ? theme.colorScheme.surface : palette.yaleBlue,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: theme.colorScheme.primary),
        ),
        isDense: true,
        hintText: 'Search books...',
        hintStyle: const TextStyle(fontSize: 14),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 12,
        ),
        suffixIcon: searchQuery.isNotEmpty
            ? IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  context.readDoc.setSearchQuery('');
                },
              )
            : null,
      ),
    );
  }
}
