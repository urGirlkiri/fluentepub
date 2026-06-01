import 'dart:typed_data';

import 'package:drift/drift.dart' show Value;
import 'package:file_picker/file_picker.dart';
import 'package:fluentepub/config/context.dart';
import 'package:fluentepub/config/router.dart';
import 'package:fluentepub/features/new/blank/cover.dart';
import 'package:fluentepub/features/new/blank/form/index.dart';
import 'package:flutter/material.dart';
import 'package:fluentepub/database/index.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:path/path.dart' as path;

class NewBlankDocument extends StatefulWidget {
  const NewBlankDocument({super.key});

  @override
  State<NewBlankDocument> createState() => _NewBlankDocumentState();
}

class _NewBlankDocumentState extends State<NewBlankDocument> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();
  final TextEditingController _seriesController = TextEditingController();
  final TextEditingController _tagsController = TextEditingController();
  final TextEditingController _languageController = TextEditingController();
  final TextEditingController _publisherController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  bool _rtl = false;
  bool _isSaving = false;
  String? _coverPath;
  Uint8List? _coverBytes;
  final Map<String, bool> _fieldErrors = {'title': false};

  @override
  void dispose() {
    _titleController.dispose();
    _authorController.dispose();
    _seriesController.dispose();
    _tagsController.dispose();
    _languageController.dispose();
    _publisherController.dispose();
    _countryController.dispose();
    super.dispose();
  }

  bool _validateFields() {
    final titleTrimmed = _titleController.text.trim();
    final errors = <String, bool>{'title': titleTrimmed.isEmpty};

    setState(() {
      _fieldErrors.clear();
      _fieldErrors.addAll(errors);
    });

    return !errors.values.any((e) => e);
  }

  Future<void> _createDocument() async {
    if (_isSaving) return;

    if (!_validateFields()) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Title is required. Please enter a title.'),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    setState(() {
      _isSaving = true;
    });

    final title = _titleController.text.trim();

    final insertedId = await context.db
        .into(context.db.documents)
        .insert(
          DocumentsCompanion.insert(
            title: title,
            coverUrl: Value(
              _coverPath == null || _coverPath!.isEmpty ? null : _coverPath,
            ),
            author: Value(
              _authorController.text.trim().isEmpty
                  ? null
                  : _authorController.text.trim(),
            ),
            series: Value(
              _seriesController.text.trim().isEmpty
                  ? null
                  : _seriesController.text.trim(),
            ),
            tags: Value(
              _tagsController.text.trim().isEmpty
                  ? null
                  : _tagsController.text.trim(),
            ),
            language: Value(
              _languageController.text.trim().isEmpty
                  ? null
                  : _languageController.text.trim(),
            ),
            publisher: Value(
              _publisherController.text.trim().isEmpty
                  ? null
                  : _publisherController.text.trim(),
            ),
            country: Value(
              _countryController.text.trim().isEmpty
                  ? null
                  : _countryController.text.trim(),
            ),
            rtl: Value(_rtl),
          ),
        );

    if (!mounted) return;

    context.replaceNamed(
      Routes.workspace,
      pathParameters: {'id': insertedId.toString()},
    );
  }

  Future<void> _pickCoverImage() async {
    final result = await FilePicker.pickFiles(
      type: FileType.image,
      allowMultiple: false,
      withData: true,
    );

    if (result == null || result.files.isEmpty) {
      return;
    }

    final picked = result.files.first;
    setState(() {
      _coverPath = picked.path ?? picked.name;
      _coverBytes = picked.bytes;
    });

    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Cover image selected: ${path.basename(_coverPath!)}'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

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
        title: const Text("New Document"),
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
                    CoverPicker(
                      width: 400,
                      height: 450,
                      selectedCoverPath: _coverPath,
                      selectedCoverBytes: _coverBytes,
                      onPick: _pickCoverImage,
                    ),
                    const SizedBox(width: 48),
                    SizedBox(
                      width: screenSize.width / 3,
                      child: DocumentMetadataForm(
                        theme: theme,
                        titleController: _titleController,
                        authorController: _authorController,
                        seriesController: _seriesController,
                        tagsController: _tagsController,
                        languageController: _languageController,
                        publisherController: _publisherController,
                        countryController: _countryController,
                        fieldErrors: _fieldErrors,
                        onTitleChanged: (_) {
                          if (_fieldErrors['title'] == true) {
                            setState(() {
                              _fieldErrors['title'] = _titleController.text
                                  .trim()
                                  .isEmpty;
                            });
                          }
                        },
                        rtl: _rtl,
                        onRtlChanged: (value) {
                          setState(() {
                            _rtl = value;
                          });
                        },
                      ),
                    ),
                  ],
                )
              else
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CoverPicker(
                      width: 400,
                      height: 450,
                      selectedCoverPath: _coverPath,
                      selectedCoverBytes: _coverBytes,
                      onPick: _pickCoverImage,
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      width: screenSize.width / 3,
                      child: DocumentMetadataForm(
                        theme: theme,
                        titleController: _titleController,
                        authorController: _authorController,
                        seriesController: _seriesController,
                        tagsController: _tagsController,
                        languageController: _languageController,
                        publisherController: _publisherController,
                        countryController: _countryController,
                        fieldErrors: _fieldErrors,
                        onTitleChanged: (_) {
                          if (_fieldErrors['title'] == true) {
                            setState(() {
                              _fieldErrors['title'] = _titleController.text
                                  .trim()
                                  .isEmpty;
                            });
                          }
                        },
                        rtl: _rtl,
                        onRtlChanged: (value) {
                          setState(() {
                            _rtl = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),

              SizedBox(height: screenSize.height / 4),
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
                    onPressed: _isSaving ? null : _createDocument,
                    icon: const Icon(LucideIcons.squarePen, size: 18),
                    label: Text(_isSaving ? 'Creating...' : 'Create'),
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
}
