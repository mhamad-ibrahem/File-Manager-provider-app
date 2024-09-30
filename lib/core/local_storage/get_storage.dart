import 'package:get_storage/get_storage.dart';

class LocalStorageService {
 static Future<void> init() async {
    await GetStorage.init();

  }

  static final box = GetStorage();

  void setString({
    required String key,
    required String value,
  }) {
    box.write(key, value);
  }

  String getString(String key) {
    return box.read(key) ?? "";
  }

  void setBool({
    required String key,
    required bool value,
  }) {
    box.write(key, value);
  }

  bool getBool(String key) {
    return box.read(key)??false;
  }

  void setInt({
    required String key,
    required int value,
  }) {
    box.write(key, value);
  }

  int getInt(String key) {
    return box.read(key) ?? 1;
  }

  void clear() {
    box.erase();
  }
}
