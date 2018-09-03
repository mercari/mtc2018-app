// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Session _$SessionFromJson(Map<String, dynamic> json) {
  return new Session(
      json['id'] as int,
      json['type'] as String,
      json['place'] as String,
      json['startTime'] as String,
      json['endTime'] as String,
      json['title'] as String,
      json['titleJa'] as String,
      json['outline'] as String,
      json['outlineJa'] as String,
      json['lang'] as String,
      (json['tags'] as List)?.map((e) => e as String)?.toList(),
      (json['speakers'] as List)
          ?.map((e) => e == null
              ? null
              : new Speaker.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

abstract class _$SessionSerializerMixin {
  int get id;
  String get type;
  String get place;
  String get startTime;
  String get endTime;
  String get title;
  String get titleJa;
  String get outline;
  String get outlineJa;
  String get lang;
  List<String> get tags;
  List<Speaker> get speakers;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'type': type,
        'place': place,
        'startTime': startTime,
        'endTime': endTime,
        'title': title,
        'titleJa': titleJa,
        'outline': outline,
        'outlineJa': outlineJa,
        'lang': lang,
        'tags': tags,
        'speakers': speakers
      };
}
