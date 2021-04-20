/*
 * @Author: 西瓜哥
 * @Github: https://github.com/siaoynli
 * @LastEditors: 西瓜哥
 * @Date: 2021-04-20 09:51:40
 * @LastEditTime: 2021-04-20 10:11:07
 * @Description:
 * @Copyright: (c) 2021 http://www.hangzhou.com.cn All rights reserved
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hangzhoutong/global.dart';
import 'package:hangzhoutong/pages/application/application.dart';
import 'package:hangzhoutong/pages/sign_in/sign_in.dart';
import 'package:hangzhoutong/pages/welcome/welcome.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: () => Scaffold(
        body: Global.isFirstOpen == true
            ? WelcomePage()
            : Global.isOfflineLogin == true
                ? ApplicationPage()
                : SignInPage(),
      ),
    );
  }
}
