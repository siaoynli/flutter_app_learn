/*
 * @Author: 西瓜哥
 * @Github: https://github.com/siaoynli
 * @LastEditors: 西瓜哥
 * @Date: 2021-04-09 14:16:09
 * @LastEditTime: 2021-04-15 15:18:37
 * @Description:
 * @Copyright: (c) 2021 http://www.hangzhou.com.cn All rights reserved
 */
import 'package:flutter/material.dart';

Widget transparentAppBar({
  @required BuildContext context,
  Widget title,
  Widget leading,
  List<Widget> actions,
}) {
  return AppBar(
    backgroundColor: Colors.red,
    elevation: 0,
    title: Center(
      child: title,
    ),
    leading: leading,
    actions: actions,
  );
}
