import 'package:flutter/material.dart';
import 'package:fluentepub/database/index.dart';
import 'package:logging/logging.dart';

class DocumentProvider extends ChangeNotifier {
  Document? _selectedDocument;
  String _searchQuery = '';
  final Logger _logger = Logger('DocumentProvider');

  Document? get selectedDocument => _selectedDocument;
  String get searchQuery => _searchQuery;

  void setDocument(Document? doc) {
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
