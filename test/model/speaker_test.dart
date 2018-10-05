import 'package:mtc2018_app/model/speaker.dart';
import 'package:test/test.dart';

void main() {
  group("localizedName", () {
    test('returns valid locale text', () {
      // given
      var speaker =
          Speaker("", "name", "nameJa", "", "", "", "", "", "", "", "");

      // when & then
      expect(speaker.localizedName("en"), "name");
      expect(speaker.localizedName("ja"), "nameJa");
    });
  });

  group("localizedPosition", () {
    test('returns valid locale text', () {
      // given
      var speaker =
          Speaker("", "", "", "", "position", "positionJa", "", "", "", "", "");

      // when & then
      expect(speaker.localizedPosition("en"), "position");
      expect(speaker.localizedPosition("ja"), "positionJa");
    });
  });

  group("localizedProfile", () {
    test('returns valid locale text', () {
      // given
      var speaker =
          Speaker("", "", "", "", "", "", "profile", "profileJa", "", "", "");

      // when & then
      expect(speaker.localizedProfile("en"), "profile");
      expect(speaker.localizedProfile("ja"), "profileJa");
    });
  });
}
