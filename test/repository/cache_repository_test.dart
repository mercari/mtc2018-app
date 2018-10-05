import 'dart:async';

import 'package:mockito/mockito.dart';
import 'package:mtc2018_app/api/client.dart';
import 'package:mtc2018_app/cache/cache.dart';
import 'package:mtc2018_app/model/exhibition.dart';
import 'package:mtc2018_app/model/news.dart';
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

    test('returns fetched list when cache is empty', () async {
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

  group("getSessionById", () {
    test('returns cached session when cache contains', () async {
      // given
      var cachedSession =
          Session("1", "", "", "", "", "", "", "", "", "", [], []);
      var sessionList = [cachedSession];
      var client = MockClient();
      var cache = MockCache();
      when(cache.get("SessionList"))
          .thenAnswer((_) => Future.value(sessionList));
      var repository = CacheRepository(cache: cache, client: client);

      // when
      var session = await repository.getSessionById("1");

      // then
      expect(session, cachedSession);
      verifyNever(client.fetchSessionById(any));
    });

    test('returns null when cache does not contain', () async {
      // given
      var cachedSession =
          Session("1", "", "", "", "", "", "", "", "", "", [], []);
      var sessionList = [cachedSession];
      var client = MockClient();
      var cache = MockCache();
      when(cache.get("SessionList"))
          .thenAnswer((_) => Future.value(sessionList));
      var repository = CacheRepository(cache: cache, client: client);

      // when
      var session = await repository.getSessionById("2");

      // then
      expect(session, null);
      verifyNever(client.fetchSessionById(any));
    });

    test('returns fetched session when cache is null', () async {
      // given
      var dummySession =
          Session("1", "", "", "", "", "", "", "", "", "", [], []);
      var client = MockClient();
      when(client.fetchSessionById("1"))
          .thenAnswer((_) => Future.value(dummySession));
      var cache = MockCache();
      when(cache.get("SessionList")).thenAnswer((_) => Future.value(null));
      var repository = CacheRepository(cache: cache, client: client);

      // when
      var session = await repository.getSessionById("1");

      // then
      expect(session, dummySession);
      verify(client.fetchSessionById("1"));
    });
  });

  group("refreshSessionList", () {
    test('fetches and reset cache', () async {
      // given
      var sessionList = [MockSession()];
      var client = MockClient();
      when(client.fetchSessions()).thenAnswer((_) => Future.value(sessionList));
      var cache = MockCache();
      var repository = CacheRepository(cache: cache, client: client);

      // when
      await repository.refreshSessionList();

      // then
      verify(client.fetchSessions());
      verify(cache.put("SessionList", sessionList));
    });
  });

  group("getNewsList", () {
    test('returns cached list when cache is not empty', () async {
      // given
      var client = MockClient();
      var cache = MockCache();
      when(cache.get("NewsList")).thenAnswer((_) => Future.value([MockNews()]));
      var repository = CacheRepository(cache: cache, client: client);

      // when
      var list = await repository.getNewsList();

      // then
      expect(list.length, 1);
      verifyNever(client.fetchNews());
    });

    test('returns fetched list when cache is empty', () async {
      // given
      var newsList = [MockNews()];
      var client = MockClient();
      when(client.fetchNews()).thenAnswer((_) => Future.value(newsList));
      var cache = MockCache();
      when(cache.get("NewsList")).thenAnswer((_) => Future.value(null));
      var repository = CacheRepository(cache: cache, client: client);

      // when
      var list = await repository.getNewsList();

      // then
      expect(list.length, 1);
      verify(client.fetchNews());
      verify(cache.put("NewsList", newsList));
    });
  });

  group("refreshNewsList", () {
    test('fetches and reset cache', () async {
      // given
      var newsList = [MockNews()];
      var client = MockClient();
      when(client.fetchNews()).thenAnswer((_) => Future.value(newsList));
      var cache = MockCache();
      var repository = CacheRepository(cache: cache, client: client);

      // when
      await repository.refreshNewsList();

      // then
      verify(client.fetchNews());
      verify(cache.put("NewsList", newsList));
    });
  });

  group("getExhibitionList", () {
    test('returns cached list when cache is not empty', () async {
      // given
      var client = MockClient();
      var cache = MockCache();
      when(cache.get("ExhibitionList"))
          .thenAnswer((_) => Future.value([MockExhibition()]));
      var repository = CacheRepository(cache: cache, client: client);

      // when
      var list = await repository.getExhibitionList();

      // then
      expect(list.length, 1);
      verifyNever(client.fetchExhibitions());
    });

    test('returns fetched list when cache is empty', () async {
      // given
      var exhibitionList = [MockExhibition()];
      var client = MockClient();
      when(client.fetchExhibitions())
          .thenAnswer((_) => Future.value(exhibitionList));
      var cache = MockCache();
      when(cache.get("ExhibitionList")).thenAnswer((_) => Future.value(null));
      var repository = CacheRepository(cache: cache, client: client);

      // when
      var list = await repository.getExhibitionList();

      // then
      expect(list.length, 1);
      verify(client.fetchExhibitions());
      verify(cache.put("ExhibitionList", exhibitionList));
    });
  });

  group("refreshExhibitionList", () {
    test('fetches and reset cache', () async {
      // given
      var exhibitionList = [MockExhibition()];
      var client = MockClient();
      when(client.fetchExhibitions())
          .thenAnswer((_) => Future.value(exhibitionList));
      var cache = MockCache();
      var repository = CacheRepository(cache: cache, client: client);

      // when
      await repository.refreshExhibitionList();

      // then
      verify(client.fetchExhibitions());
      verify(cache.put("ExhibitionList", exhibitionList));
    });
  });
}

class MockClient extends Mock implements Client {}

class MockCache extends Mock implements Cache {}

class MockSession extends Mock implements Session {}

class MockNews extends Mock implements News {}

class MockExhibition extends Mock implements Exhibition {}
