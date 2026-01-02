import 'package:backs_portfolio_v2/core/providers/locale_provider.dart';
import 'package:backs_portfolio_v2/features/portfolio/data/repositories/portfolio_repository_impl.dart';
import 'package:backs_portfolio_v2/features/portfolio/domain/entities/portfolio_entities.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final experienceProvider = FutureProvider<List<Experience>>((ref) async {
  final repository = ref.watch(portfolioRepositoryProvider);
  final locale = ref.watch(localeProvider);
  return repository.getExperiences(languageCode: locale.languageCode);
});

final projectsProvider = FutureProvider<List<Project>>((ref) async {
  final repository = ref.watch(portfolioRepositoryProvider);
  final locale = ref.watch(localeProvider);
  return repository.getProjects(languageCode: locale.languageCode);
});

final skillsProvider = FutureProvider<List<Skill>>((ref) async {
  final repository = ref.watch(portfolioRepositoryProvider);
  return repository.getSkills();
});

final servicesProvider = FutureProvider<List<Service>>((ref) async {
  final repository = ref.watch(portfolioRepositoryProvider);
  return repository.getServices();
});
