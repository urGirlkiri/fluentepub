import 'package:flutter/material.dart';
import 'package:fluentepub/database/index.dart';

class DocumentProvider extends ChangeNotifier {
  Document? _selectedDocument;

  Document? get selectedDocument => _selectedDocument;

  void setDocument(Document? doc) {
    _selectedDocument = doc;
    notifyListeners();
  }
}
