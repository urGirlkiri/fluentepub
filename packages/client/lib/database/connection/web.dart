import 'package:drift/drift.dart';
import 'package:drift/wasm.dart';
import 'package:logging/logging.dart';

QueryExecutor openConnection() {
  final Logger log = Logger("Web Connector");
  return DatabaseConnection.delayed(
    Future(() async {
      final result = await WasmDatabase.open(
        databaseName: 'fluentepub_library',
        sqlite3Uri: Uri.parse('sqlite3.wasm'),
        driftWorkerUri: Uri.parse('drift_worker.js'),
      );

      if (result.missingFeatures.isNotEmpty) {
        log.warning('Missing browser features: ${result.missingFeatures}');
      }

      return result.resolvedExecutor;
    }),
  );
}
