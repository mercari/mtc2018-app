// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'speaker.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Speaker _$SpeakerFromJson(Map<String, dynamic> json) {
  return new Speaker(
      json['id'] as String,
      json['name'] as String,
      json['nameJa'] as String,
      json['company'] as String,
      json['position'] as String,
      json['positionJa'] as String,
      json['profile'] as String,
      json['profileJa'] as String,
      json['iconUrl'] as String,
      json['twitterId'] as String,
      json['githubId'] as String);
}

abstract class _$SpeakerSerializerMixin {
  String get id;
  String get name;
  String get nameJa;
  String get company;
  String get position;
  String get positionJa;
  String get profile;
  String get profileJa;
  String get iconUrl;
  String get twitterId;
  String get githubId;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'nameJa': nameJa,
        'company': company,
        'position': position,
        'positionJa': positionJa,
        'profile': profile,
        'profileJa': profileJa,
        'iconUrl': iconUrl,
        'twitterId': twitterId,
        'githubId': githubId
      };
}
