import 'package:backs_portfolio_v2/core/theme/app_theme.dart';
import 'package:backs_portfolio_v2/core/utils/responsive_widget.dart';
import 'package:backs_portfolio_v2/features/portfolio/presentation/providers/portfolio_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:backs_portfolio_v2/l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ServicesSection extends ConsumerWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final servicesAsync = ref.watch(servicesProvider);
    final l10n = AppLocalizations.of(context)!;
    final isMobile = ResponsiveWidget.isMobile(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 100,
        vertical: 50,
      ),
      width: double.infinity,
      color: AppTheme.surfaceColor.withOpacity(0.3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            l10n.servicesTitle,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: AppTheme.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 50),
          servicesAsync.when(
            data: (services) {
              return Wrap(
                spacing: 30,
                runSpacing: 30,
                alignment: WrapAlignment.center,
                children: services.map((service) {
                  return Container(
                    width: isMobile ? double.infinity : 350,
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      color: AppTheme.surfaceColor,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Icon(
                          _getIcon(service.iconCode),
                          size: 50,
                          color: AppTheme.primaryColor,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          _getLocalizedText(context, service.titleKey),
                          style: Theme.of(context).textTheme.titleLarge,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 15),
                        Text(
                          _getLocalizedText(context, service.descriptionKey),
                          style: Theme.of(context).textTheme.bodyMedium,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                }).toList(),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) => Text('Error: $err'),
          ),
        ],
      ),
    );
  }

  IconData _getIcon(String code) {
    switch (code) {
      case 'mobile':
        return FontAwesomeIcons.mobileScreen;
      case 'layer-group':
        return FontAwesomeIcons.layerGroup;
      case 'users':
        return FontAwesomeIcons.users;
      default:
        return FontAwesomeIcons.code;
    }
  }

  String _getLocalizedText(BuildContext context, String key) {
    final l10n = AppLocalizations.of(context)!;
    switch (key) {
      case 'serviceMobileTitle':
        return l10n.serviceMobileTitle;
      case 'serviceMobileDesc':
        return l10n.serviceMobileDesc;
      case 'serviceArchTitle':
        return l10n.serviceArchTitle;
      case 'serviceArchDesc':
        return l10n.serviceArchDesc;
      case 'serviceLeadTitle':
        return l10n.serviceLeadTitle;
      case 'serviceLeadDesc':
        return l10n.serviceLeadDesc;
      default:
        return key;
    }
  }
}
