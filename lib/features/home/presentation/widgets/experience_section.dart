import 'package:backs_portfolio_v2/core/theme/app_theme.dart';
import 'package:backs_portfolio_v2/core/utils/responsive_widget.dart';
import 'package:backs_portfolio_v2/features/portfolio/domain/entities/portfolio_entities.dart';
import 'package:backs_portfolio_v2/features/portfolio/presentation/pages/experience_detail_page.dart';
import 'package:backs_portfolio_v2/features/portfolio/presentation/providers/portfolio_providers.dart';
import 'package:backs_portfolio_v2/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExperienceSection extends ConsumerStatefulWidget {
  const ExperienceSection({super.key});

  @override
  ConsumerState<ExperienceSection> createState() => _ExperienceSectionState();
}

class _ExperienceSectionState extends ConsumerState<ExperienceSection> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final experienceAsync = ref.watch(experienceProvider);
    final isMobile = ResponsiveWidget.isMobile(context);
    final l10n = AppLocalizations.of(context)!;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 100,
        vertical: 80,
      ),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '${l10n.experienceTitle}.',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: AppTheme.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 50),
          experienceAsync.when(
            data: (experiences) {
              if (isMobile) {
                return _buildMobileLayout(experiences);
              }
              return _buildDesktopLayout(experiences);
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) => Text('Error: $err'),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout(List<Experience> experiences) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Tabs
        SizedBox(
          width: 200,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: experiences.length,
            itemBuilder: (context, index) {
              final isSelected = _selectedIndex == index;
              return InkWell(
                onTap: () => setState(() => _selectedIndex = index),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(
                        color: isSelected ? AppTheme.primaryColor : AppTheme.subTextColor.withOpacity(0.3),
                        width: 3,
                      ),
                    ),
                    color: isSelected ? AppTheme.primaryColor.withOpacity(0.1) : null,
                  ),
                  child: Text(
                    experiences[index].company,
                    style: TextStyle(
                      color: isSelected ? AppTheme.primaryColor : AppTheme.subTextColor,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      fontSize: 16,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(width: 50),
        // Content
        Expanded(
          child: _ExperienceContent(experience: experiences[_selectedIndex]),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(List<Experience> experiences) {
    return Column(
      children: experiences.map((exp) {
        return Container(
          margin: const EdgeInsets.only(bottom: 40),
          child: _ExperienceContent(experience: exp),
        );
      }).toList(),
    );
  }
}

class _ExperienceContent extends StatelessWidget {
  final Experience experience;

  const _ExperienceContent({required this.experience});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: experience.role,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textColor,
                    ),
              ),
              TextSpan(
                text: ' @ ${experience.company}',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primaryColor,
                    ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Text(
          experience.period,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.grey,
                fontFamily: 'monospace',
              ),
        ),
        const SizedBox(height: 20),
        Align(
          alignment: Alignment.centerLeft,
          child: TextButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ExperienceDetailPage(experience: experience),
                ),
              );
            },
            icon: const Icon(Icons.arrow_forward, size: 16),
            label: Text(
              Localizations.localeOf(context).languageCode == 'fr'
                  ? 'Voir détails'
                  : 'View Details',
            ),
            style: TextButton.styleFrom(
              foregroundColor: AppTheme.primaryColor,
            ),
          ),
        ),
        ...experience.description.map((desc) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.arrow_right,
                    color: AppTheme.primaryColor,
                    size: 20,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      desc,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: AppTheme.subTextColor,
                            height: 1.5,
                          ),
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }
}
