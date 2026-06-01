import 'package:flutter/material.dart';
import 'package:fluentepub/features/new/blank/form/row.dart';

class DocumentMetadataForm extends StatelessWidget {
  const DocumentMetadataForm({
    super.key,
    required this.theme,
    required this.titleController,
    required this.authorController,
    required this.seriesController,
    required this.tagsController,
    required this.languageController,
    required this.publisherController,
    required this.countryController,
    required this.fieldErrors,
    required this.onTitleChanged,
    required this.rtl,
    required this.onRtlChanged,
  });

  final ThemeData theme;
  final TextEditingController titleController;
  final TextEditingController authorController;
  final TextEditingController seriesController;
  final TextEditingController tagsController;
  final TextEditingController languageController;
  final TextEditingController publisherController;
  final TextEditingController countryController;
  final Map<String, bool> fieldErrors;
  final ValueChanged<String> onTitleChanged;
  final bool rtl;
  final ValueChanged<bool> onRtlChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FormRow(
          label: 'Title',
          isRequired: true,
          child: TextFormField(
            controller: titleController,
            onChanged: onTitleChanged,
            decoration: InputDecoration(
              hintText: 'Enter book title...',
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: fieldErrors['title'] == true
                      ? Colors.redAccent
                      : theme.colorScheme.outline,
                  width: fieldErrors['title'] == true ? 2 : 1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: fieldErrors['title'] == true
                      ? Colors.redAccent
                      : theme.colorScheme.outline,
                  width: fieldErrors['title'] == true ? 2 : 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: fieldErrors['title'] == true
                      ? Colors.redAccent
                      : theme.colorScheme.primary,
                  width: 2,
                ),
              ),
            ),
          ),
        ),
        FormRow(
          label: 'Author',
          child: TextFormField(
            controller: authorController,
            decoration: const InputDecoration(
              hintText: 'Author or Pen name...',
            ),
          ),
        ),
        FormRow(
          label: 'Series',
          child: TextFormField(
            controller: seriesController,
            decoration: const InputDecoration(
              hintText: 'Series name (Optional)...',
            ),
          ),
        ),
        FormRow(
          label: 'Tags',
          child: TextFormField(
            controller: tagsController,
            decoration: const InputDecoration(
              hintText: 'Fantasy, Sci-Fi, Fiction...',
            ),
          ),
        ),
        FormRow(
          label: 'Language',
          child: TextFormField(
            controller: languageController,
            decoration: const InputDecoration(hintText: 'en, fr, es, etc...'),
          ),
        ),
        FormRow(
          label: 'Publisher',
          child: TextFormField(
            controller: publisherController,
            decoration: const InputDecoration(hintText: 'Publisher...'),
          ),
        ),
        FormRow(
          label: 'Country',
          child: TextFormField(
            controller: countryController,
            decoration: const InputDecoration(hintText: 'Country of origin...'),
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
                  'Right To Left',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              Switch(
                value: rtl,
                activeThumbColor: theme.colorScheme.primary,
                onChanged: onRtlChanged,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
