/*
 * @Author: 西瓜哥
 * @Github: https://github.com/siaoynli
 * @LastEditors: 西瓜哥
 * @Date: 2021-04-14 10:14:19
 * @LastEditTime: 2021-04-14 14:34:25
 * @Description:
 * @Copyright: (c) 2021 http://www.hangzhou.com.cn All rights reserved
 */

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hangzhoutong/common/entity/entitys.dart';
import 'package:hangzhoutong/common/utils/http.dart';
import 'package:hangzhoutong/common/utils/utils.dart';
import 'package:hangzhoutong/common/values/values.dart';

class Global {
  static UserResponseEntity profile = UserResponseEntity(accessToken: null);

  static bool get isRelease => bool.fromEnvironment("dart.vm.product");

  //初始化
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await StorageUtil.init();
    HttpUtil();

    var _profileString = StorageUtil().get<String>(STORAGE_USER_PROFILE_KEY);
    if (_profileString != null) {
      Map<String, dynamic> _profileJson = json.decode(_profileString);
      profile = UserResponseEntity.fromJson(_profileJson);
    }

    //如果是安卓系统，设置状态栏透明
    if (Platform.isAndroid) {
      SystemUiOverlayStyle systemUiOverlayStyle =
          SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
    print("profile:$profile");
  }

  static Future<bool> saveProfile(UserResponseEntity userResponse) {
    profile = userResponse;
    return StorageUtil()
        .setString(STORAGE_USER_PROFILE_KEY, json.encode(profile.toJson()));
  }
}
