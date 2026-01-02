import 'package:backs_portfolio_v2/core/theme/app_theme.dart';
import 'package:backs_portfolio_v2/core/utils/responsive_widget.dart';
import 'package:backs_portfolio_v2/features/portfolio/domain/entities/portfolio_entities.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ProjectDetailPage extends StatelessWidget {
  final Project project;

  const ProjectDetailPage({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveWidget.isMobile(context);

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppTheme.primaryColor,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : 60,
          vertical: 20,
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1400),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                isMobile
                    ? _buildMobileLayout(context)
                    : _buildDesktopLayout(context),
                const SizedBox(height: 80),
                if (project.galleryImages != null &&
                    project.galleryImages!.isNotEmpty)
                  _buildGallerySection(context, isMobile),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGallerySection(BuildContext context, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Gallery',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 40),
        SizedBox(
          height: isMobile ? 300 : 500,
          child: PageView.builder(
            controller: PageController(viewportFraction: isMobile ? 0.85 : 0.6),
            itemCount: project.galleryImages!.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppTheme.surfaceColor,
                  image: DecorationImage(
                    image: AssetImage(project.galleryImages![index]),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
              );
            },
          ),
        ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.1),
      ],
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left Column: Image Gallery
        Expanded(
          flex: 3,
          child: _buildImageSection(context),
        ),
        const SizedBox(width: 60),
        // Right Column: Content
        Expanded(
          flex: 2,
          child: _buildContentSection(context),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildImageSection(context),
        const SizedBox(height: 40),
        _buildContentSection(context),
      ],
    );
  }

  Widget _buildImageSection(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          constraints: const BoxConstraints(minHeight: 400, maxHeight: 600),
          decoration: BoxDecoration(
            color: AppTheme.surfaceColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          padding: const EdgeInsets.all(20), // Frame padding
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: project.imageUrl != null
                ? Image.asset(
                    project.imageUrl!,
                    fit: BoxFit.contain,
                  )
                : Center(
                    child: FaIcon(
                      FontAwesomeIcons.code,
                      size: 80,
                      color: AppTheme.primaryColor.withOpacity(0.5),
                    ),
                  ),
          ),
        ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.1),
        const SizedBox(height: 20),
        // Fake pagination dots for style
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildDot(true),
            const SizedBox(width: 8),
            _buildDot(false),
            const SizedBox(width: 8),
            _buildDot(false),
          ],
        ),
      ],
    );
  }

  Widget _buildDot(bool isActive) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? AppTheme.primaryColor : Colors.grey.withOpacity(0.3),
      ),
    );
  }

  Widget _buildContentSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          project.title,
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
        ).animate().fadeIn(delay: 200.ms).slideX(),
        const SizedBox(height: 10),
        Text(
          'Mobile Application', // Subtitle placeholder
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.grey[500],
                fontWeight: FontWeight.w400,
              ),
        ).animate().fadeIn(delay: 300.ms).slideX(),
        const SizedBox(height: 40),
        const Divider(color: Colors.white10),
        const SizedBox(height: 40),

        // What Is It?
        Text(
          'What Is It ?',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 20),
        Text(
          project.description,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.grey[300],
                height: 1.8,
                fontSize: 16,
              ),
        ),
        const SizedBox(height: 40),
        const Divider(color: Colors.white10),
        const SizedBox(height: 40),

        // Tools & Technologies
        Text(
          'Tools & Technologies',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: project.technologies.map((tech) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.white10),
              ),
              child: Text(
                tech,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          }).toList(),
        ),

        const SizedBox(height: 60),

        // Action Buttons
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            if (project.link != null)
              _ActionButton(
                label: 'Visit Project',
                icon: FontAwesomeIcons.globe,
                onTap: () => _launchUrl(project.link!),
              ),
            if (project.githubLink != null)
              _ActionButton(
                label: 'GitHub',
                icon: FontAwesomeIcons.github,
                onTap: () => _launchUrl(project.githubLink!),
                isOutlined: true,
              ),
            if (project.googlePlayLink != null)
              _ActionButton(
                label: 'Google Play',
                icon: FontAwesomeIcons.googlePlay,
                onTap: () => _launchUrl(project.googlePlayLink!),
                isOutlined: true,
              ),
            if (project.appStoreLink != null)
              _ActionButton(
                label: 'App Store',
                icon: FontAwesomeIcons.appStore,
                onTap: () => _launchUrl(project.appStoreLink!),
                isOutlined: true,
              ),
          ],
        ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.2),
      ],
    );
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }
}

class _ActionButton extends StatefulWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;
  final bool isOutlined;

  const _ActionButton({
    required this.label,
    required this.icon,
    required this.onTap,
    this.isOutlined = false,
  });

  @override
  State<_ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<_ActionButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: InkWell(
        onTap: widget.onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          decoration: BoxDecoration(
            color: widget.isOutlined
                ? Colors.transparent
                : (_isHovered ? Colors.white : Colors.transparent),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: widget.isOutlined
                  ? (_isHovered ? AppTheme.primaryColor : Colors.grey[700]!)
                  : (_isHovered ? Colors.white : Colors.grey[700]!),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(
                widget.icon,
                size: 18,
                color: widget.isOutlined
                    ? (_isHovered ? AppTheme.primaryColor : Colors.white)
                    : (_isHovered ? Colors.black : Colors.white),
              ),
              const SizedBox(width: 12),
              Text(
                widget.label,
                style: TextStyle(
                  color: widget.isOutlined
                      ? (_isHovered ? AppTheme.primaryColor : Colors.white)
                      : (_isHovered ? Colors.black : Colors.white),
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
