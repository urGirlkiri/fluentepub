import 'package:fluentepub/config/context.dart';
import 'package:fluentepub/config/filters.dart';
import 'package:fluentepub/database/index.dart';
import 'package:fluentepub/features/home/widgets/recent_docs/card.dart';
import 'package:fluentepub/features/home/widgets/sort_by.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

class RecentDocuments extends StatefulWidget {
  const RecentDocuments({super.key});

  @override
  State<RecentDocuments> createState() => _RecentDocumentsState();
}

class _RecentDocumentsState extends State<RecentDocuments> {
  String _selectedSort = Filters.defaultFilter;
  late Stream<List<Document>> _documentsStream;
  final Logger _logger = Logger('RecentDocuments');

  @override
  void initState() {
    super.initState();
    _documentsStream = context.db.select(context.db.documents).watch();
  }

  List<Document> _filterDocuments(List<Document> documents, String query) {
    if (query.isEmpty) return documents;

    final lowerQuery = query.toLowerCase();
    return documents.where((doc) {
      return doc.title.toLowerCase().contains(lowerQuery) ||
          (doc.author ?? '').toLowerCase().contains(lowerQuery) ||
          (doc.series ?? '').toLowerCase().contains(lowerQuery) ||
          (doc.tags ?? '').toLowerCase().contains(lowerQuery) ||
          (doc.publisher ?? '').toLowerCase().contains(lowerQuery);
    }).toList();
  }

  List<Document> _sortDocuments(List<Document> documents) {
    final sorted = List<Document>.from(documents);

    switch (_selectedSort) {
      case Filters.titleAZ:
        sorted.sort((a, b) => a.title.compareTo(b.title));
        break;
      case Filters.favourites:
        return sorted.where((doc) => doc.favourite).toList()
          ..sort((a, b) => b.lastModified.compareTo(a.lastModified));
      case Filters.lastModified:
        sorted.sort((a, b) => b.lastModified.compareTo(a.lastModified));
        break;
      case Filters.lastRead:
        sorted.sort((a, b) => b.progress.compareTo(a.progress));
        break;
      case Filters.recentlyAdded:
      default:
        sorted.sort((a, b) => b.lastModified.compareTo(a.lastModified));
        break;
    }

    return sorted;
  }

  @override
  Widget build(BuildContext context) {
    final searchQuery = context.watchDoc.searchQuery;
    _logger.info('Search query: $searchQuery');

    return SliverMainAxisGroup(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16.0, right: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Recents', style: TextStyle(fontSize: 18)),
                Row(
                  children: [
                    const Text(
                      'Sort by ',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(width: 12),
                    SortBy(
                      value: _selectedSort,
                      onChanged: (value) {
                        setState(() {
                          _selectedSort = value;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        StreamBuilder<List<Document>>(
          stream: _documentsStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator()),
              );
            }

            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const SliverToBoxAdapter(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(32.0),
                    child: Text(
                      "Your library is empty. Create or import a document above.",
                    ),
                  ),
                ),
              );
            }

            final filtered = _filterDocuments(snapshot.data!, searchQuery);
            final documents = _sortDocuments(filtered);
            if (documents.isEmpty) {
              return const SliverToBoxAdapter(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(32.0),
                    child: Text("No document found."),
                  ),
                ),
              );
            }
            return SliverGrid.builder(
              itemCount: documents.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300,
                mainAxisExtent: 350,
                crossAxisSpacing: 14,
                mainAxisSpacing: 20,
              ),
              itemBuilder: (context, index) {
                final novel = documents[index];
                return DocCard(novel: novel);
              },
            );
          },
        ),
      ],
    );
  }
}
