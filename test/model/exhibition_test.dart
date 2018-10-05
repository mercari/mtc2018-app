import 'package:mtc2018_app/model/exhibition.dart';
import 'package:test/test.dart';

void main() {
  group("localizedTitle", () {
    test('returns valid locale text', () {
      // given
      var exhibition = Exhibition("", "", "title", "titleJa", "", "", "", "");

      // when & then
      expect(exhibition.localizedTitle("en"), "title");
      expect(exhibition.localizedTitle("ja"), "titleJa");
    });
  });

  group("localizedDescription", () {
    test('returns valid locale text', () {
      // given
      var exhibition =
          Exhibition("", "", "", "", "description", "descriptionJa", "", "");

      // when & then
      expect(exhibition.localizedDescription("en"), "description");
      expect(exhibition.localizedDescription("ja"), "descriptionJa");
    });
  });
}
