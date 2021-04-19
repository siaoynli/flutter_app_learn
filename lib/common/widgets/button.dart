/*
 * @Author: 西瓜哥
 * @Github: https://github.com/siaoynli
 * @LastEditors: 西瓜哥
 * @Date: 2021-04-09 11:14:25
 * @LastEditTime: 2021-04-09 11:31:07
 * @Description:
 * @Copyright: (c) 2021 http://www.hangzhou.com.cn All rights reserved
 */

import 'package:flutter/material.dart';
import 'package:hangzhoutong/common/utils/utils.dart';
import 'package:hangzhoutong/common/values/values.dart';

Widget btnTextButtonWidget({
  @required VoidCallback onPressed,
  double width = 140,
  double height = 40,
  Color gbColor = AppColors.primaryElement,
  String title = "button",
  Color fontColor = AppColors.primaryElementText,
  double fontSize = 18,
  String fontName = "Montserrat",
  FontWeight fontWeight = FontWeight.w400,
}) {
  return Container(
    width: duSetWidth(width),
    height: duSetHeight(height),
    child: TextButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(duSetWidth(6)),
          ),
        ),
        backgroundColor: MaterialStateProperty.resolveWith(
          (states) {
            return gbColor;
          },
        ),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(
          fontSize: fontSize,
          color: fontColor,
          fontFamily: fontName,
          fontWeight: fontWeight,
        ),
      ),
    ),
  );
}

Widget btnTextButtonBorderOnlyWidget({
  @required VoidCallback onPressed,
  double width = 88,
  double height = 44,
  String iconFileName,
}) {
  return Container(
    width: duSetWidth(width),
    height: duSetHeight(height),
    child: TextButton(
      onPressed: onPressed,
      child: Image.asset(
        "assets/images/icons-$iconFileName.png",
      ),
    ),
  );
}
