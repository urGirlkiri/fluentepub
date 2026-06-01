import 'package:drift/drift.dart';

class Documents extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text().withLength(min: 1, max: 150)();
  TextColumn get coverUrl => text().nullable()();
  TextColumn get author => text().nullable()();

  TextColumn get language => text().nullable()();
  TextColumn get series => text().nullable()();
  TextColumn get tags => text().nullable()();

  TextColumn get publisher => text().nullable()();
  TextColumn get country => text().nullable()();

  BoolColumn get rtl => boolean().withDefault(const Constant(false))();
  BoolColumn get favourite => boolean().withDefault(const Constant(false))();

  RealColumn get progress => real().withDefault(const Constant(0.0))();

  DateTimeColumn get lastModified =>
      dateTime().withDefault(currentDateAndTime)();
}
