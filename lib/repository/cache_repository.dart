import "dart:async";

import "package:mtc2018_app/api/client.dart";
import "repository.dart";
import "package:mtc2018_app/cache/cache.dart";
import "package:mtc2018_app/model/session.dart";
import "package:mtc2018_app/model/news.dart";
import "package:mtc2018_app/model/exhibition.dart";

class CacheRepository extends Repository {
  final Cache cache;
  final client = Client();

  CacheRepository({this.cache});

  @override
  Future<List<Session>> getSessionList() async {
    final cachedSeesionList = await cache.get("SessionList") as List<Session>;
    if (cachedSeesionList != null) {
      return cachedSeesionList;
    }

    final sessionList = await client.fetchSessions();
    cache.put("SessionList", sessionList);
    return sessionList;
  }

  @override
  Future<List<Session>> refreshSessionList() async {
    final sessionList = await client.fetchSessions();
    cache.put("SessionList", sessionList);
    return sessionList;
  }

  @override
  Future<List<News>> getNewsList() async {
    final cachedNewsList = await cache.get("NewsList") as List<News>;
    if (cachedNewsList != null) {
      return cachedNewsList;
    }

    final newsList = await client.fetchNews();
    cache.put("NewsList", newsList);
    return newsList;
  }

  @override
  Future<List<News>> refreshNewsList() async {
    final newsList = await client.fetchNews();
    cache.put("NewsList", newsList);
    return newsList;
  }

  @override
  Future<List<Exhibition>> getExhibitionList() async {
    final cachedExhibitionList = await cache.get("ExhibitionList") as List<Exhibition>;
    if (cachedExhibitionList != null) {
      return cachedExhibitionList;
    }

    final exhibitionList = await client.fetchExhibitions();
    cache.put("ExhibitionList", exhibitionList);
    return exhibitionList;
  }

  @override
  Future<List<Exhibition>> refreshExhibitionList() async {
    final exhibitionList = await client.fetchExhibitions();
    cache.put("ExhibitionList", exhibitionList);
    return exhibitionList;
  }
}
