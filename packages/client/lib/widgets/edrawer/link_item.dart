import 'package:material_ui/material_ui.dart';

class LinkItem {
  final IconData icon;
  final String name;
  final String routeName;
  final String? url;

  const LinkItem({required this.icon, required this.name, required this.routeName, this.url});
}
