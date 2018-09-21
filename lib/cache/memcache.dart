import "dart:async";
import "dart:collection";
import "cache.dart";

class MemCache<T> extends Cache<T> {
  final map = HashMap<String, T>();

  @override
  Future<T> get(String key) {
    return Future.value(map[key]);
  }

  @override
  put(String key, object) {
    map[key] = object;
  }
}
