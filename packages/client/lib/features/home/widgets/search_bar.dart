import 'package:fluentepub/config/context.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

class LibSearchBar extends StatefulWidget {
  const LibSearchBar({super.key});

  @override
  State createState() => _LibSearchBarState();
}

class _LibSearchBarState extends State<LibSearchBar> {
  final TextEditingController _controller = TextEditingController();
  final Logger _logger = Logger('LibSearchBar');
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchQuery = context.searchQuery;
    final theme = context.theme;
    bool isDarkMode = context.isDarkMode;

    if (searchQuery.isEmpty && _controller.text.isNotEmpty) {
      _controller.clear();
    }

    return TextField(
      controller: _controller,
      focusNode: _focusNode, 
      onChanged: (value) {
        _logger.info('Search query changed: $value');
        context.readDoc.setSearchQuery(value);
      },
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search, size: 20),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: isDarkMode
                ? theme.colorScheme.surface
                : context.palette.yaleBlue,
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
                  _controller.clear();
                  context.readDoc.setSearchQuery('');
                  _focusNode.unfocus();
                },
              )
            : null,
      ),
    );
  }
}
