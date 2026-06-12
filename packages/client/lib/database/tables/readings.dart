import 'package:drift/drift.dart';

class Readings extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get documentId => integer()();

  IntColumn get lastPage => integer().withDefault(const Constant(0))();
  IntColumn get totalPages => integer().withDefault(const Constant(0))();

  BoolColumn get favourite => boolean().withDefault(const Constant(false))();
  RealColumn get progress => real().withDefault(const Constant(0.0))();

  DateTimeColumn get lastRead => dateTime().withDefault(currentDateAndTime)();
}
