import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
part 'beer.freezed.dart';
part 'beer.g.dart';

@freezed
class Beer with _$Beer{
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Beer({
    required int id,
    required String name,
    required String description,
    required String imageUrl}) = _Beer;

  factory Beer.fromJson(Map<String, dynamic> json) => _$BeerFromJson(json);

  static List<Beer> fromJsonList(List<dynamic> jsonList){
    return jsonList.map((json) => Beer.fromJson(json)).toList();
  }
}


