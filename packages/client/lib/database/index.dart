import 'package:drift/drift.dart';
import 'package:fluentepub/database/documents.dart';
import 'connection/index.dart' as connection;

part 'index.g.dart';

@DriftDatabase(tables: [Documents])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(connection.openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();

        await into(documents).insert(
          DocumentsCompanion.insert(
            title: "Kai's Genesis",
            author: Value('Gm'),
            coverUrl: Value('assets/images/kai.png'),
            rtl: Value(false),
          ),
        );

        await into(documents).insert(
          DocumentsCompanion.insert(
            title: 'Reverend Insanity',
            author: Value('Gu Zhen Ren'),
            coverUrl: Value('assets/images/rev.jpeg'),
            series: Value('Book 1'),
            tags: Value('Fantasy, Xianxia'),
            rtl: Value(false),
          ),
        );

        await into(documents).insert(
          DocumentsCompanion.insert(
            title: 'FluentEpub Documentation',
            author: Value('Kiri'),
            publisher: Value('Hack Club'),
            rtl: Value(false),
          ),
        );
      },
    );
  }
}
