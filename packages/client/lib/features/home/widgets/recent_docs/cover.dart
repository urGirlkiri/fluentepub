import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CoverImage extends StatelessWidget {
  final String? imagePath;
  const CoverImage({super.key, this.imagePath});

  @override
  Widget build(BuildContext context) {
    final path = imagePath ?? 'assets/images/blank.png';

    if (path.startsWith('assets/')) {
      return Image.asset(
        path,
        fit: BoxFit.cover,
        cacheWidth: 300,
        errorBuilder: (context, error, stackTrace) =>
            const Placeholder(color: Colors.red),
      );
    }

    if (kIsWeb || path.startsWith('http')) {
      return Image.network(
        path,
        fit: BoxFit.cover,
        cacheWidth: 300,
        errorBuilder: (context, error, stackTrace) =>
            const Placeholder(color: Colors.red),
      );
    }

    return Image.file(
      File(path),
      fit: BoxFit.cover,
      cacheWidth: 300,
      errorBuilder: (context, error, stackTrace) =>
          const Placeholder(color: Colors.red),
    );
  }
}
