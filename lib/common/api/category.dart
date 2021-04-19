/*
 * @Author: 西瓜哥
 * @Github: https://github.com/siaoynli
 * @LastEditors: 西瓜哥
 * @Date: 2021-04-14 16:50:42
 * @LastEditTime: 2021-04-15 09:37:42
 * @Description:
 * @Copyright: (c) 2021 http://www.hangzhou.com.cn All rights reserved
 */

import 'package:hangzhoutong/common/entity/category.dart';
import 'package:hangzhoutong/common/utils/utils.dart';

class CategoryApi {
  static Future<CategoryResponse> getAll() async {
    var response = await HttpUtil().get('/category');
    return CategoryResponse.fromJson(response);
  }
}
