import 'package:drift/drift.dart';

class Readings extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get documentId => integer()();

  TextColumn get lastPage => text().nullable()();
  TextColumn get totalPage => text().nullable()();

  TextColumn get lastRead => text().nullable()();

  BoolColumn get favourite => boolean().withDefault(const Constant(false))();
  RealColumn get progress => real().withDefault(const Constant(0.0))();

}
