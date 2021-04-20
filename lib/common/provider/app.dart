/*
 * @Author: 西瓜哥
 * @Github: https://github.com/siaoynli
 * @LastEditors: 西瓜哥
 * @Date: 2021-04-20 11:12:16
 * @LastEditTime: 2021-04-20 16:13:57
 * @Description:
 * @Copyright: (c) 2021 http://www.hangzhou.com.cn All rights reserved
 */

import 'package:flutter/material.dart';

class AppState with ChangeNotifier {
  bool _isGreyFilter;
  AppState({
    bool isGreyFilter = false,
  }) {
    this._isGreyFilter = isGreyFilter;
  }

  get isGreyFilter => _isGreyFilter;

  switchGreyFilter() {
    _isGreyFilter = !_isGreyFilter;
    notifyListeners();
  }
}
