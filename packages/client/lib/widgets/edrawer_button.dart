import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:material_ui/material_ui.dart';

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
      icon: const Icon(LucideIcons.menu, size: 40),
    );
  }
}
