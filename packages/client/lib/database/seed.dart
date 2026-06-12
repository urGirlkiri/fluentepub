import 'package:drift/drift.dart';
import 'index.dart';

Future<void> seedDatabase(AppDatabase db) async {
  await db.into(db.documents).insert(
    DocumentsCompanion.insert(
      title: "Kai's Genesis",
      author: const Value('Gm'),
      coverUrl: const Value('assets/images/kai.png'),
      rtl: const Value(false),
    ),
  );

  await db.into(db.documents).insert(
    DocumentsCompanion.insert(
      title: 'Reverend Insanity',
      author: const Value('Gu Zhen Ren'),
      coverUrl: const Value('assets/images/rev.jpeg'),
      series: const Value('Book 1'),
      tags: const Value('Fantasy, Xianxia'),
      rtl: const Value(false),
    ),
  );

  await db.into(db.documents).insert(
    DocumentsCompanion.insert(
      title: 'FluentEpub Documentation',
      author: const Value('Kiri'),
      publisher: const Value('YSWS'),
      rtl: const Value(false),
    ),
  );
}