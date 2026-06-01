import 'dart:collection';
import 'package:fluentepub/config/filters.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

typedef MenuEntry = DropdownMenuEntry<String>;

class SortBy extends StatelessWidget {
  const SortBy({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final String value;
  final ValueChanged<String> onChanged;

  static final List<MenuEntry> menuEntries = UnmodifiableListView<MenuEntry>(
    Filters.all.map<MenuEntry>(
      (String name) => MenuEntry(value: name, label: name),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownMenu<String>(
        initialSelection: value,
        requestFocusOnTap: false,
        enableSearch: false,
        enableFilter: false,
        inputDecorationTheme: InputDecorationTheme(
          border: InputBorder.none,
          outlineBorder: BorderSide.none,
          activeIndicatorBorder: BorderSide.none,
          disabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
        ),
        trailingIcon: Icon(
          LucideIcons.chevronDown,
          color: Theme.of(context).colorScheme.primary,
        ),
        onSelected: (String? value) {
          if (value != null) {
            onChanged(value);
          }
        },
        dropdownMenuEntries: menuEntries,
      ),
    );
  }
}
