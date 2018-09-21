// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

News _$NewsFromJson(Map<String, dynamic> json) {
  return new News(
      json['id'] as String,
      json['date'] as String,
      json['message'] as String,
      json['messageJa'] as String,
      json['link'] as String);
}

abstract class _$NewsSerializerMixin {
  String get id;
  String get date;
  String get message;
  String get messageJa;
  String get link;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'date': date,
        'message': message,
        'messageJa': messageJa,
        'link': link
      };
}
