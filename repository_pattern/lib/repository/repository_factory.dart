import 'package:get_it/get_it.dart';
import 'beer_repository.dart';

class RepositoryFactory{
  static initializeProviders() async{
    final getIt = GetIt.instance;
    getIt.registerLazySingleton(() => BeerRepository());
  }
}