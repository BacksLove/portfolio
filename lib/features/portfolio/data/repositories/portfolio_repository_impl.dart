import 'package:backs_portfolio_v2/features/portfolio/data/datasources/portfolio_local_data_source.dart';
import 'package:backs_portfolio_v2/features/portfolio/domain/repositories/portfolio_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final portfolioRepositoryProvider = Provider<PortfolioRepository>((ref) {
  return PortfolioLocalDataSource();
});
