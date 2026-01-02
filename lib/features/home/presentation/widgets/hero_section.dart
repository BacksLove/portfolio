import 'package:backs_portfolio_v2/core/theme/app_theme.dart';
import 'package:backs_portfolio_v2/core/utils/responsive_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:backs_portfolio_v2/l10n/app_localizations.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onContactTap;

  const HeroSection({super.key, required this.onContactTap});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isMobile = ResponsiveWidget.isMobile(context);
    final size = MediaQuery.of(context).size;

    return Container(
      constraints: BoxConstraints(minHeight: size.height * 0.9),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 100,
        vertical: 50,
      ),
      child: Flex(
        direction: isMobile ? Axis.vertical : Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: isMobile ? 0 : 1,
            child: Column(
              crossAxisAlignment: isMobile
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  l10n.heroGreeting,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppTheme.primaryColor,
                  ),
                ).animate().fadeIn(duration: 600.ms).slideX(),
                const SizedBox(height: 10),
                Text(
                  l10n.heroName,
                  style: isMobile
                      ? Theme.of(context).textTheme.displayMedium
                      : Theme.of(context).textTheme.displayLarge,
                  textAlign: isMobile ? TextAlign.center : TextAlign.start,
                ).animate().fadeIn(delay: 200.ms, duration: 600.ms).slideX(),
                Text(
                  l10n.heroTitle,
                  style:
                      (isMobile
                              ? Theme.of(context).textTheme.headlineSmall
                              : Theme.of(context).textTheme.headlineMedium)
                          ?.copyWith(color: AppTheme.subTextColor),
                  textAlign: isMobile ? TextAlign.center : TextAlign.start,
                ).animate().fadeIn(delay: 400.ms, duration: 600.ms).slideX(),
                const SizedBox(height: 20),
                Text(
                  l10n.heroDescription,
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: isMobile ? TextAlign.center : TextAlign.start,
                ).animate().fadeIn(delay: 600.ms, duration: 600.ms).slideX(),
                const SizedBox(height: 40),
                Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      alignment: isMobile
                          ? WrapAlignment.center
                          : WrapAlignment.start,
                      children: [
                        ElevatedButton(
                          onPressed: onContactTap,
                          child: Text(l10n.heroContactMe),
                        ),
                        OutlinedButton(
                          onPressed: () {
                            // TODO: Add CV URL
                          },
                          child: Text(l10n.heroDownloadCv),
                        ),
                      ],
                    )
                    .animate()
                    .fadeIn(delay: 800.ms, duration: 600.ms)
                    .slideY(begin: 0.2),
              ],
            ),
          ),
          if (!isMobile) const SizedBox(width: 50),
          if (!isMobile)
            Expanded(
              flex: 1,
              child: Center(
                child: Container(
                  width: 500,
                  height: 500,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppTheme.primaryColor, width: 4),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/profile.jpg'),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppTheme.primaryColor.withOpacity(0.3),
                        blurRadius: 30,
                        spreadRadius: 10,
                      ),
                    ],
                  ),
                ).animate().fadeIn(delay: 400.ms, duration: 800.ms).scale(),
              ),
            ),
        ],
      ),
    );
  }
}
