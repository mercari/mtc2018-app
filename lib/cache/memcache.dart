import "dart:async";
import "dart:collection";
import "cache.dart";

class MemCache<T> extends Cache {
  final map = HashMap<String, Object>();

  @override
  Future<Object> get(String key) {
    return Future.value(map[key]);
  }

  @override
  put(String key, Object object) {
    map[key] = object;
  }
}
