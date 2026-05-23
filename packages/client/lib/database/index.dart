import 'package:drift/drift.dart';
import 'package:fluentepub/database/documents.dart';
import 'connection/index.dart' as connection; 

part 'index.g.dart';

@DriftDatabase(tables: [Documents])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(connection.openConnection());

  @override
  int get schemaVersion => 1;
}