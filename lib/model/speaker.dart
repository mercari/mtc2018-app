import "package:json_annotation/json_annotation.dart";

part "speaker.g.dart";

@JsonSerializable()
class Speaker extends Object with _$SpeakerSerializerMixin {
  Speaker(
      this.id,
      this.name,
      this.nameJa,
      this.company,
      this.position,
      this.positionJa,
      this.profile,
      this.profileJa,
      this.iconUrl,
      this.twitterId,
      this.githubId);
  String id;
  String name;
  String nameJa;
  String company;
  String position;
  String positionJa;
  String profile;
  String profileJa;
  String iconUrl;
  String twitterId;
  String githubId;

  factory Speaker.fromJson(Map<String, dynamic> json) =>
      _$SpeakerFromJson(json);

  String localizedName(String languageCode) {
    return languageCode == "ja" ? nameJa : name;
  }

  String localizedPosition(String languageCode) {
    return languageCode == "ja" ? positionJa : position;
  }

  String localizedProfile(String languageCode) {
    return languageCode == "ja" ? profileJa : profile;
  }
}
