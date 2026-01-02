import 'package:backs_portfolio_v2/core/theme/app_theme.dart';
import 'package:backs_portfolio_v2/core/utils/responsive_widget.dart';
import 'package:flutter/material.dart';
import 'package:backs_portfolio_v2/l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

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
            l10n.contactTitle,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: AppTheme.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 50),
          Flex(
            direction: isMobile ? Axis.vertical : Axis.horizontal,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Contact Info
              Container(
                width: isMobile ? double.infinity : 400,
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: AppTheme.surfaceColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _ContactItem(
                      icon: Icons.location_on,
                      text: l10n.contactLocation,
                    ),
                    const SizedBox(height: 20),
                    _ContactItem(
                      icon: Icons.phone,
                      text: l10n.contactPhone,
                      onTap: () => _launchUrl('tel:${l10n.contactPhone}'),
                    ),
                    const SizedBox(height: 20),
                    _ContactItem(
                      icon: Icons.email,
                      text: l10n.contactEmail,
                      onTap: () => _launchUrl('mailto:${l10n.contactEmail}'),
                    ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const FaIcon(
                            FontAwesomeIcons.linkedin,
                            size: 30,
                          ),
                          onPressed: () => _launchUrl(
                            'https://www.linkedin.com/in/boubakar-traore-578211135',
                          ),
                          color: AppTheme.textColor,
                        ),
                        const SizedBox(width: 20),
                        IconButton(
                          icon: const FaIcon(FontAwesomeIcons.github, size: 30),
                          onPressed: () => _launchUrl(
                            'https://github.com/',
                          ), // Add GitHub if available
                          color: AppTheme.textColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (!isMobile) const SizedBox(width: 50),
              if (isMobile) const SizedBox(height: 50),
              // Contact Form (Visual only for now)
              Container(
                width: isMobile ? double.infinity : 500,
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: AppTheme.surfaceColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: l10n.contactNameLabel,
                        border: const OutlineInputBorder(),
                        filled: true,
                        fillColor: AppTheme.backgroundColor,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      decoration: InputDecoration(
                        labelText: l10n.contactEmailLabel,
                        border: const OutlineInputBorder(),
                        filled: true,
                        fillColor: AppTheme.backgroundColor,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      maxLines: 5,
                      decoration: InputDecoration(
                        labelText: l10n.contactMessageLabel,
                        border: const OutlineInputBorder(),
                        filled: true,
                        fillColor: AppTheme.backgroundColor,
                      ),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(l10n.contactSendButton),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }
}

class _ContactItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback? onTap;

  const _ContactItem({required this.icon, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, color: AppTheme.primaryColor),
          const SizedBox(width: 15),
          Expanded(
            child: Text(text, style: Theme.of(context).textTheme.bodyLarge),
          ),
        ],
      ),
    );
  }
}
