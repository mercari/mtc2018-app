import 'package:mtc2018_app/model/session.dart';
import 'package:test/test.dart';

void main() {
  group("localizedTitle", () {
    test('returns valid locale text', () {
      // given
      var session =
          Session("", "", "", "", "", "title", "titleJa", "", "", "", [], []);

      // when & then
      expect(session.localizedTitle("en"), "title");
      expect(session.localizedTitle("ja"), "titleJa");
    });
  });

  group("localizedOutline", () {
    test('returns valid locale text', () {
      // given
      var session = Session(
          "", "", "", "", "", "", "", "outline", "outlineJa", "", [], []);

      // when & then
      expect(session.localizedOutline("en"), "outline");
      expect(session.localizedOutline("ja"), "outlineJa");
    });
  });
}
