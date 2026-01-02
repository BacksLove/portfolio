import 'package:backs_portfolio_v2/core/providers/locale_provider.dart';
import 'package:backs_portfolio_v2/core/theme/app_theme.dart';
import 'package:backs_portfolio_v2/core/utils/responsive_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:backs_portfolio_v2/l10n/app_localizations.dart';

class NavBar extends ConsumerWidget {
  final Function(int) onNavTap;

  const NavBar({super.key, required this.onNavTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final isMobile = ResponsiveWidget.isMobile(context);
    final locale = ref.watch(localeProvider);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 50,
        vertical: 20,
      ),
      color: AppTheme.backgroundColor.withOpacity(0.9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                'BT.',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: AppTheme.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(width: 20),
              // Language Switch
              InkWell(
                onTap: () {
                  ref.read(localeProvider.notifier).toggleLocale();
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppTheme.primaryColor),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    locale.languageCode.toUpperCase(),
                    style: const TextStyle(
                      color: AppTheme.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          if (!isMobile)
            Row(
              children: [
                _NavItem(title: l10n.navHome, onTap: () => onNavTap(0)),
                _NavItem(title: l10n.navSkills, onTap: () => onNavTap(1)),
                _NavItem(title: l10n.navServices, onTap: () => onNavTap(2)),
                _NavItem(title: l10n.navAbout, onTap: () => onNavTap(3)),
                _NavItem(title: l10n.navExperience, onTap: () => onNavTap(4)),
                _NavItem(title: l10n.navProjects, onTap: () => onNavTap(5)),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => onNavTap(6),
                  child: Text(l10n.navContact),
                ),
              ],
            ),
          if (isMobile)
            IconButton(
              icon: const Icon(Icons.menu, color: AppTheme.textColor),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _NavItem({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        onTap: onTap,
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
