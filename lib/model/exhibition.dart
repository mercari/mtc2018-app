import "package:json_annotation/json_annotation.dart";

part "exhibition.g.dart";

@JsonSerializable()
class Exhibition extends Object with _$ExhibitionSerializerMixin {
  Exhibition(this.id, this.place, this.title, this.titleJa, this.description, this.descriptionJa);

  String id;
  String place;
  String title;
  String titleJa;
  String description;
  String descriptionJa;

  factory Exhibition.fromJson(Map<String, dynamic> json) => _$ExhibitionFromJson(json);
}
