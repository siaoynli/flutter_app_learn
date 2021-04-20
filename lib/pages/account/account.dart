/*
 * @Author: 西瓜哥
 * @Github: https://github.com/siaoynli
 * @LastEditors: 西瓜哥
 * @Date: 2021-04-14 16:40:29
 * @LastEditTime: 2021-04-20 15:17:19
 * @Description:
 * @Copyright: (c) 2021 http://www.hangzhou.com.cn All rights reserved
 */
import 'package:flutter/material.dart';
import 'package:hangzhoutong/common/provider/provider.dart';
import 'package:hangzhoutong/common/utils/utils.dart';
import 'package:hangzhoutong/global.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();

    return Column(
      children: <Widget>[
        Text('用户: ${Global.user?.userName}'),
        Divider(),
        MaterialButton(
          onPressed: () {
            goLoginPage(context);
          },
          child: Text('退出'),
        ),
        Divider(),
        MaterialButton(
          onPressed: () {
            appState.switchGreyFilter();
          },
          child: Text('灰色切换 ${appState.isGreyFilter}'),
        ),
      ],
    );
  }
}
