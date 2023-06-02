// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Beer _$$_BeerFromJson(Map<String, dynamic> json) => _$_Beer(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      imageUrl: json['image_url'] as String,
    );

Map<String, dynamic> _$$_BeerToJson(_$_Beer instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image_url': instance.imageUrl,
    };
