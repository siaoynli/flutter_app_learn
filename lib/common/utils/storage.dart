/*
 * @Author: 西瓜哥
 * @Github: https://github.com/siaoynli
 * @LastEditors: 西瓜哥
 * @Date: 2021-04-09 15:32:17
 * @LastEditTime: 2021-04-14 11:30:30
 * @Description:
 * @Copyright: (c) 2021 http://www.hangzhou.com.cn All rights reserved
 */

import 'package:shared_preferences/shared_preferences.dart';

class StorageUtil {
  static StorageUtil _instance = StorageUtil._();
  factory StorageUtil() => _instance;
  static SharedPreferences prefs;

  StorageUtil._();

  //初始化shared_preferences
  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<bool> setString(String key, String value) =>
      prefs.setString(key, value);

  Future<bool> setDouble(String key, double value) =>
      prefs.setDouble(key, value);

  Future<bool> setBool(String key, bool value) => prefs.setBool(key, value);

  Future<bool> setInt(String key, int value) => prefs.setInt(key, value);

  Future<bool> setStringList(String key, List<String> value) =>
      prefs.setStringList(key, value);

  T get<T>(String key) {
    return prefs.get(key);
  }
}
