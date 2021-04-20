/*
 * @Author: 西瓜哥
 * @Github: https://github.com/siaoynli
 * @LastEditors: 西瓜哥
 * @Date: 2021-04-09 16:23:55
 * @LastEditTime: 2021-04-20 15:41:34
 * @Description:
 * @Copyright: (c) 2021 http://www.hangzhou.com.cn All rights reserved
 */

import 'package:flutter/cupertino.dart';
import 'package:hangzhoutong/common/entity/entitys.dart';
import 'package:hangzhoutong/common/utils/http.dart';

class UserAPI {
  /// 登录
  static Future<UserResponseEntity> login({UserRequestEntity params}) async {
    var response = await HttpUtil().post('/signIn', params: params);
    return UserResponseEntity.fromJson(response);
  }

  static Future<UserModel> authenticate(
      {@required BuildContext context}) async {
    var response = await HttpUtil().get('/authenticate', context: context);
    return UserModel.fromJson(response);
  }
}
