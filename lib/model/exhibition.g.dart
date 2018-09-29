// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exhibition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Exhibition _$ExhibitionFromJson(Map<String, dynamic> json) {
  return new Exhibition(
      json['id'] as String,
      json['place'] as String,
      json['title'] as String,
      json['titleJa'] as String,
      json['description'] as String,
      json['descriptionJa'] as String,
      json['exhibitionImage'] as String,
      json['boothImage'] as String);
}

abstract class _$ExhibitionSerializerMixin {
  String get id;
  String get place;
  String get title;
  String get titleJa;
  String get description;
  String get descriptionJa;
  String get exhibitionImage;
  String get boothImage;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'place': place,
        'title': title,
        'titleJa': titleJa,
        'description': description,
        'descriptionJa': descriptionJa,
        'exhibitionImage': exhibitionImage,
        'boothImage': boothImage
      };
}
