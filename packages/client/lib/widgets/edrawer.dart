import 'package:fluentepub/config/palette.dart';
import 'package:fluentepub/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class LinkItem {
  final IconData icon;
  final String name;

  const LinkItem({required this.icon, required this.name});
}

class EDrawer extends StatelessWidget {
  static const Palette palette = Palette();
  static const List<LinkItem> linkItems = [
    LinkItem(icon: LucideIcons.hardDriveUpload, name: "Cloud Sync"),
  ];
  static const List<LinkItem> bottomLinkItems = [
    LinkItem(icon: LucideIcons.settings, name: "Settings"),
    LinkItem(icon: LucideIcons.circleQuestionMark, name: "Help & Feedback"),
  ];
  const EDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: SizedBox(
              height: 100,
              child: Row(
                children: [
                  Logo(size: 48),
                  const SizedBox(width: 12),
                  const Text(
                    'Fluent Epub',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Divider(height: .1),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...linkItems.map(
                    (item) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(item.icon, size: 32),
                          const SizedBox(width: 24),
                          Text(
                            item.name,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                  const Spacer(),

                  ...bottomLinkItems.map(
                    (item) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(item.icon, size: 32),
                          const SizedBox(width: 24),
                          Text(
                            item.name,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Privacy Policy'),
                const SizedBox(width: 1),
                const Icon(LucideIcons.dot),
                const SizedBox(width: 1),
                const Text('Terms of Service'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}