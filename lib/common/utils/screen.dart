/*
 * @Author: 西瓜哥
 * @Github: https://github.com/siaoynli
 * @LastEditors: 西瓜哥
 * @Date: 2021-04-08 16:18:11
 * @LastEditTime: 2021-04-08 16:19:44
 * @Description:
 * @Copyright: (c) 2021 http://www.hangzhou.com.cn All rights reserved
 */

import 'package:flutter_screenutil/flutter_screenutil.dart';

double duSetWidth(double width) {
  return ScreenUtil().setWidth(width);
}

double duSetHeight(double height) {
  return ScreenUtil().setHeight(height);
}

double duSetFontSize(double fontSize) {
  return ScreenUtil().setSp(fontSize);
}
