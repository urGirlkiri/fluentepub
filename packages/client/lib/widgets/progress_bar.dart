import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final int percent;

  const ProgressBar({super.key, required this.percent});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Container(
          width: double.infinity,
          height: 32,
          decoration: ShapeDecoration(
            color: theme.colorScheme.secondary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(60),
            ),
          ),
        ),

        FractionallySizedBox(
          widthFactor: (percent / 100).clamp(0.0, 1.0),

          child: Container(
            height: 32,
            decoration: ShapeDecoration(
              color: theme.colorScheme.surface,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(60),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            '$percent%',
            style: TextStyle(color: theme.colorScheme.onSurface),
          ),
        ),
      ],
    );
  }
}
