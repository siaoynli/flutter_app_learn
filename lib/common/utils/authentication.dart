/*
 * @Author: 西瓜哥
 * @Github: https://github.com/siaoynli
 * @LastEditors: 西瓜哥
 * @Date: 2021-04-20 14:39:52
 * @LastEditTime: 2021-04-20 16:49:37
 * @Description:
 * @Copyright: (c) 2021 http://www.hangzhou.com.cn All rights reserved
 */

import 'package:flutter/material.dart';
import 'package:hangzhoutong/common/utils/utils.dart';
import 'package:hangzhoutong/common/values/storage.dart';
import 'package:hangzhoutong/global.dart';
import 'package:hangzhoutong/pages/index/index.dart';

/// 检查是否有 token
Future<bool> isAuthenticated() async {
  var _tokenString = StorageUtil().get<String>(STORAGE_USER_TOKEN_KEY);
  return _tokenString != null ? true : false;
}

/// 删除缓存 token
Future deleteAuthentication() async {
  await StorageUtil().remove(STORAGE_USER_TOKEN_KEY);
  await StorageUtil().remove(STORAGE_USER_PROFILE_KEY);
  Global.token = null;
  Global.user = null;
}

/// 重新登录
Future goLoginPage(BuildContext context) async {
  await deleteAuthentication();

  Navigator.pushNamedAndRemoveUntil(
      context, "/sign-in", (Route<dynamic> route) => false);
}