/*
 * @Author: 西瓜哥
 * @Github: https://github.com/siaoynli
 * @LastEditors: 西瓜哥
 * @Date: 2021-04-09 16:53:23
 * @LastEditTime: 2021-04-09 16:53:42
 * @Description:
 * @Copyright: (c) 2021 http://www.hangzhou.com.cn All rights reserved
 */

import 'dart:convert';

import 'package:crypto/crypto.dart';

String duSHA256(String input) {
  String salt = 'EIpWsyfiy@R@X#qn17!StJNdZK1fFF8iV6ffN!goZkqt#JxO'; // 加盐
  var bytes = utf8.encode(input + salt);
  var digest = sha256.convert(bytes);

  return digest.toString();
}
