import 'package:fluentepub/features/cloud_sync/app/fluent_epub.dart';
import 'package:fluentepub/config/providers/document.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'dart:developer' as dev;

import 'package:provider/provider.dart';

void main() {
  Logger.root.level = kDebugMode ? Level.FINE : Level.INFO;
  Logger.root.onRecord.listen((record) {
    dev.log(
      record.message,
      time: record.time,
      level: record.level.value,
      name: record.loggerName,
    );
  });

  runApp(
    ChangeNotifierProvider(
      create: (context) => DocumentProvider(),
      child: const FluentEpub(),
    ),
  );
}
