import "dart:async";
import "package:mtc2018_app/model/session.dart";
import "package:mtc2018_app/model/news.dart";

abstract class Repository {
  Future<List<Session>> getSessionList();
  Future<List<News>> getNewsList();
}
