import 'package:backs_portfolio_v2/core/theme/app_theme.dart';
import 'package:backs_portfolio_v2/core/utils/responsive_widget.dart';
import 'package:flutter/material.dart';
import 'package:backs_portfolio_v2/l10n/app_localizations.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isMobile = ResponsiveWidget.isMobile(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 100,
        vertical: 80,
      ),
      width: double.infinity,
      child: Column(
        children: [
          Text(
            l10n.educationTitle,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: AppTheme.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 40),
          _EducationItem(
            degree: l10n.educationMaster,
            school: l10n.educationMasterSchool,
          ),
          const SizedBox(height: 30),
          _EducationItem(
            degree: l10n.educationBachelor,
            school: l10n.educationBachelorSchool,
          ),
          const SizedBox(height: 60),
          Text(
            l10n.languagesTitle,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: AppTheme.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 30),
          Wrap(
            spacing: 30,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: [
              _LanguageItem(text: l10n.languageFrench),
              _LanguageItem(text: l10n.languageEnglish),
            ],
          ),
        ],
      ),
    );
  }
}

class _EducationItem extends StatelessWidget {
  final String degree;
  final String school;

  const _EducationItem({required this.degree, required this.school});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          degree,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: AppTheme.textColor,
                fontWeight: FontWeight.bold,
              ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 5),
        Text(
          school,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.grey,
              ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _LanguageItem extends StatelessWidget {
  final String text;

  const _LanguageItem({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: AppTheme.primaryColor),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(color: AppTheme.textColor, fontSize: 16),
      ),
    );
  }
}
