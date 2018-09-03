import 'package:mtc2018_app/model/speaker.dart';
import 'package:json_annotation/json_annotation.dart';

part 'session.g.dart';

@JsonSerializable()
class Session extends Object with _$SessionSerializerMixin {
  Session(
      this.id,
      this.type,
      this.place,
      this.startTime,
      this.endTime,
      this.title,
      this.titleJa,
      this.outline,
      this.outlineJa,
      this.lang,
      this.tags,
      this.speakers);

  int id;
  String type;
  String place;
  String startTime;
  String endTime;
  String title;
  String titleJa;
  String outline;
  String outlineJa;
  String lang;
  List<String> tags;
  List<Speaker> speakers;

  factory Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);
}
