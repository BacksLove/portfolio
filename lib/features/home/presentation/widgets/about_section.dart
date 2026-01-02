import 'package:backs_portfolio_v2/core/theme/app_theme.dart';
import 'package:backs_portfolio_v2/core/utils/responsive_widget.dart';
import 'package:flutter/material.dart';
import 'package:backs_portfolio_v2/l10n/app_localizations.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isMobile = ResponsiveWidget.isMobile(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 100,
        vertical: 80,
      ),
      child: Column(
        children: [
          Text(
            l10n.aboutTitle,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: AppTheme.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 40),
          Container(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Text(
              l10n.aboutDescription,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(height: 1.6, fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 60),
          Wrap(
            spacing: 40,
            runSpacing: 40,
            alignment: WrapAlignment.center,
            children: [
              _StatItem(value: l10n.aboutExpYears, label: l10n.aboutExpLabel),
              _StatItem(
                value: l10n.aboutProjects,
                label: l10n.aboutProjectsLabel,
              ),
              _StatItem(
                value: l10n.aboutClients,
                label: l10n.aboutClientsLabel,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String value;
  final String label;

  const _StatItem({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
            color: AppTheme.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          label,
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(color: AppTheme.subTextColor),
        ),
      ],
    );
  }
}
