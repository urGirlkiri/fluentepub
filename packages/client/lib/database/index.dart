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
  AppDatabase([QueryExecutor? executor])
    : super(executor ?? connection.openConnection());

  @override
  int get schemaVersion => 5;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onUpgrade: (Migrator m, int from, int to) async {
      if (from < 2) {
        await m.createTable(readings);
        await m.createTable(workings);
      } else if (from < 5) {
        await customStatement(
          'DELETE FROM readings WHERE id NOT IN '
          '(SELECT MAX(id) FROM readings GROUP BY document_id)',
        );
        await customStatement(
          'DELETE FROM workings WHERE id NOT IN '
          '(SELECT MAX(id) FROM workings GROUP BY document_id)',
        );
        await customStatement(
          'CREATE UNIQUE INDEX readings_document_id ON readings (document_id)',
        );
        await customStatement(
          'CREATE UNIQUE INDEX workings_document_id ON workings (document_id)',
        );
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
        return FluentDoc(document: doc, reading: reading, working: working);
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

    return FluentDoc(document: doc, reading: reading, working: working);
  }

  Future<void> updateLastModified(int documentId) async {
    final now = DateTime.now();
    await into(workings).insert(
      WorkingsCompanion.insert(
        documentId: documentId,
        lastModified: Value(now),
      ),
      onConflict: DoUpdate(
        (_) => WorkingsCompanion(lastModified: Value(now)),
        target: [workings.documentId],
      ),
    );
  }

  Future<void> toggleFavourite(int documentId, bool isFavourite) async {
    await into(readings).insert(
      ReadingsCompanion.insert(
        documentId: documentId,
        favourite: Value(isFavourite),
      ),
      onConflict: DoUpdate(
        (_) => ReadingsCompanion(favourite: Value(isFavourite)),
        target: [readings.documentId],
      ),
    );
  }
}
