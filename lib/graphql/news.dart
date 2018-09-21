import 'package:json_annotation/json_annotation.dart';

part 'news.g.dart';

@JsonSerializable()
class News extends Object with _$NewsSerializerMixin {
  News(this.id, this.date, this.message, this.messageJa, this.link);

  String id;
  String date;
  String message;
  String messageJa;
  String link;

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);
}
