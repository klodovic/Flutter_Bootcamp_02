import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';
import 'package:repository_pattern/model/beer.dart';
import 'package:repository_pattern/repository/beer_interface.dart';

class BeerRepository{
  String endpoint = 'https://api.punkapi.com/v2/beers';
  Future<List<Beer>> getBeers() async {
    Response response = await get(Uri.parse(endpoint));
    if (response.statusCode == 200){
      final List result = jsonDecode(response.body);
      return result.map((e) => Beer.fromJson(e)).toList();
    }
    else{
      throw Exception(response.reasonPhrase);
    }
  }
}
  
