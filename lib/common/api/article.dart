/*
 * @Author: 西瓜哥
 * @Github: https://github.com/siaoynli
 * @LastEditors: 西瓜哥
 * @Date: 2021-04-14 16:08:44
 * @LastEditTime: 2021-04-15 15:00:03
 * @Description:
 * @Copyright: (c) 2021 http://www.hangzhou.com.cn All rights reserved
 */

import 'package:hangzhoutong/common/entity/article.dart';
import 'package:hangzhoutong/common/utils/utils.dart';

class ArticleApi {
  static Future<ArticleResponse> news(int cid,
      {Map<String, int> params}) async {
    var response = await HttpUtil().get('/news/$cid', params: params);
    return ArticleResponse.fromJson(response);
  }
}
