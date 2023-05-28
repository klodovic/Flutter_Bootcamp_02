import 'package:flutter_bloc_assignment/repo/beer_repo.dart';

class Beer{
  int id;
  String name;
  String description;
  String imageUrl;

  Beer({required this.id, required this.name, required this.description,required this.imageUrl});

  factory Beer.fromJson(Map<String, dynamic> map){
    return Beer(
        id: map['id'],
        name: map['name'],
        description: map['description'],
        imageUrl: map['image_url']
    );
  }
}