import 'package:fluentepub/config/router.dart';
import 'package:fluentepub/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:url_launcher/url_launcher.dart';

const String kLandinDomain = 'https://fluentepub.com';

class LinkItem {
  final IconData icon;
  final String name;
  final String routeName;
  final String? url;

  const LinkItem({required this.icon, required this.name, required this.routeName, this.url});
}

class EDrawer extends StatelessWidget {
  static const List<LinkItem> linkItems = [
    LinkItem(icon: LucideIcons.hardDriveUpload, name: "Cloud Sync", routeName: Routes.cloudSync),
  ];
  static const List<LinkItem> bottomLinkItems = [
    LinkItem(icon: LucideIcons.settings, name: "Settings", routeName: Routes.settings),
    LinkItem(icon: LucideIcons.circleQuestionMark, name: "Help & Feedback", routeName: Routes.helpFeedback),
  ];
  const EDrawer({super.key});

  void _handleNav(BuildContext context, LinkItem item) {
    if (item.url != null) {
      launchUrl(Uri.parse(item.url!));
    } else {
      context.pop();
      context.pushNamed(item.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => context.pushNamed(Routes.home),
            child: Padding(
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
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: IconButton(
                        onPressed: () => context.pop(),
                        icon: Icon(LucideIcons.chevronLeft, size: 24),
                      ),
                    ),
                  ],
                ),
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
                      child: GestureDetector(
                        onTap: () => _handleNav(context, item),
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
                  ),

                  const Spacer(),

                  ...bottomLinkItems.map(
                    (item) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () => _handleNav(context, item),
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
                GestureDetector(
                  onTap: () => launchUrl(Uri.parse('$kLandinDomain/privacy')),
                  child: const Text('Privacy Policy'),
                ),
                const SizedBox(width: 1),
                const Icon(LucideIcons.dot),
                const SizedBox(width: 1),
                GestureDetector(
                  onTap: () => launchUrl(Uri.parse('$kLandinDomain/terms')),
                  child: const Text('Terms of Service'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
