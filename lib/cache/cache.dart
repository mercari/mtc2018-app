import "dart:async";

abstract class Cache<T> {
  Future<T> get(String key);
  put(String key, T object);
}
