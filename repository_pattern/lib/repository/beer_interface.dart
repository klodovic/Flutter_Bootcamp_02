import '../model/beer.dart';

abstract class IBeerRepository {
  Future<List<Beer>> getBeers();
}