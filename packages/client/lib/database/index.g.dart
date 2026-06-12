// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// ignore_for_file: type=lint
class $DocumentsTable extends Documents
    with TableInfo<$DocumentsTable, Document> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DocumentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 150,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _coverUrlMeta = const VerificationMeta(
    'coverUrl',
  );
  @override
  late final GeneratedColumn<String> coverUrl = GeneratedColumn<String>(
    'cover_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _authorMeta = const VerificationMeta('author');
  @override
  late final GeneratedColumn<String> author = GeneratedColumn<String>(
    'author',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _languageMeta = const VerificationMeta(
    'language',
  );
  @override
  late final GeneratedColumn<String> language = GeneratedColumn<String>(
    'language',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _seriesMeta = const VerificationMeta('series');
  @override
  late final GeneratedColumn<String> series = GeneratedColumn<String>(
    'series',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _tagsMeta = const VerificationMeta('tags');
  @override
  late final GeneratedColumn<String> tags = GeneratedColumn<String>(
    'tags',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _publisherMeta = const VerificationMeta(
    'publisher',
  );
  @override
  late final GeneratedColumn<String> publisher = GeneratedColumn<String>(
    'publisher',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _countryMeta = const VerificationMeta(
    'country',
  );
  @override
  late final GeneratedColumn<String> country = GeneratedColumn<String>(
    'country',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _rtlMeta = const VerificationMeta('rtl');
  @override
  late final GeneratedColumn<bool> rtl = GeneratedColumn<bool>(
    'rtl',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("rtl" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    coverUrl,
    author,
    language,
    series,
    tags,
    publisher,
    country,
    rtl,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'documents';
  @override
  VerificationContext validateIntegrity(
    Insertable<Document> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('cover_url')) {
      context.handle(
        _coverUrlMeta,
        coverUrl.isAcceptableOrUnknown(data['cover_url']!, _coverUrlMeta),
      );
    }
    if (data.containsKey('author')) {
      context.handle(
        _authorMeta,
        author.isAcceptableOrUnknown(data['author']!, _authorMeta),
      );
    }
    if (data.containsKey('language')) {
      context.handle(
        _languageMeta,
        language.isAcceptableOrUnknown(data['language']!, _languageMeta),
      );
    }
    if (data.containsKey('series')) {
      context.handle(
        _seriesMeta,
        series.isAcceptableOrUnknown(data['series']!, _seriesMeta),
      );
    }
    if (data.containsKey('tags')) {
      context.handle(
        _tagsMeta,
        tags.isAcceptableOrUnknown(data['tags']!, _tagsMeta),
      );
    }
    if (data.containsKey('publisher')) {
      context.handle(
        _publisherMeta,
        publisher.isAcceptableOrUnknown(data['publisher']!, _publisherMeta),
      );
    }
    if (data.containsKey('country')) {
      context.handle(
        _countryMeta,
        country.isAcceptableOrUnknown(data['country']!, _countryMeta),
      );
    }
    if (data.containsKey('rtl')) {
      context.handle(
        _rtlMeta,
        rtl.isAcceptableOrUnknown(data['rtl']!, _rtlMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Document map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Document(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      coverUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cover_url'],
      ),
      author: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}author'],
      ),
      language: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}language'],
      ),
      series: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}series'],
      ),
      tags: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tags'],
      ),
      publisher: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}publisher'],
      ),
      country: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}country'],
      ),
      rtl: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}rtl'],
      )!,
    );
  }

  @override
  $DocumentsTable createAlias(String alias) {
    return $DocumentsTable(attachedDatabase, alias);
  }
}

class Document extends DataClass implements Insertable<Document> {
  final int id;
  final String title;
  final String? coverUrl;
  final String? author;
  final String? language;
  final String? series;
  final String? tags;
  final String? publisher;
  final String? country;
  final bool rtl;
  const Document({
    required this.id,
    required this.title,
    this.coverUrl,
    this.author,
    this.language,
    this.series,
    this.tags,
    this.publisher,
    this.country,
    required this.rtl,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || coverUrl != null) {
      map['cover_url'] = Variable<String>(coverUrl);
    }
    if (!nullToAbsent || author != null) {
      map['author'] = Variable<String>(author);
    }
    if (!nullToAbsent || language != null) {
      map['language'] = Variable<String>(language);
    }
    if (!nullToAbsent || series != null) {
      map['series'] = Variable<String>(series);
    }
    if (!nullToAbsent || tags != null) {
      map['tags'] = Variable<String>(tags);
    }
    if (!nullToAbsent || publisher != null) {
      map['publisher'] = Variable<String>(publisher);
    }
    if (!nullToAbsent || country != null) {
      map['country'] = Variable<String>(country);
    }
    map['rtl'] = Variable<bool>(rtl);
    return map;
  }

  DocumentsCompanion toCompanion(bool nullToAbsent) {
    return DocumentsCompanion(
      id: Value(id),
      title: Value(title),
      coverUrl: coverUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(coverUrl),
      author: author == null && nullToAbsent
          ? const Value.absent()
          : Value(author),
      language: language == null && nullToAbsent
          ? const Value.absent()
          : Value(language),
      series: series == null && nullToAbsent
          ? const Value.absent()
          : Value(series),
      tags: tags == null && nullToAbsent ? const Value.absent() : Value(tags),
      publisher: publisher == null && nullToAbsent
          ? const Value.absent()
          : Value(publisher),
      country: country == null && nullToAbsent
          ? const Value.absent()
          : Value(country),
      rtl: Value(rtl),
    );
  }

  factory Document.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Document(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      coverUrl: serializer.fromJson<String?>(json['coverUrl']),
      author: serializer.fromJson<String?>(json['author']),
      language: serializer.fromJson<String?>(json['language']),
      series: serializer.fromJson<String?>(json['series']),
      tags: serializer.fromJson<String?>(json['tags']),
      publisher: serializer.fromJson<String?>(json['publisher']),
      country: serializer.fromJson<String?>(json['country']),
      rtl: serializer.fromJson<bool>(json['rtl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'coverUrl': serializer.toJson<String?>(coverUrl),
      'author': serializer.toJson<String?>(author),
      'language': serializer.toJson<String?>(language),
      'series': serializer.toJson<String?>(series),
      'tags': serializer.toJson<String?>(tags),
      'publisher': serializer.toJson<String?>(publisher),
      'country': serializer.toJson<String?>(country),
      'rtl': serializer.toJson<bool>(rtl),
    };
  }

  Document copyWith({
    int? id,
    String? title,
    Value<String?> coverUrl = const Value.absent(),
    Value<String?> author = const Value.absent(),
    Value<String?> language = const Value.absent(),
    Value<String?> series = const Value.absent(),
    Value<String?> tags = const Value.absent(),
    Value<String?> publisher = const Value.absent(),
    Value<String?> country = const Value.absent(),
    bool? rtl,
  }) => Document(
    id: id ?? this.id,
    title: title ?? this.title,
    coverUrl: coverUrl.present ? coverUrl.value : this.coverUrl,
    author: author.present ? author.value : this.author,
    language: language.present ? language.value : this.language,
    series: series.present ? series.value : this.series,
    tags: tags.present ? tags.value : this.tags,
    publisher: publisher.present ? publisher.value : this.publisher,
    country: country.present ? country.value : this.country,
    rtl: rtl ?? this.rtl,
  );
  Document copyWithCompanion(DocumentsCompanion data) {
    return Document(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      coverUrl: data.coverUrl.present ? data.coverUrl.value : this.coverUrl,
      author: data.author.present ? data.author.value : this.author,
      language: data.language.present ? data.language.value : this.language,
      series: data.series.present ? data.series.value : this.series,
      tags: data.tags.present ? data.tags.value : this.tags,
      publisher: data.publisher.present ? data.publisher.value : this.publisher,
      country: data.country.present ? data.country.value : this.country,
      rtl: data.rtl.present ? data.rtl.value : this.rtl,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Document(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('coverUrl: $coverUrl, ')
          ..write('author: $author, ')
          ..write('language: $language, ')
          ..write('series: $series, ')
          ..write('tags: $tags, ')
          ..write('publisher: $publisher, ')
          ..write('country: $country, ')
          ..write('rtl: $rtl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    coverUrl,
    author,
    language,
    series,
    tags,
    publisher,
    country,
    rtl,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Document &&
          other.id == this.id &&
          other.title == this.title &&
          other.coverUrl == this.coverUrl &&
          other.author == this.author &&
          other.language == this.language &&
          other.series == this.series &&
          other.tags == this.tags &&
          other.publisher == this.publisher &&
          other.country == this.country &&
          other.rtl == this.rtl);
}

class DocumentsCompanion extends UpdateCompanion<Document> {
  final Value<int> id;
  final Value<String> title;
  final Value<String?> coverUrl;
  final Value<String?> author;
  final Value<String?> language;
  final Value<String?> series;
  final Value<String?> tags;
  final Value<String?> publisher;
  final Value<String?> country;
  final Value<bool> rtl;
  const DocumentsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.coverUrl = const Value.absent(),
    this.author = const Value.absent(),
    this.language = const Value.absent(),
    this.series = const Value.absent(),
    this.tags = const Value.absent(),
    this.publisher = const Value.absent(),
    this.country = const Value.absent(),
    this.rtl = const Value.absent(),
  });
  DocumentsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    this.coverUrl = const Value.absent(),
    this.author = const Value.absent(),
    this.language = const Value.absent(),
    this.series = const Value.absent(),
    this.tags = const Value.absent(),
    this.publisher = const Value.absent(),
    this.country = const Value.absent(),
    this.rtl = const Value.absent(),
  }) : title = Value(title);
  static Insertable<Document> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? coverUrl,
    Expression<String>? author,
    Expression<String>? language,
    Expression<String>? series,
    Expression<String>? tags,
    Expression<String>? publisher,
    Expression<String>? country,
    Expression<bool>? rtl,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (coverUrl != null) 'cover_url': coverUrl,
      if (author != null) 'author': author,
      if (language != null) 'language': language,
      if (series != null) 'series': series,
      if (tags != null) 'tags': tags,
      if (publisher != null) 'publisher': publisher,
      if (country != null) 'country': country,
      if (rtl != null) 'rtl': rtl,
    });
  }

  DocumentsCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String?>? coverUrl,
    Value<String?>? author,
    Value<String?>? language,
    Value<String?>? series,
    Value<String?>? tags,
    Value<String?>? publisher,
    Value<String?>? country,
    Value<bool>? rtl,
  }) {
    return DocumentsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      coverUrl: coverUrl ?? this.coverUrl,
      author: author ?? this.author,
      language: language ?? this.language,
      series: series ?? this.series,
      tags: tags ?? this.tags,
      publisher: publisher ?? this.publisher,
      country: country ?? this.country,
      rtl: rtl ?? this.rtl,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (coverUrl.present) {
      map['cover_url'] = Variable<String>(coverUrl.value);
    }
    if (author.present) {
      map['author'] = Variable<String>(author.value);
    }
    if (language.present) {
      map['language'] = Variable<String>(language.value);
    }
    if (series.present) {
      map['series'] = Variable<String>(series.value);
    }
    if (tags.present) {
      map['tags'] = Variable<String>(tags.value);
    }
    if (publisher.present) {
      map['publisher'] = Variable<String>(publisher.value);
    }
    if (country.present) {
      map['country'] = Variable<String>(country.value);
    }
    if (rtl.present) {
      map['rtl'] = Variable<bool>(rtl.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DocumentsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('coverUrl: $coverUrl, ')
          ..write('author: $author, ')
          ..write('language: $language, ')
          ..write('series: $series, ')
          ..write('tags: $tags, ')
          ..write('publisher: $publisher, ')
          ..write('country: $country, ')
          ..write('rtl: $rtl')
          ..write(')'))
        .toString();
  }
}

class $ReadingsTable extends Readings with TableInfo<$ReadingsTable, Reading> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReadingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _documentIdMeta = const VerificationMeta(
    'documentId',
  );
  @override
  late final GeneratedColumn<int> documentId = GeneratedColumn<int>(
    'document_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastPageMeta = const VerificationMeta(
    'lastPage',
  );
  @override
  late final GeneratedColumn<int> lastPage = GeneratedColumn<int>(
    'last_page',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _totalPagesMeta = const VerificationMeta(
    'totalPages',
  );
  @override
  late final GeneratedColumn<int> totalPages = GeneratedColumn<int>(
    'total_pages',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _favouriteMeta = const VerificationMeta(
    'favourite',
  );
  @override
  late final GeneratedColumn<bool> favourite = GeneratedColumn<bool>(
    'favourite',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("favourite" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _progressMeta = const VerificationMeta(
    'progress',
  );
  @override
  late final GeneratedColumn<double> progress = GeneratedColumn<double>(
    'progress',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _lastReadMeta = const VerificationMeta(
    'lastRead',
  );
  @override
  late final GeneratedColumn<DateTime> lastRead = GeneratedColumn<DateTime>(
    'last_read',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    documentId,
    lastPage,
    totalPages,
    favourite,
    progress,
    lastRead,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'readings';
  @override
  VerificationContext validateIntegrity(
    Insertable<Reading> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('document_id')) {
      context.handle(
        _documentIdMeta,
        documentId.isAcceptableOrUnknown(data['document_id']!, _documentIdMeta),
      );
    } else if (isInserting) {
      context.missing(_documentIdMeta);
    }
    if (data.containsKey('last_page')) {
      context.handle(
        _lastPageMeta,
        lastPage.isAcceptableOrUnknown(data['last_page']!, _lastPageMeta),
      );
    }
    if (data.containsKey('total_pages')) {
      context.handle(
        _totalPagesMeta,
        totalPages.isAcceptableOrUnknown(data['total_pages']!, _totalPagesMeta),
      );
    }
    if (data.containsKey('favourite')) {
      context.handle(
        _favouriteMeta,
        favourite.isAcceptableOrUnknown(data['favourite']!, _favouriteMeta),
      );
    }
    if (data.containsKey('progress')) {
      context.handle(
        _progressMeta,
        progress.isAcceptableOrUnknown(data['progress']!, _progressMeta),
      );
    }
    if (data.containsKey('last_read')) {
      context.handle(
        _lastReadMeta,
        lastRead.isAcceptableOrUnknown(data['last_read']!, _lastReadMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Reading map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Reading(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      documentId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}document_id'],
      )!,
      lastPage: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}last_page'],
      )!,
      totalPages: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total_pages'],
      )!,
      favourite: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}favourite'],
      )!,
      progress: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}progress'],
      )!,
      lastRead: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_read'],
      )!,
    );
  }

  @override
  $ReadingsTable createAlias(String alias) {
    return $ReadingsTable(attachedDatabase, alias);
  }
}

class Reading extends DataClass implements Insertable<Reading> {
  final int id;
  final int documentId;
  final int lastPage;
  final int totalPages;
  final bool favourite;
  final double progress;
  final DateTime lastRead;
  const Reading({
    required this.id,
    required this.documentId,
    required this.lastPage,
    required this.totalPages,
    required this.favourite,
    required this.progress,
    required this.lastRead,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['document_id'] = Variable<int>(documentId);
    map['last_page'] = Variable<int>(lastPage);
    map['total_pages'] = Variable<int>(totalPages);
    map['favourite'] = Variable<bool>(favourite);
    map['progress'] = Variable<double>(progress);
    map['last_read'] = Variable<DateTime>(lastRead);
    return map;
  }

  ReadingsCompanion toCompanion(bool nullToAbsent) {
    return ReadingsCompanion(
      id: Value(id),
      documentId: Value(documentId),
      lastPage: Value(lastPage),
      totalPages: Value(totalPages),
      favourite: Value(favourite),
      progress: Value(progress),
      lastRead: Value(lastRead),
    );
  }

  factory Reading.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Reading(
      id: serializer.fromJson<int>(json['id']),
      documentId: serializer.fromJson<int>(json['documentId']),
      lastPage: serializer.fromJson<int>(json['lastPage']),
      totalPages: serializer.fromJson<int>(json['totalPages']),
      favourite: serializer.fromJson<bool>(json['favourite']),
      progress: serializer.fromJson<double>(json['progress']),
      lastRead: serializer.fromJson<DateTime>(json['lastRead']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'documentId': serializer.toJson<int>(documentId),
      'lastPage': serializer.toJson<int>(lastPage),
      'totalPages': serializer.toJson<int>(totalPages),
      'favourite': serializer.toJson<bool>(favourite),
      'progress': serializer.toJson<double>(progress),
      'lastRead': serializer.toJson<DateTime>(lastRead),
    };
  }

  Reading copyWith({
    int? id,
    int? documentId,
    int? lastPage,
    int? totalPages,
    bool? favourite,
    double? progress,
    DateTime? lastRead,
  }) => Reading(
    id: id ?? this.id,
    documentId: documentId ?? this.documentId,
    lastPage: lastPage ?? this.lastPage,
    totalPages: totalPages ?? this.totalPages,
    favourite: favourite ?? this.favourite,
    progress: progress ?? this.progress,
    lastRead: lastRead ?? this.lastRead,
  );
  Reading copyWithCompanion(ReadingsCompanion data) {
    return Reading(
      id: data.id.present ? data.id.value : this.id,
      documentId: data.documentId.present
          ? data.documentId.value
          : this.documentId,
      lastPage: data.lastPage.present ? data.lastPage.value : this.lastPage,
      totalPages: data.totalPages.present
          ? data.totalPages.value
          : this.totalPages,
      favourite: data.favourite.present ? data.favourite.value : this.favourite,
      progress: data.progress.present ? data.progress.value : this.progress,
      lastRead: data.lastRead.present ? data.lastRead.value : this.lastRead,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Reading(')
          ..write('id: $id, ')
          ..write('documentId: $documentId, ')
          ..write('lastPage: $lastPage, ')
          ..write('totalPages: $totalPages, ')
          ..write('favourite: $favourite, ')
          ..write('progress: $progress, ')
          ..write('lastRead: $lastRead')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    documentId,
    lastPage,
    totalPages,
    favourite,
    progress,
    lastRead,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Reading &&
          other.id == this.id &&
          other.documentId == this.documentId &&
          other.lastPage == this.lastPage &&
          other.totalPages == this.totalPages &&
          other.favourite == this.favourite &&
          other.progress == this.progress &&
          other.lastRead == this.lastRead);
}

class ReadingsCompanion extends UpdateCompanion<Reading> {
  final Value<int> id;
  final Value<int> documentId;
  final Value<int> lastPage;
  final Value<int> totalPages;
  final Value<bool> favourite;
  final Value<double> progress;
  final Value<DateTime> lastRead;
  const ReadingsCompanion({
    this.id = const Value.absent(),
    this.documentId = const Value.absent(),
    this.lastPage = const Value.absent(),
    this.totalPages = const Value.absent(),
    this.favourite = const Value.absent(),
    this.progress = const Value.absent(),
    this.lastRead = const Value.absent(),
  });
  ReadingsCompanion.insert({
    this.id = const Value.absent(),
    required int documentId,
    this.lastPage = const Value.absent(),
    this.totalPages = const Value.absent(),
    this.favourite = const Value.absent(),
    this.progress = const Value.absent(),
    this.lastRead = const Value.absent(),
  }) : documentId = Value(documentId);
  static Insertable<Reading> custom({
    Expression<int>? id,
    Expression<int>? documentId,
    Expression<int>? lastPage,
    Expression<int>? totalPages,
    Expression<bool>? favourite,
    Expression<double>? progress,
    Expression<DateTime>? lastRead,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (documentId != null) 'document_id': documentId,
      if (lastPage != null) 'last_page': lastPage,
      if (totalPages != null) 'total_pages': totalPages,
      if (favourite != null) 'favourite': favourite,
      if (progress != null) 'progress': progress,
      if (lastRead != null) 'last_read': lastRead,
    });
  }

  ReadingsCompanion copyWith({
    Value<int>? id,
    Value<int>? documentId,
    Value<int>? lastPage,
    Value<int>? totalPages,
    Value<bool>? favourite,
    Value<double>? progress,
    Value<DateTime>? lastRead,
  }) {
    return ReadingsCompanion(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
      lastPage: lastPage ?? this.lastPage,
      totalPages: totalPages ?? this.totalPages,
      favourite: favourite ?? this.favourite,
      progress: progress ?? this.progress,
      lastRead: lastRead ?? this.lastRead,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (documentId.present) {
      map['document_id'] = Variable<int>(documentId.value);
    }
    if (lastPage.present) {
      map['last_page'] = Variable<int>(lastPage.value);
    }
    if (totalPages.present) {
      map['total_pages'] = Variable<int>(totalPages.value);
    }
    if (favourite.present) {
      map['favourite'] = Variable<bool>(favourite.value);
    }
    if (progress.present) {
      map['progress'] = Variable<double>(progress.value);
    }
    if (lastRead.present) {
      map['last_read'] = Variable<DateTime>(lastRead.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReadingsCompanion(')
          ..write('id: $id, ')
          ..write('documentId: $documentId, ')
          ..write('lastPage: $lastPage, ')
          ..write('totalPages: $totalPages, ')
          ..write('favourite: $favourite, ')
          ..write('progress: $progress, ')
          ..write('lastRead: $lastRead')
          ..write(')'))
        .toString();
  }
}

class $WorkingsTable extends Workings with TableInfo<$WorkingsTable, Working> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorkingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _documentIdMeta = const VerificationMeta(
    'documentId',
  );
  @override
  late final GeneratedColumn<int> documentId = GeneratedColumn<int>(
    'document_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastModifiedMeta = const VerificationMeta(
    'lastModified',
  );
  @override
  late final GeneratedColumn<DateTime> lastModified = GeneratedColumn<DateTime>(
    'last_modified',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [id, documentId, lastModified];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'workings';
  @override
  VerificationContext validateIntegrity(
    Insertable<Working> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('document_id')) {
      context.handle(
        _documentIdMeta,
        documentId.isAcceptableOrUnknown(data['document_id']!, _documentIdMeta),
      );
    } else if (isInserting) {
      context.missing(_documentIdMeta);
    }
    if (data.containsKey('last_modified')) {
      context.handle(
        _lastModifiedMeta,
        lastModified.isAcceptableOrUnknown(
          data['last_modified']!,
          _lastModifiedMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Working map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Working(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      documentId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}document_id'],
      )!,
      lastModified: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_modified'],
      )!,
    );
  }

  @override
  $WorkingsTable createAlias(String alias) {
    return $WorkingsTable(attachedDatabase, alias);
  }
}

class Working extends DataClass implements Insertable<Working> {
  final int id;
  final int documentId;
  final DateTime lastModified;
  const Working({
    required this.id,
    required this.documentId,
    required this.lastModified,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['document_id'] = Variable<int>(documentId);
    map['last_modified'] = Variable<DateTime>(lastModified);
    return map;
  }

  WorkingsCompanion toCompanion(bool nullToAbsent) {
    return WorkingsCompanion(
      id: Value(id),
      documentId: Value(documentId),
      lastModified: Value(lastModified),
    );
  }

  factory Working.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Working(
      id: serializer.fromJson<int>(json['id']),
      documentId: serializer.fromJson<int>(json['documentId']),
      lastModified: serializer.fromJson<DateTime>(json['lastModified']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'documentId': serializer.toJson<int>(documentId),
      'lastModified': serializer.toJson<DateTime>(lastModified),
    };
  }

  Working copyWith({int? id, int? documentId, DateTime? lastModified}) =>
      Working(
        id: id ?? this.id,
        documentId: documentId ?? this.documentId,
        lastModified: lastModified ?? this.lastModified,
      );
  Working copyWithCompanion(WorkingsCompanion data) {
    return Working(
      id: data.id.present ? data.id.value : this.id,
      documentId: data.documentId.present
          ? data.documentId.value
          : this.documentId,
      lastModified: data.lastModified.present
          ? data.lastModified.value
          : this.lastModified,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Working(')
          ..write('id: $id, ')
          ..write('documentId: $documentId, ')
          ..write('lastModified: $lastModified')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, documentId, lastModified);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Working &&
          other.id == this.id &&
          other.documentId == this.documentId &&
          other.lastModified == this.lastModified);
}

class WorkingsCompanion extends UpdateCompanion<Working> {
  final Value<int> id;
  final Value<int> documentId;
  final Value<DateTime> lastModified;
  const WorkingsCompanion({
    this.id = const Value.absent(),
    this.documentId = const Value.absent(),
    this.lastModified = const Value.absent(),
  });
  WorkingsCompanion.insert({
    this.id = const Value.absent(),
    required int documentId,
    this.lastModified = const Value.absent(),
  }) : documentId = Value(documentId);
  static Insertable<Working> custom({
    Expression<int>? id,
    Expression<int>? documentId,
    Expression<DateTime>? lastModified,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (documentId != null) 'document_id': documentId,
      if (lastModified != null) 'last_modified': lastModified,
    });
  }

  WorkingsCompanion copyWith({
    Value<int>? id,
    Value<int>? documentId,
    Value<DateTime>? lastModified,
  }) {
    return WorkingsCompanion(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
      lastModified: lastModified ?? this.lastModified,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (documentId.present) {
      map['document_id'] = Variable<int>(documentId.value);
    }
    if (lastModified.present) {
      map['last_modified'] = Variable<DateTime>(lastModified.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorkingsCompanion(')
          ..write('id: $id, ')
          ..write('documentId: $documentId, ')
          ..write('lastModified: $lastModified')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $DocumentsTable documents = $DocumentsTable(this);
  late final $ReadingsTable readings = $ReadingsTable(this);
  late final $WorkingsTable workings = $WorkingsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    documents,
    readings,
    workings,
  ];
}

typedef $$DocumentsTableCreateCompanionBuilder =
    DocumentsCompanion Function({
      Value<int> id,
      required String title,
      Value<String?> coverUrl,
      Value<String?> author,
      Value<String?> language,
      Value<String?> series,
      Value<String?> tags,
      Value<String?> publisher,
      Value<String?> country,
      Value<bool> rtl,
    });
typedef $$DocumentsTableUpdateCompanionBuilder =
    DocumentsCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String?> coverUrl,
      Value<String?> author,
      Value<String?> language,
      Value<String?> series,
      Value<String?> tags,
      Value<String?> publisher,
      Value<String?> country,
      Value<bool> rtl,
    });

class $$DocumentsTableFilterComposer
    extends Composer<_$AppDatabase, $DocumentsTable> {
  $$DocumentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get coverUrl => $composableBuilder(
    column: $table.coverUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get author => $composableBuilder(
    column: $table.author,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get language => $composableBuilder(
    column: $table.language,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get series => $composableBuilder(
    column: $table.series,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tags => $composableBuilder(
    column: $table.tags,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get publisher => $composableBuilder(
    column: $table.publisher,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get country => $composableBuilder(
    column: $table.country,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get rtl => $composableBuilder(
    column: $table.rtl,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DocumentsTableOrderingComposer
    extends Composer<_$AppDatabase, $DocumentsTable> {
  $$DocumentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get coverUrl => $composableBuilder(
    column: $table.coverUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get author => $composableBuilder(
    column: $table.author,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get language => $composableBuilder(
    column: $table.language,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get series => $composableBuilder(
    column: $table.series,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tags => $composableBuilder(
    column: $table.tags,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get publisher => $composableBuilder(
    column: $table.publisher,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get country => $composableBuilder(
    column: $table.country,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get rtl => $composableBuilder(
    column: $table.rtl,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DocumentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DocumentsTable> {
  $$DocumentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get coverUrl =>
      $composableBuilder(column: $table.coverUrl, builder: (column) => column);

  GeneratedColumn<String> get author =>
      $composableBuilder(column: $table.author, builder: (column) => column);

  GeneratedColumn<String> get language =>
      $composableBuilder(column: $table.language, builder: (column) => column);

  GeneratedColumn<String> get series =>
      $composableBuilder(column: $table.series, builder: (column) => column);

  GeneratedColumn<String> get tags =>
      $composableBuilder(column: $table.tags, builder: (column) => column);

  GeneratedColumn<String> get publisher =>
      $composableBuilder(column: $table.publisher, builder: (column) => column);

  GeneratedColumn<String> get country =>
      $composableBuilder(column: $table.country, builder: (column) => column);

  GeneratedColumn<bool> get rtl =>
      $composableBuilder(column: $table.rtl, builder: (column) => column);
}

class $$DocumentsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DocumentsTable,
          Document,
          $$DocumentsTableFilterComposer,
          $$DocumentsTableOrderingComposer,
          $$DocumentsTableAnnotationComposer,
          $$DocumentsTableCreateCompanionBuilder,
          $$DocumentsTableUpdateCompanionBuilder,
          (Document, BaseReferences<_$AppDatabase, $DocumentsTable, Document>),
          Document,
          PrefetchHooks Function()
        > {
  $$DocumentsTableTableManager(_$AppDatabase db, $DocumentsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DocumentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DocumentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DocumentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> coverUrl = const Value.absent(),
                Value<String?> author = const Value.absent(),
                Value<String?> language = const Value.absent(),
                Value<String?> series = const Value.absent(),
                Value<String?> tags = const Value.absent(),
                Value<String?> publisher = const Value.absent(),
                Value<String?> country = const Value.absent(),
                Value<bool> rtl = const Value.absent(),
              }) => DocumentsCompanion(
                id: id,
                title: title,
                coverUrl: coverUrl,
                author: author,
                language: language,
                series: series,
                tags: tags,
                publisher: publisher,
                country: country,
                rtl: rtl,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                Value<String?> coverUrl = const Value.absent(),
                Value<String?> author = const Value.absent(),
                Value<String?> language = const Value.absent(),
                Value<String?> series = const Value.absent(),
                Value<String?> tags = const Value.absent(),
                Value<String?> publisher = const Value.absent(),
                Value<String?> country = const Value.absent(),
                Value<bool> rtl = const Value.absent(),
              }) => DocumentsCompanion.insert(
                id: id,
                title: title,
                coverUrl: coverUrl,
                author: author,
                language: language,
                series: series,
                tags: tags,
                publisher: publisher,
                country: country,
                rtl: rtl,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DocumentsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DocumentsTable,
      Document,
      $$DocumentsTableFilterComposer,
      $$DocumentsTableOrderingComposer,
      $$DocumentsTableAnnotationComposer,
      $$DocumentsTableCreateCompanionBuilder,
      $$DocumentsTableUpdateCompanionBuilder,
      (Document, BaseReferences<_$AppDatabase, $DocumentsTable, Document>),
      Document,
      PrefetchHooks Function()
    >;
typedef $$ReadingsTableCreateCompanionBuilder =
    ReadingsCompanion Function({
      Value<int> id,
      required int documentId,
      Value<int> lastPage,
      Value<int> totalPages,
      Value<bool> favourite,
      Value<double> progress,
      Value<DateTime> lastRead,
    });
typedef $$ReadingsTableUpdateCompanionBuilder =
    ReadingsCompanion Function({
      Value<int> id,
      Value<int> documentId,
      Value<int> lastPage,
      Value<int> totalPages,
      Value<bool> favourite,
      Value<double> progress,
      Value<DateTime> lastRead,
    });

class $$ReadingsTableFilterComposer
    extends Composer<_$AppDatabase, $ReadingsTable> {
  $$ReadingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get documentId => $composableBuilder(
    column: $table.documentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get lastPage => $composableBuilder(
    column: $table.lastPage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get totalPages => $composableBuilder(
    column: $table.totalPages,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get favourite => $composableBuilder(
    column: $table.favourite,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get progress => $composableBuilder(
    column: $table.progress,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastRead => $composableBuilder(
    column: $table.lastRead,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ReadingsTableOrderingComposer
    extends Composer<_$AppDatabase, $ReadingsTable> {
  $$ReadingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get documentId => $composableBuilder(
    column: $table.documentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get lastPage => $composableBuilder(
    column: $table.lastPage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get totalPages => $composableBuilder(
    column: $table.totalPages,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get favourite => $composableBuilder(
    column: $table.favourite,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get progress => $composableBuilder(
    column: $table.progress,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastRead => $composableBuilder(
    column: $table.lastRead,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ReadingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ReadingsTable> {
  $$ReadingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get documentId => $composableBuilder(
    column: $table.documentId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get lastPage =>
      $composableBuilder(column: $table.lastPage, builder: (column) => column);

  GeneratedColumn<int> get totalPages => $composableBuilder(
    column: $table.totalPages,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get favourite =>
      $composableBuilder(column: $table.favourite, builder: (column) => column);

  GeneratedColumn<double> get progress =>
      $composableBuilder(column: $table.progress, builder: (column) => column);

  GeneratedColumn<DateTime> get lastRead =>
      $composableBuilder(column: $table.lastRead, builder: (column) => column);
}

class $$ReadingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ReadingsTable,
          Reading,
          $$ReadingsTableFilterComposer,
          $$ReadingsTableOrderingComposer,
          $$ReadingsTableAnnotationComposer,
          $$ReadingsTableCreateCompanionBuilder,
          $$ReadingsTableUpdateCompanionBuilder,
          (Reading, BaseReferences<_$AppDatabase, $ReadingsTable, Reading>),
          Reading,
          PrefetchHooks Function()
        > {
  $$ReadingsTableTableManager(_$AppDatabase db, $ReadingsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReadingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReadingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReadingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> documentId = const Value.absent(),
                Value<int> lastPage = const Value.absent(),
                Value<int> totalPages = const Value.absent(),
                Value<bool> favourite = const Value.absent(),
                Value<double> progress = const Value.absent(),
                Value<DateTime> lastRead = const Value.absent(),
              }) => ReadingsCompanion(
                id: id,
                documentId: documentId,
                lastPage: lastPage,
                totalPages: totalPages,
                favourite: favourite,
                progress: progress,
                lastRead: lastRead,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int documentId,
                Value<int> lastPage = const Value.absent(),
                Value<int> totalPages = const Value.absent(),
                Value<bool> favourite = const Value.absent(),
                Value<double> progress = const Value.absent(),
                Value<DateTime> lastRead = const Value.absent(),
              }) => ReadingsCompanion.insert(
                id: id,
                documentId: documentId,
                lastPage: lastPage,
                totalPages: totalPages,
                favourite: favourite,
                progress: progress,
                lastRead: lastRead,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ReadingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ReadingsTable,
      Reading,
      $$ReadingsTableFilterComposer,
      $$ReadingsTableOrderingComposer,
      $$ReadingsTableAnnotationComposer,
      $$ReadingsTableCreateCompanionBuilder,
      $$ReadingsTableUpdateCompanionBuilder,
      (Reading, BaseReferences<_$AppDatabase, $ReadingsTable, Reading>),
      Reading,
      PrefetchHooks Function()
    >;
typedef $$WorkingsTableCreateCompanionBuilder =
    WorkingsCompanion Function({
      Value<int> id,
      required int documentId,
      Value<DateTime> lastModified,
    });
typedef $$WorkingsTableUpdateCompanionBuilder =
    WorkingsCompanion Function({
      Value<int> id,
      Value<int> documentId,
      Value<DateTime> lastModified,
    });

class $$WorkingsTableFilterComposer
    extends Composer<_$AppDatabase, $WorkingsTable> {
  $$WorkingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get documentId => $composableBuilder(
    column: $table.documentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastModified => $composableBuilder(
    column: $table.lastModified,
    builder: (column) => ColumnFilters(column),
  );
}

class $$WorkingsTableOrderingComposer
    extends Composer<_$AppDatabase, $WorkingsTable> {
  $$WorkingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get documentId => $composableBuilder(
    column: $table.documentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastModified => $composableBuilder(
    column: $table.lastModified,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$WorkingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $WorkingsTable> {
  $$WorkingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get documentId => $composableBuilder(
    column: $table.documentId,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastModified => $composableBuilder(
    column: $table.lastModified,
    builder: (column) => column,
  );
}

class $$WorkingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WorkingsTable,
          Working,
          $$WorkingsTableFilterComposer,
          $$WorkingsTableOrderingComposer,
          $$WorkingsTableAnnotationComposer,
          $$WorkingsTableCreateCompanionBuilder,
          $$WorkingsTableUpdateCompanionBuilder,
          (Working, BaseReferences<_$AppDatabase, $WorkingsTable, Working>),
          Working,
          PrefetchHooks Function()
        > {
  $$WorkingsTableTableManager(_$AppDatabase db, $WorkingsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WorkingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WorkingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WorkingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> documentId = const Value.absent(),
                Value<DateTime> lastModified = const Value.absent(),
              }) => WorkingsCompanion(
                id: id,
                documentId: documentId,
                lastModified: lastModified,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int documentId,
                Value<DateTime> lastModified = const Value.absent(),
              }) => WorkingsCompanion.insert(
                id: id,
                documentId: documentId,
                lastModified: lastModified,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$WorkingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WorkingsTable,
      Working,
      $$WorkingsTableFilterComposer,
      $$WorkingsTableOrderingComposer,
      $$WorkingsTableAnnotationComposer,
      $$WorkingsTableCreateCompanionBuilder,
      $$WorkingsTableUpdateCompanionBuilder,
      (Working, BaseReferences<_$AppDatabase, $WorkingsTable, Working>),
      Working,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$DocumentsTableTableManager get documents =>
      $$DocumentsTableTableManager(_db, _db.documents);
  $$ReadingsTableTableManager get readings =>
      $$ReadingsTableTableManager(_db, _db.readings);
  $$WorkingsTableTableManager get workings =>
      $$WorkingsTableTableManager(_db, _db.workings);
}
