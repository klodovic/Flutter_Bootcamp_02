import 'package:flutter/foundation.dart';

import '../repo/beer_repo.dart';
import 'beer_event.dart';
import 'beer_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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




