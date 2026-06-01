class Filters {
  static const List<String> all = [
    lastRead,
    titleAZ,
    favourites,
    recentlyAdded,
    lastModified,
  ];

  static const String lastRead = 'Last Read';

  static const String titleAZ = 'Title (A-Z)';

  static const String favourites = 'Favourites';

  static const String recentlyAdded = 'Recently Added';

  static const String lastModified = 'Last Modified';

  static String get defaultFilter => recentlyAdded;
}
