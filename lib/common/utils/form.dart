/*
 * @Author: 西瓜哥
 * @Github: https://github.com/siaoynli
 * @LastEditors: 西瓜哥
 * @Date: 2021-04-09 14:07:34
 * @LastEditTime: 2021-04-09 14:21:22
 * @Description:
 * @Copyright: (c) 2021 http://www.hangzhou.com.cn All rights reserved
 */

import 'package:common_utils/common_utils.dart';

bool duIsEmail(String email) {
  if (email == null || email.isEmpty) return false;
  return RegexUtil.isEmail(email);
}

bool duCheckStringLength(String input, int length) {
  if (input == null || input.isEmpty) return false;
  return input.length > length;
}
