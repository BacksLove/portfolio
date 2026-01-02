import 'package:backs_portfolio_v2/features/portfolio/domain/entities/portfolio_entities.dart';

abstract class PortfolioRepository {
  Future<List<Experience>> getExperiences({required String languageCode});
  Future<List<Project>> getProjects({required String languageCode});
  Future<List<Skill>> getSkills();
  Future<List<Service>> getServices();
}
