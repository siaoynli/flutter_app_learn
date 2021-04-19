/*
 * @Author: 西瓜哥
 * @Github: https://github.com/siaoynli
 * @LastEditors: 西瓜哥
 * @Date: 2021-04-14 16:50:42
 * @LastEditTime: 2021-04-15 10:34:29
 * @Description:
 * @Copyright: (c) 2021 http://www.hangzhou.com.cn All rights reserved
 */

import 'package:hangzhoutong/common/entity/focus.dart';
import 'package:hangzhoutong/common/utils/utils.dart';

class FocusApi {
  static Future<FocusResponse> getAll(int cid) async {
    var response = await HttpUtil().get('/focus/$cid');
    return FocusResponse.fromJson(response);
  }
}
