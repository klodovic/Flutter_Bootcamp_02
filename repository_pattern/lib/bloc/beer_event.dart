import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class BeerEvent extends Equatable{
  const BeerEvent();
}

class LoadBeerEvent extends BeerEvent{
  @override
  List<Object> get props => [];
}