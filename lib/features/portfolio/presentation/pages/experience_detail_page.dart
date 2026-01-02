import 'package:backs_portfolio_v2/core/theme/app_theme.dart';
import 'package:backs_portfolio_v2/core/utils/responsive_widget.dart';
import 'package:backs_portfolio_v2/features/portfolio/domain/entities/portfolio_entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ExperienceDetailPage extends StatelessWidget {
  final Experience experience;

  const ExperienceDetailPage({super.key, required this.experience});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveWidget.isMobile(context);
    final horizontalPadding = isMobile ? 20.0 : 100.0;

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Header Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    experience.company,
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          height: 1.1,
                          fontSize: isMobile ? 40 : 80,
                        ),
                  ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.2),
                  const SizedBox(height: 20),
                  Text(
                    experience.role,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Colors.grey[400],
                          height: 1.5,
                          fontWeight: FontWeight.w400,
                        ),
                  ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.2),
                ],
              ),
            ),

            // 2. Hero Image
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: isMobile ? 0 : 40),
              height: isMobile ? 300 : 500,
              decoration: BoxDecoration(
                color: AppTheme.surfaceColor,
                borderRadius: BorderRadius.circular(isMobile ? 0 : 20),
                border: Border.all(color: AppTheme.primaryColor, width: 2),
                image: experience.imageUrl != null
                    ? DecorationImage(
                        image: AssetImage(experience.imageUrl!),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child: experience.imageUrl == null
                  ? Center(
                      child: Container(
                        padding: const EdgeInsets.all(40),
                        decoration: BoxDecoration(
                          color: AppTheme.primaryColor.withOpacity(0.1),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppTheme.primaryColor.withOpacity(0.5),
                            width: 2,
                          ),
                        ),
                        child: const FaIcon(
                          FontAwesomeIcons.briefcase,
                          size: 80,
                          color: AppTheme.primaryColor,
                        ),
                      ),
                    )
                  : null,
            ).animate().fadeIn(delay: 300.ms).scale(begin: const Offset(0.95, 0.95)),

            const SizedBox(height: 80),

            // 3. Info Grid
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: isMobile
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildInfoItem(context, 'PERIOD', experience.period),
                        const SizedBox(height: 30),
                        _buildInfoItem(context, 'TYPE', 'Full-time'),
                        const SizedBox(height: 30),
                        _buildInfoItem(context, 'LOCATION', 'Remote / Hybrid'),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: _buildInfoItem(context, 'PERIOD', experience.period)),
                        Expanded(child: _buildInfoItem(context, 'TYPE', 'Full-time')),
                        Expanded(child: _buildInfoItem(context, 'LOCATION', 'Remote / Hybrid')),
                      ],
                    ),
            ).animate().fadeIn(delay: 500.ms).slideY(begin: 0.1),

            const SizedBox(height: 80),
            const Divider(color: Colors.white10),
            const SizedBox(height: 80),

            // 4. Responsibilities
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (!isMobile)
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Responsibilities',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (isMobile) ...[
                          Text(
                            'Responsibilities',
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                          ),
                          const SizedBox(height: 20),
                        ],
                        ...experience.description.map((desc) => Padding(
                          padding: const EdgeInsets.only(bottom: 24),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 10),
                                width: 6,
                                height: 6,
                                decoration: const BoxDecoration(
                                  color: AppTheme.primaryColor,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: Text(
                                  desc,
                                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                        color: Colors.grey[300],
                                        height: 1.6,
                                        fontSize: 18,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        )),
                      ],
                    ),
                  ),
                ],
              ),
            ).animate().fadeIn(delay: 600.ms),

            if (experience.galleryImages != null && experience.galleryImages!.isNotEmpty) ...[
              const SizedBox(height: 80),
              const Divider(color: Colors.white10),
              const SizedBox(height: 80),
              _buildGallerySection(context, experience.galleryImages!),
            ],

            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _buildGallerySection(BuildContext context, List<String> images) {
    final isMobile = ResponsiveWidget.isMobile(context);
    final horizontalPadding = isMobile ? 20.0 : 100.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Text(
            'Gallery',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        const SizedBox(height: 40),
        SizedBox(
          height: isMobile ? 500 : 700,
          child: PageView.builder(
            controller: PageController(
              viewportFraction: isMobile ? 0.7 : 0.25,
              initialPage: 1000, // Start in the middle for "infinite" feel backwards too
            ),
            itemBuilder: (context, index) {
              final imageIndex = index % images.length;
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppTheme.primaryColor.withOpacity(0.5),
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                  image: DecorationImage(
                    image: AssetImage(images[imageIndex]),
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildInfoItem(BuildContext context, String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: Colors.grey[600],
                letterSpacing: 1.2,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 12),
        Text(
          value,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
        ),
      ],
    );
  }
}
