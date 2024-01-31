import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  static Future<bool> save({
    required String box,
    required String key,
    required Map<String, dynamic> value,
  }) async {
    try {
      var hiveBox = await Hive.openBox(box);
      await hiveBox.put(key, value);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future get({required String box, required String key}) async {
    try {
      var hiveBox = await Hive.openBox(box);
      final item = await hiveBox.get(key);
      return item;
    } catch (e) {
      return null;
    }
  }

  static Future<bool> delete({
    required String box,
    required String key,
  }) async {
    try {
      var hiveBox = await Hive.openBox(box);
      await hiveBox.delete(key);
      return true;
    } catch (e) {
      return false;
    }
  }
}
