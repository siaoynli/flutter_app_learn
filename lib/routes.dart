/*
 * @Author: 西瓜哥
 * @Github: https://github.com/siaoynli
 * @LastEditors: 西瓜哥
 * @Date: 2021-04-09 10:37:53
 * @LastEditTime: 2021-04-15 10:03:33
 * @Description:
 * @Copyright: (c) 2021 http://www.hangzhou.com.cn All rights reserved
 */

import 'package:hangzhoutong/pages/application/application.dart';
import 'package:hangzhoutong/pages/sign_in/sign_in.dart';
import 'package:hangzhoutong/pages/sign_up/sign_up.dart';

var staticRoutes = {
  "/sign-in": (context) => SignInPage(), // 登录
  "/sign-up": (context) => SignUpPage(), // 注册
  "/app": (context) => ApplicationPage(), // 注册
};
