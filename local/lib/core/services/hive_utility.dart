// ignore_for_file: unused_element

import 'package:hive/hive.dart';

abstract class HiveService {
  Future<void> _openBox(String boxName);

  Future<void> closeBox();

  Future<int> addItem(dynamic item);

  Future<void> updateItem(int index, dynamic item);

  Future<void> deleteItem(int index);

  dynamic getItem(int index);

  List getAllItems();

  Future<int> getItemCount();

  Future<void> clear();

  bool containsKey(dynamic key);

  dynamic getItemByKey(dynamic key);

  Future<void> deleteItemByKey(dynamic key);

  Future<List> query(bool Function(dynamic) filter);
}

class HiveServiceImplementation implements HiveService {
  late Box _box;

  @override
  Future<void> _openBox(String boxName) async {
    final box = await Hive.openBox(boxName);
    _box = box;
  }

  @override
  Future<void> closeBox() async {
    await _box.close();
  }

  @override
  Future<int> addItem(dynamic item) async {
    final key = await _box.add(item);
    return key;
  }

  @override
  Future<void> updateItem(int index, dynamic item) async {
    await _box.putAt(index, item);
  }

  @override
  Future<void> deleteItem(int index) async {
    await _box.deleteAt(index);
  }

  @override
  dynamic getItem(int index) {
    return _box.getAt(index)!;
  }

  @override
  List getAllItems() {
    return _box.values.toList();
  }

  @override
  Future<int> getItemCount() async {
    return _box.length;
  }

  @override
  Future<void> clear() async {
    await _box.clear();
  }

  @override
  bool containsKey(dynamic key) {
    return _box.containsKey(key);
  }

  @override
  dynamic getItemByKey(dynamic key) {
    return _box.get(key);
  }

  @override
  Future<void> deleteItemByKey(dynamic key) async {
    await _box.delete(key);
  }

  @override
  Future<List> query(bool Function(dynamic) filter) async {
    final items = _box.values.where(filter).toList();
    return items;
  }
}
