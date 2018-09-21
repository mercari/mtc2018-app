import "dart:async";

import "package:mtc2018_app/api/client.dart";
import "repository.dart";
import "package:mtc2018_app/cache/cache.dart";
import "package:mtc2018_app/model/session.dart";

class CachingRepository extends Repository {
  final Cache<List<Session>> cache;
  final client = Client();

  CachingRepository({this.cache});

  @override
  Future<List<Session>> getSessionList() async {
    final cachedSeesionList = await cache.get("SessionList");
    if (cachedSeesionList != null) {
      return cachedSeesionList;
    }

    final sessions = await client.fetchSessions();
    cache.put("SessionList", sessions);
    return sessions;
  }
}
