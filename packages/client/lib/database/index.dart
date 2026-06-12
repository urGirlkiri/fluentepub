import 'package:drift/drift.dart';
import 'package:fluentepub/database/models/fluent_doc.dart';
import 'package:fluentepub/database/tables/documents.dart';
import 'package:fluentepub/database/tables/readings.dart';
import 'package:fluentepub/database/tables/workings.dart';
import 'connection/index.dart' as connection;
import 'seed.dart';

part 'index.g.dart';

@DriftDatabase(tables: [Documents, Readings, Workings])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(connection.openConnection());

  @override
  int get schemaVersion => 4;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onUpgrade: (Migrator m, int from, int to) async {
      if (from < 2) {
        await m.createTable(readings);
        await m.createTable(workings);
      }
      if (from < 4) {
        await m.addColumn(documents, documents.dateAdded);
        await m.addColumn(documents, documents.dateCreated);
      }
    },
    onCreate: (Migrator m) async {
      await m.createAll();
      seedDatabase(this);
    },
  );

  Stream<List<FluentDoc>> watchFluentDoc() {
    final query = select(documents).join([
      leftOuterJoin(readings, readings.documentId.equalsExp(documents.id)),
      leftOuterJoin(workings, workings.documentId.equalsExp(documents.id)),
    ]);

    return query.watch().map((rows) {
      return rows.map((row) {
        final doc = row.readTable(documents);
        final reading = row.readTableOrNull(readings);
        final working = row.readTableOrNull(workings);
        return FluentDoc(
          document: doc,
          reading: reading,
          working: working,
        );
      }).toList();
    });
  }

  Future<FluentDoc?> getFluentDocById(int documentId) async {
    final query = select(documents).join([
      leftOuterJoin(readings, readings.documentId.equalsExp(documents.id)),
      leftOuterJoin(workings, workings.documentId.equalsExp(documents.id)),
    ])..where(documents.id.equals(documentId));

    final row = await query.getSingleOrNull();
    if (row == null) return null;

    final doc = row.readTable(documents);
    final reading = row.readTableOrNull(readings);
    final working = row.readTableOrNull(workings);

    return FluentDoc(
      document: doc,
      reading: reading,
      working: working,
    );
  }

 
}