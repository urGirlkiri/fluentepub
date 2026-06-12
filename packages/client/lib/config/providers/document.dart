import 'package:fluentepub/database/models/fluent_doc.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

class DocumentProvider extends ChangeNotifier {
  FluentDoc? _selectedDocument;
  String _searchQuery = '';
  final Logger _logger = Logger('DocumentProvider');

  FluentDoc? get selectedDocument => _selectedDocument;
  String get searchQuery => _searchQuery;

  void setDocument(FluentDoc? doc) {
    _selectedDocument = doc;
    notifyListeners();
  }

  void setSearchQuery(String query) {
      _logger.info('Setting search query: $query');
    _searchQuery = query;
    _logger.info('Search query updated: $_searchQuery');
    notifyListeners();
  }
}
