import "package:json_annotation/json_annotation.dart";
import "package:flutter/material.dart";
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

  String localizedTitle(BuildContext context) {
    Locale currentLocale = Localizations.localeOf(context);
    return currentLocale.languageCode == "ja" ? titleJa : title;
  }

  String localizedDescription(BuildContext context) {
    Locale currentLocale = Localizations.localeOf(context);
    return currentLocale.languageCode == "ja" ? descriptionJa : description;
  }
}
