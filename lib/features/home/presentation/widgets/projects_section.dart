import 'package:backs_portfolio_v2/core/theme/app_theme.dart';
import 'package:backs_portfolio_v2/core/utils/responsive_widget.dart';
import 'package:backs_portfolio_v2/features/portfolio/domain/entities/portfolio_entities.dart';
import 'package:backs_portfolio_v2/features/portfolio/presentation/pages/project_detail_page.dart';
import 'package:backs_portfolio_v2/features/portfolio/presentation/providers/portfolio_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:backs_portfolio_v2/l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsSection extends ConsumerWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectsAsync = ref.watch(projectsProvider);
    final l10n = AppLocalizations.of(context)!;
    final isMobile = ResponsiveWidget.isMobile(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 100,
        vertical: 80,
      ),
      color: AppTheme.surfaceColor.withOpacity(0.2),
      width: double.infinity,
      child: Column(
        children: [
          Text(
            l10n.projectsTitle,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: AppTheme.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 50),
          projectsAsync.when(
            data: (projects) {
              return Wrap(
                spacing: 30,
                runSpacing: 30,
                alignment: WrapAlignment.center,
                children: projects.map((project) {
                  return _ProjectCard(project: project, isMobile: isMobile);
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

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }
}

class _ProjectCard extends StatefulWidget {
  final Project project;
  final bool isMobile;

  const _ProjectCard({required this.project, required this.isMobile});

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProjectDetailPage(project: widget.project),
            ),
          );
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: widget.isMobile ? double.infinity : 380,
          height: widget.isMobile ? null : 680, // Reduced height
          decoration: BoxDecoration(
            color: AppTheme.surfaceColor,
            borderRadius: BorderRadius.circular(20),
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
          foregroundDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: _isHovered ? AppTheme.primaryColor : Colors.white10,
              width: _isHovered ? 2 : 1,
            ),
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header Image
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  width: double.infinity,
                  color: AppTheme.backgroundColor,
                  child: widget.project.imageUrl != null
                      ? Image.asset(
                          widget.project.imageUrl!,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Center(
                              child: FaIcon(
                                FontAwesomeIcons.image,
                                size: 40,
                                color: Colors.grey[700],
                              ),
                            );
                          },
                        )
                      : Center(
                          child: FaIcon(
                            FontAwesomeIcons.code,
                            size: 40,
                            color: AppTheme.primaryColor,
                          ),
                        ),
                ),
              ),

              // Content
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.project.title,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: _isHovered
                            ? AppTheme.primaryColor
                            : Colors.white,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      widget.project.description,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey[400],
                        height: 1.5,
                      ),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 20),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: widget.project.technologies.take(4).map((tech) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppTheme.primaryColor.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: AppTheme.primaryColor.withValues(
                                alpha: 0.3,
                              ),
                            ),
                          ),
                          child: Text(
                            tech,
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(
                                  color: AppTheme.primaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (widget.project.googlePlayLink != null)
                          _SocialButton(
                            icon: FontAwesomeIcons.googlePlay,
                            onPressed: () =>
                                _launchUrl(widget.project.googlePlayLink!),
                          ),
                        if (widget.project.appStoreLink != null) ...[
                          const SizedBox(width: 10),
                          _SocialButton(
                            icon: FontAwesomeIcons.appStore,
                            onPressed: () =>
                                _launchUrl(widget.project.appStoreLink!),
                          ),
                        ],
                        if (widget.project.githubLink != null) ...[
                          const SizedBox(width: 10),
                          _SocialButton(
                            icon: FontAwesomeIcons.github,
                            onPressed: () =>
                                _launchUrl(widget.project.githubLink!),
                          ),
                        ],
                        if (widget.project.link != null) ...[
                          const SizedBox(width: 10),
                          _SocialButton(
                            icon: FontAwesomeIcons.arrowUpRightFromSquare,
                            onPressed: () => _launchUrl(widget.project.link!),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }
}

class _SocialButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _SocialButton({required this.icon, required this.onPressed});

  @override
  State<_SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<_SocialButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: _isHovered ? AppTheme.primaryColor : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: _isHovered ? AppTheme.primaryColor : Colors.grey[700]!,
            ),
          ),
          child: FaIcon(
            widget.icon,
            size: 16,
            color: _isHovered ? Colors.white : Colors.grey[400],
          ),
        ),
      ),
    );
  }
}
