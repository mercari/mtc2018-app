import 'package:mtc2018_app/model/news.dart';
import 'package:test/test.dart';

void main() {
  group("localizedMessage", () {
    test('returns valid locale text', () {
      // given
      var news = News("", "", "message", "messageJa", "");

      // when & then
      expect(news.localizedMessage("en"), "message");
      expect(news.localizedMessage("ja"), "messageJa");
    });
  });
}
