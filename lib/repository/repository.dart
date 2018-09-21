import "dart:async";
import "package:mtc2018_app/model/session.dart";

abstract class Repository {
  Future<List<Session>> getSessionList();
}
