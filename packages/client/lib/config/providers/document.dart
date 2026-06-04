import 'package:flutter/material.dart';
import 'package:fluentepub/database/index.dart';

class DocumentProvider extends ChangeNotifier {
  Document? _selectedDocument;
  String _searchQuery = '';

  Document? get selectedDocument => _selectedDocument;
  String get searchQuery => _searchQuery;

  void setDocument(Document? doc) {
    _selectedDocument = doc;
    notifyListeners();
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }
}
