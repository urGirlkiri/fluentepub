import 'package:drift/drift.dart';
import 'package:fluentepub/database/models/fluent_doc.dart';
import 'package:fluentepub/database/tables/documents.dart';
import 'package:fluentepub/database/tables/readings.dart';
import 'package:fluentepub/database/tables/workings.dart';
import 'connection/index.dart' as connection;

part 'index.g.dart';

@DriftDatabase(tables: [Documents, Readings, Workings])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(connection.openConnection());

  @override
  int get schemaVersion => 3;

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

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onUpgrade: (Migrator m, int from, int to) async {
        if (from < 2) {
          await m.createTable(readings);
          await m.createTable(workings);
        }
      },
      onCreate: (Migrator m) async {
        await m.createAll();

        await into(documents).insert(
          DocumentsCompanion.insert(
            title: "Kai's Genesis",
            author: const Value('Gm'),
            coverUrl: const Value('assets/images/kai.png'),
            rtl: const Value(false),
          ),
        );

        await into(documents).insert(
          DocumentsCompanion.insert(
            title: 'Reverend Insanity',
            author: const Value('Gu Zhen Ren'),
            coverUrl: const Value('assets/images/rev.jpeg'),
            series: const Value('Book 1'),
            tags: const Value('Fantasy, Xianxia'),
            rtl: const Value(false),
          ),
        );

        await into(documents).insert(
          DocumentsCompanion.insert(
            title: 'FluentEpub Documentation',
            author: const Value('Kiri'),
            publisher: const Value('YSWS'),
            rtl: const Value(false),
          ),
        );
      },
    );
  }
}