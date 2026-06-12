import 'package:drift/drift.dart';

class Workings extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get documentId => integer()();

  DateTimeColumn get lastModified =>
      dateTime().withDefault(currentDateAndTime)();
}
