import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repository_pattern/bloc/beer_event.dart';
import 'package:repository_pattern/bloc/beer_state.dart';

import '../repository/beer_repository.dart';
import '../repository/repository_providers.dart';

class BeerBloc extends Bloc<BeerEvent, BeerState>{
  final BeerRepository _beerRepository;

  BeerBloc(this._beerRepository) : super(BeerLoadingState()){
    on<LoadBeerEvent>((event, emit) async {
      emit(BeerLoadingState());
      try{
        final beers = await _beerRepository.getBeers();
        emit(BeerLoadedState(beers));
      }catch(e){
        emit(BeerErrorState(e.toString()));
      }
    });
  }
}