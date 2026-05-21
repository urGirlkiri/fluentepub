import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

typedef MenuEntry = DropdownMenuEntry<String>;

class SortBy extends StatefulWidget {
  const SortBy({super.key});

  @override
  State<SortBy> createState() => _SortByState();
}

class _SortByState extends State<SortBy> {
  static const List<String> filters = <String>[
    'Last Read',
    'Title (A-Z)',
    'Date Added',
    'Last Modified',
  ];

  static final List<MenuEntry> menuEntries = UnmodifiableListView<MenuEntry>(
    filters.map<MenuEntry>((String name) => MenuEntry(value: name, label: name)),
  );

  String dropdownValue = filters.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownMenu<String>(
        initialSelection: filters.first,
        inputDecorationTheme:  InputDecorationTheme(
          border: InputBorder.none,
          outlineBorder:  BorderSide.none,
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
          setState(() {
            dropdownValue = value!;
          });
        },
        dropdownMenuEntries: menuEntries,
      ),
    );
  }
}
