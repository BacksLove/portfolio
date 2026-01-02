import 'package:backs_portfolio_v2/features/home/presentation/widgets/about_section.dart';
import 'package:backs_portfolio_v2/features/home/presentation/widgets/contact_section.dart';
import 'package:backs_portfolio_v2/features/home/presentation/widgets/education_section.dart';
import 'package:backs_portfolio_v2/features/home/presentation/widgets/experience_section.dart';
import 'package:backs_portfolio_v2/features/home/presentation/widgets/footer.dart';
import 'package:backs_portfolio_v2/features/home/presentation/widgets/hero_section.dart';
import 'package:backs_portfolio_v2/features/home/presentation/widgets/nav_bar.dart';
import 'package:backs_portfolio_v2/features/home/presentation/widgets/projects_section.dart';
import 'package:backs_portfolio_v2/features/home/presentation/widgets/services_section.dart';
import 'package:backs_portfolio_v2/features/home/presentation/widgets/skills_section.dart';
import 'package:backs_portfolio_v2/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final ScrollController _scrollController = ScrollController();

  // Keys for scrolling to sections
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _servicesKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollToSection(int index) {
    GlobalKey key;
    switch (index) {
      case 0:
        key = _homeKey;
        break;
      case 1:
        key = _skillsKey;
        break;
      case 2:
        key = _servicesKey;
        break;
      case 3:
        key = _aboutKey;
        break;
      case 4:
        key = _experienceKey;
        break;
      case 5:
        key = _projectsKey;
        break;
      case 6:
        key = _contactKey;
        break;
      default:
        return;
    }

    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      body: Column(
        children: [
          NavBar(onNavTap: _scrollToSection),
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  HeroSection(
                    key: _homeKey,
                    onContactTap: () => _scrollToSection(6),
                  ),
                  SkillsSection(key: _skillsKey),
                  ServicesSection(key: _servicesKey),
                  AboutSection(key: _aboutKey),
                  ExperienceSection(key: _experienceKey),
                  ProjectsSection(key: _projectsKey),
                  const EducationSection(),
                  ContactSection(key: _contactKey),
                  const Footer(),
                ],
              ),
            ),
          ),
        ],
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.black),
              child: Text(
                'Menu',
                style: const TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              title: Text(l10n.navHome),
              onTap: () {
                Navigator.pop(context);
                _scrollToSection(0);
              },
            ),
            ListTile(
              title: Text(l10n.navSkills),
              onTap: () {
                Navigator.pop(context);
                _scrollToSection(1);
              },
            ),
            ListTile(
              title: Text(l10n.navServices),
              onTap: () {
                Navigator.pop(context);
                _scrollToSection(2);
              },
            ),
            ListTile(
              title: Text(l10n.navAbout),
              onTap: () {
                Navigator.pop(context);
                _scrollToSection(3);
              },
            ),
            ListTile(
              title: Text(l10n.navExperience),
              onTap: () {
                Navigator.pop(context);
                _scrollToSection(4);
              },
            ),
            ListTile(
              title: Text(l10n.navProjects),
              onTap: () {
                Navigator.pop(context);
                _scrollToSection(5);
              },
            ),
            ListTile(
              title: Text(l10n.navContact),
              onTap: () {
                Navigator.pop(context);
                _scrollToSection(6);
              },
            ),
          ],
        ),
      ),
    );
  }
}
