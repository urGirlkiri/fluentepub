import 'package:flutter/material.dart';

class Logo extends StatefulWidget {
  final double size;
  const Logo({super.key, required this.size});

  @override
  State<Logo> createState() => _LogoState();
}

class _LogoState extends State<Logo> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    bool isDarkMode = theme.brightness == Brightness.dark;

    return Image.asset(
      isDarkMode
          ? 'assets/branding/512x512-dark.png'
          : 'assets/branding/512x512.png',
      width: widget.size,
      height: widget.size,
    );
  }
}
