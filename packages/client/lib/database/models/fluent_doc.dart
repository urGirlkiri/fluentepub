import 'package:fluentepub/database/index.dart';

class FluentDoc {
  final Document document;
  final Reading? reading;
  final Working? working;

  FluentDoc({
    required this.document,
    this.reading,
    this.working,
  });

  int get id => document.id;
  String get title => document.title;
  String? get coverUrl => document.coverUrl;
  String? get author => document.author;
  String? get language => document.language;
  String? get series => document.series;
  String? get tags => document.tags;
  String? get publisher => document.publisher;
  String? get country => document.country;
  bool get rtl => document.rtl;

  bool get favourite => reading?.favourite ?? false;
  double get progress => reading?.progress ?? 0.0;
  DateTime get lastModified => working?.lastModified ?? DateTime.now();
}
