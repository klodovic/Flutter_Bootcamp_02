import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class BeerEvent extends Equatable{
  const BeerEvent();
}

class LoadBeerEvent extends BeerEvent{
  @override
  List<Object> get props => [];
}