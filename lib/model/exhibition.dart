import "package:json_annotation/json_annotation.dart";

part "exhibition.g.dart";

@JsonSerializable()
class Exhibition extends Object with _$ExhibitionSerializerMixin {
  Exhibition(this.id, this.place, this.title, this.titleJa, this.description,
      this.descriptionJa, this.exhibitionImage, this.boothImage);

  String id;
  String place;
  String title;
  String titleJa;
  String description;
  String descriptionJa;
  String exhibitionImage;
  String boothImage;

  factory Exhibition.fromJson(Map<String, dynamic> json) =>
      _$ExhibitionFromJson(json);

  String localizedTitle(String languageCode) {
    return languageCode == "ja" ? titleJa : title;
  }

  String localizedDescription(String languageCode) {
    return languageCode == "ja" ? descriptionJa : description;
  }
}
