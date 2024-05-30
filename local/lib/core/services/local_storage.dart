import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class LocalStorage {
  Future<void> write(SecureStorageItem item);

  Future<dynamic> read(String key);

  Future<void> delete(String key);

  Future<void> deleteAll();

  Future<bool> exists(String key);

  Future<Map<String, dynamic>> readAll();

  Future<bool> containsKey(String key);
}

class SecureStorageItem<T>{
  final String key;
  final T value;

  SecureStorageItem({required this.key, required this.value});
}

class LocalStorageImpl implements LocalStorage {
  final FlutterSecureStorage _storage;

  LocalStorageImpl(this._storage) ;

  @override
  Future<void> write(SecureStorageItem item) async {
    final encodedValue = item.value;
    await _storage.write(key: item.key, value: encodedValue);
  }

  @override
  Future<dynamic> read(String key) async {
    final encodedValue = await _storage.read(key: key);
    return encodedValue;
  }

  @override
  Future<void> delete(String key) async {
    await _storage.delete(key: key);
  }

  @override
  Future<void> deleteAll() async {
    await _storage.deleteAll();
  }

  @override
  Future<bool> exists(String key) async {
    final result = await _storage.containsKey(key: key);
    return result;
  }

  @override
  Future<Map<String, dynamic>> readAll() async {
    final allItems = await _storage.readAll();
    return allItems;
  }

  @override
  Future<bool> containsKey(String key) async {
    final result = await _storage.containsKey(key: key);
    return result;
  }
}
