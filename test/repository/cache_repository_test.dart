import 'dart:async';

import 'package:mockito/mockito.dart';
import 'package:mtc2018_app/api/client.dart';
import 'package:mtc2018_app/cache/cache.dart';
import 'package:mtc2018_app/model/session.dart';
import 'package:mtc2018_app/repository/cache_repository.dart';
import 'package:test/test.dart';

void main() {
  group("getSessionList", () {
    test('returns cached list when cache is not empty', () async {
      // given
      var client = MockClient();
      var cache = MockCache();
      when(cache.get("SessionList"))
          .thenAnswer((_) => Future.value([MockSession()]));
      var repository = CacheRepository(cache: cache, client: client);

      // when
      var list = await repository.getSessionList();

      // then
      expect(list.length, 1);
      verifyNever(client.fetchSessions());
    });

    test('returns cached list when cache is empty', () async {
      // given
      var sessionList = [MockSession()];
      var client = MockClient();
      when(client.fetchSessions()).thenAnswer((_) => Future.value(sessionList));
      var cache = MockCache();
      when(cache.get("SessionList")).thenAnswer((_) => Future.value(null));
      var repository = CacheRepository(cache: cache, client: client);

      // when
      var list = await repository.getSessionList();

      // then
      expect(list.length, 1);
      verify(client.fetchSessions());
      verify(cache.put("SessionList", sessionList));
    });
  });
}

class MockClient extends Mock implements Client {}

class MockCache extends Mock implements Cache {}

class MockSession extends Mock implements Session {}
