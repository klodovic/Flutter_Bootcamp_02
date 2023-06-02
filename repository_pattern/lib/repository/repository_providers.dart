import 'package:get_it/get_it.dart';
import 'package:repository_pattern/repository/beer_repository.dart';

class RepositoryProviders {
  static initializeProviders() async {
    final getIt = GetIt.instance;
    getIt.registerLazySingleton(() => BeerRepository());
  }
}