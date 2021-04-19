/*
 * @Author: 西瓜哥
 * @Github: https://github.com/siaoynli
 * @LastEditors: 西瓜哥
 * @Date: 2021-04-14 14:39:07
 * @LastEditTime: 2021-04-14 15:57:31
 * @Description:
 * @Copyright: (c) 2021 http://www.hangzhou.com.cn All rights reserved
 */

import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:hangzhoutong/common/values/values.dart';

class CacheObject {
  CacheObject(this.response)
      : timeStamp = DateTime.now().millisecondsSinceEpoch;
  Response response;
  int timeStamp;

  @override
  bool operator ==(other) {
    return response.hashCode == other.hashCode;
  }

  @override
  int get hashCode => response.realUri.hashCode;
}

class NetCache extends Interceptor {
  // 为确保迭代器顺序和对象插入时间一致顺序一致，我们使用LinkedHashMap
  var cache = LinkedHashMap<String, CacheObject>();

  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (!CACHE_ENABLE) return handler.next(options);

    // refresh标记是否是"下拉刷新"
    bool refresh = options.extra["refresh"] == true;

    // 如果是下拉刷新，先删除相关缓存
    if (refresh) {
      if (options.extra["list"] == true) {
        //若是列表，则只要url中包含当前path的缓存全部删除（简单实现，并不精准）
        cache.removeWhere((key, v) => key.contains(options.path));
      } else {
        // 如果不是列表，则只删除uri相同的缓存
        delete(options.uri.toString());
      }
    }
    // get 请求，开启缓存
    if (options.extra["cacheEnable"] == true &&
        options.method.toLowerCase() == 'get') {
      String key = options.extra["cacheKey"] ?? options.uri.toString();
      var ob = cache[key];

      if (ob != null) {
        //若缓存未过期，则返回缓存内容
        if ((DateTime.now().millisecondsSinceEpoch - ob.timeStamp) / 1000 <
            CACHE_MAXAGE) {
          return handler.resolve(cache[key].response);
          // return handler.resolve(Response(requestOptions:options,data:'fake data'));
        } else {
          //若已过期则删除缓存，继续向服务器请求
          cache.remove(key);
        }
      }
    }
    return handler.next(options);
  }

  @override
  onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) async {
    return super.onError(err, handler);
  }

  @override
  onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    // 如果启用缓存，将返回结果保存到缓存
    if (CACHE_ENABLE) {
      _saveCache(response);
    }
    return handler.next(response);
  }

  _saveCache(Response object) {
    RequestOptions options = object.requestOptions;

    // 只缓存 get 的请求
    if (options.extra["cacheEnable"] == true &&
        options.method.toLowerCase() == "get") {
      // 如果缓存数量超过最大数量限制，则先移除最早的一条记录
      if (cache.length == CACHE_MAXCOUNT) {
        cache.remove(cache[cache.keys.first]);
      }
      String key = options.extra["cacheKey"] ?? options.uri.toString();
      cache[key] = CacheObject(object);
      print(" cache[key]:${cache[key]}");
    }
  }

  void delete(String key) {
    cache.remove(key);
  }
}
