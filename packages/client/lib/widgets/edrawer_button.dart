import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class EDrawerButton extends StatefulWidget {
  const EDrawerButton({super.key});

  @override
  State<EDrawerButton> createState() => _EDrawerButtonState();
}

class _EDrawerButtonState extends State<EDrawerButton> {
  @override
  Widget build(BuildContext context) {

    return IconButton(
      onPressed: () => Scaffold.of(context).openDrawer(), 
      icon: Icon(LucideIcons.menu, size: 40)
    );
  }
}