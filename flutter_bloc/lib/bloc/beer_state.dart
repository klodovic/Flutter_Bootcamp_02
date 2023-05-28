import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../model/beer.dart';

@immutable
abstract class BeerState extends Equatable{}

//create class for each state//
// 1. data loading state
class BeerLoadingState extends BeerState{
  @override
  List<Object?> get props => [];
}

// 2. data loaded state
class BeerLoadedState extends BeerState{
  BeerLoadedState(this.beers);
  final List<Beer> beers;
  @override
  List<Object?> get props => [beers];
}


// 3. data error loading state
class BeerErrorState extends BeerState{
  BeerErrorState(this.error);
  final String error;
  @override
  List<Object?> get props => [error];
}