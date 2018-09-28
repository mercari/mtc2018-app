// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exhibition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Exhibition _$ExhibitionFromJson(Map<String, dynamic> json) {
  return new Exhibition(
      json['id'] as String,
      json['place'] as String,
      json['titleJa'] as String,
      json['title'] as String,
      json['descriptionJa'] as String,
      json['description'] as String);
}

abstract class _$ExhibitionSerializerMixin {
  String get id;
  String get place;
  String get titleJa;
  String get title;
  String get descriptionJa;
  String get description;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'place': place,
        'titleJa': titleJa,
        'title': title,
        'descriptionJa': descriptionJa,
        'description' : description
      };
}
