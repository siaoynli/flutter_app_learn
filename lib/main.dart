/*
 * @Author: 西瓜哥
 * @Github: https://github.com/siaoynli
 * @LastEditors: 西瓜哥
 * @Date: 2021-04-08 15:46:24
 * @LastEditTime: 2021-04-20 16:07:34
 * @Description:
 * @Copyright: (c) 2021 http://www.hangzhou.com.cn All rights reserved
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hangzhoutong/common/provider/provider.dart';
import 'package:hangzhoutong/common/values/color.dart';
import 'package:hangzhoutong/global.dart';
import 'package:hangzhoutong/routes.dart';
import 'package:hangzhoutong/pages/index/index.dart';
import 'package:provider/provider.dart';

// void main() => Global.init().then((e) => runApp(MyApp()));

void main() => Global.init().then(
      (e) => runApp(
        MultiProvider(
          providers: [
            ChangeNotifierProvider<AppState>.value(
              value: Global.appState,
            ),
            // ChangeNotifierProvider<AppState>(create: (_) => AppState()),
          ],
          child: Consumer<AppState>(builder: (context, appState, _) {
            if (appState.isGreyFilter) {
              return ColorFiltered(
                colorFilter: ColorFilter.mode(Colors.white, BlendMode.color),
                child: MyApp(),
              );
            } else {
              return MyApp();
            }
          }),
        ),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: () => MaterialApp(
        title: '杭州通',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: IndexPage(),
        routes: staticRoutes,
      ),
    );
  }
}
