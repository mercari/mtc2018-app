import "dart:async";

abstract class Cache {
  Future<Object> get(String key);
  put(String key, Object object);
}
