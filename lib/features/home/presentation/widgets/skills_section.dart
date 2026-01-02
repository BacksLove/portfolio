import 'package:backs_portfolio_v2/core/theme/app_theme.dart';
import 'package:backs_portfolio_v2/core/utils/responsive_widget.dart';
import 'package:backs_portfolio_v2/features/portfolio/domain/entities/portfolio_entities.dart';
import 'package:backs_portfolio_v2/features/portfolio/presentation/providers/portfolio_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:backs_portfolio_v2/l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SkillsSection extends ConsumerWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skillsAsync = ref.watch(skillsProvider);
    final l10n = AppLocalizations.of(context)!;
    final isMobile = ResponsiveWidget.isMobile(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 100,
        vertical: 60,
      ),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            l10n.skillsTitle,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: AppTheme.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          skillsAsync.when(
            data: (skills) {
              // Define the categories based on CV
              final categoryGroups = {
                'Languages': <Skill>[],
                'Frameworks': <Skill>[],
                'Databases': <Skill>[],
                'CI/CD & Testing': <Skill>[],
                'Tools & Architecture': <Skill>[],
                'Operating Systems': <Skill>[],
              };

              // Distribute skills into groups
              for (var skill in skills) {
                if (skill.category == 'Languages') {
                  categoryGroups['Languages']!.add(skill);
                } else if (skill.category == 'Frameworks') {
                  categoryGroups['Frameworks']!.add(skill);
                } else if (skill.category == 'Databases') {
                  categoryGroups['Databases']!.add(skill);
                } else if (skill.category == 'CI/CD' ||
                    skill.category == 'Testing') {
                  categoryGroups['CI/CD & Testing']!.add(skill);
                } else if (skill.category == 'Tools' ||
                    skill.category == 'Architecture') {
                  categoryGroups['Tools & Architecture']!.add(skill);
                } else if (skill.category == 'OS') {
                  categoryGroups['Operating Systems']!.add(skill);
                }
              }

              return Wrap(
                spacing: 20,
                runSpacing: 20,
                alignment: WrapAlignment.center,
                children: categoryGroups.entries.map((entry) {
                  return _CategoryCard(
                    title: entry.key,
                    skills: entry.value,
                    isMobile: isMobile,
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
}

class _CategoryCard extends StatefulWidget {
  final String title;
  final List<Skill> skills;
  final bool isMobile;

  const _CategoryCard({
    required this.title,
    required this.skills,
    required this.isMobile,
  });

  @override
  State<_CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<_CategoryCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: widget.isMobile ? double.infinity : 220,
        height: 320, // Fixed height for alignment
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppTheme.surfaceColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _isHovered ? AppTheme.primaryColor : Colors.white10,
            width: _isHovered ? 2 : 1,
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: AppTheme.primaryColor.withValues(alpha: 0.15),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: _isHovered ? AppTheme.primaryColor : Colors.white,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 15),
            Expanded(
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.skills.length,
                itemBuilder: (context, index) {
                  final skill = widget.skills[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Row(
                      children: [
                        if (skill.iconCode != null)
                          SizedBox(
                            width: 24,
                            child: FaIcon(
                              _getIcon(skill.iconCode!),
                              size: 18,
                              color: _getIconColor(skill.iconCode!),
                            ),
                          ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            skill.name,
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(
                                  color: Colors.grey[300],
                                  fontSize: 13,
                                ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getIconColor(String code) {
    switch (code) {
      case 'android':
        return const Color(0xFF3DDC84); // Android Green
      case 'swift':
        return const Color(0xFFF05138); // Swift Orange
      case 'flutter':
        return const Color(0xFF02569B); // Flutter Blue
      case 'java':
        return const Color(0xFF007396); // Java Blue
      case 'apple':
        return Colors.white; // Apple White
      case 'github':
        return Colors.white; // GitHub White
      case 'gitlab':
        return const Color(0xFFFC6D26); // GitLab Orange
      case 'git-alt':
        return const Color(0xFFF05032); // Git Orange
      case 'fire':
        return const Color(0xFFFFCA28); // Firebase Amber
      case 'database':
        return const Color(0xFF4DB33D); // MongoDB Green-ish
      case 'server':
        return const Color(0xFFCC2927); // SQL Red
      case 'rocket':
        return const Color(0xFF00C7B7); // Fastlane Teal
      case 'robot':
        return const Color(0xFF683D87); // Bitrise Purple
      case 'layer-group':
        return const Color(0xFF009688); // Architecture Teal
      case 'project-diagram':
        return const Color(0xFF2196F3); // MVVM Blue
      case 'cubes':
        return const Color(0xFF1565C0); // BloC Blue
      case 'box-open':
        return const Color(0xFFFF9800); // GetIt Orange
      case 'windows':
        return const Color(0xFF0078D6); // Windows Blue
      case 'ubuntu':
        return const Color(0xFFE95420); // Ubuntu Orange
      case 'php':
        return const Color(0xFF777BB4); // PHP Purple
      case 'python':
        return const Color(0xFF3776AB); // Python Blue
      case 'laravel':
        return const Color(0xFFFF2D20); // Laravel Red
      case 'bolt':
        return const Color(0xFF9C27B0); // GetX Purple
      case 'water':
        return const Color(0xFF2D9CDB); // Riverpod Blue
      case 'sitemap':
        return const Color(0xFF607D8B); // MVC/MVP Blue Grey
      case 'supabase':
        return const Color(0xFF3ECF8E); // Supabase Green
      case 'aws':
        return const Color(0xFFFF9900); // AWS Orange
      case 'code':
        return Colors.grey;
      default:
        return AppTheme.secondaryColor;
    }
  }

  IconData _getIcon(String code) {
    switch (code) {
      case 'android':
        return FontAwesomeIcons.android;
      case 'swift':
        return FontAwesomeIcons.swift;
      case 'flutter':
        return FontAwesomeIcons.flutter;
      case 'java':
        return FontAwesomeIcons.java;
      case 'apple':
        return FontAwesomeIcons.apple;
      case 'github':
        return FontAwesomeIcons.github;
      case 'gitlab':
        return FontAwesomeIcons.gitlab;
      case 'git-alt':
        return FontAwesomeIcons.gitAlt;
      case 'fire':
        return FontAwesomeIcons.fire;
      case 'database':
        return FontAwesomeIcons.database;
      case 'server':
        return FontAwesomeIcons.server;
      case 'rocket':
        return FontAwesomeIcons.rocket;
      case 'robot':
        return FontAwesomeIcons.robot;
      case 'layer-group':
        return FontAwesomeIcons.layerGroup;
      case 'project-diagram':
        return FontAwesomeIcons.diagramProject;
      case 'cubes':
        return FontAwesomeIcons.cubes;
      case 'box-open':
        return FontAwesomeIcons.boxOpen;
      case 'windows':
        return FontAwesomeIcons.windows;
      case 'ubuntu':
        return FontAwesomeIcons.ubuntu;
      case 'php':
        return FontAwesomeIcons.php;
      case 'python':
        return FontAwesomeIcons.python;
      case 'laravel':
        return FontAwesomeIcons.laravel;
      case 'bolt':
        return FontAwesomeIcons.bolt;
      case 'water':
        return FontAwesomeIcons.water;
      case 'sitemap':
        return FontAwesomeIcons.sitemap;
      case 'supabase':
        return FontAwesomeIcons.bolt;
      case 'aws':
        return FontAwesomeIcons.aws;
      case 'code':
        return FontAwesomeIcons.code;
      default:
        return FontAwesomeIcons.code;
    }
  }
}
