/*
 * @Author: 西瓜哥
 * @Github: https://github.com/siaoynli
 * @LastEditors: 西瓜哥
 * @Date: 2021-04-15 11:32:53
 * @LastEditTime: 2021-04-20 11:03:46
 * @Description:
 * @Copyright: (c) 2021 http://www.hangzhou.com.cn All rights reserved
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:hangzhoutong/common/api/apis.dart';
import 'package:hangzhoutong/common/api/focus.dart';
import 'package:hangzhoutong/common/entity/article.dart';
import 'package:hangzhoutong/common/entity/category.dart';
import 'package:hangzhoutong/common/entity/focus.dart';
import 'package:hangzhoutong/common/utils/utils.dart';
import 'package:hangzhoutong/common/widgets/image.dart';
import 'package:hangzhoutong/common/widgets/web_view.dart';

class NewsPage extends StatefulWidget {
  final CategoryModel categoryModel;

  //@required 参数必须
  const NewsPage({Key key, @required this.categoryModel}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage>
    with AutomaticKeepAliveClientMixin {
  List<FocusModel> _focus = [];
  List<ArticleModel> _articles = [];
  int page = 1;
  ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          (_scrollController.position.maxScrollExtent)) {
        //加载数据
        setState(() {
          page = page + 1;
          _loadNews(page);
        });
      }
    });

    _loadFocus();
    _loadNews(page);
  }

  _loadFocus() async {
    try {
      FocusResponse focusResult =
          await FocusApi.getAll(widget.categoryModel.id);
      setState(() {
        _focus = focusResult.data;
      });
    } catch (e) {
      print("e _loadfocus:$e");
    }
  }

  _loadNews(int page) async {
    try {
      print("load news...page:$page");
      ArticleResponse articlesResult = await ArticleApi.news(
          widget.categoryModel.id,
          params: {"page": page});

      setState(() {
        _articles.addAll(articlesResult.data);
        // print(_articles.length);
      });
    } catch (e) {
      print("e _loadNews:$e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RefreshIndicator(
        onRefresh: () {
          _loadFocus();
          _loadNews(page);
          print("下拉刷新");
          return Future.value(true);
        },
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          controller: _scrollController,
          child: Column(
            children: [
              _buildFocus(),
              _buildArticles(),
            ],
          ),
        ),
      ),
    );
  }

  _buildFocus() {
    return _focus.length == 0
        ? Container()
        : Container(
            height: duSetHeight(200),
            width: 1.sw,
            child: Swiper(
              autoplay: true,
              duration: 800,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WebViewPage(
                          url: _focus[index].url,
                          title: _focus[index].title ?? "详情",
                        ),
                      ),
                    );
                  },
                  child: Stack(
                    children: [
                      Container(
                        height: duSetHeight(200),
                        width: 1.sw,
                        child: imageCached(_focus[index].ossThumbFile[0]),
                      ),
                      Positioned(
                          child: Container(
                            child: Text(
                              _focus[index].title,
                              maxLines: 1,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                          bottom: 30,
                          left: 10,
                          right: 10)
                    ],
                  ),
                );
              },
              itemCount: _focus.length,
              pagination: SwiperPagination(),
            ),
          );
  }

  _buildArticles() {
    return Container(
      child: Column(
        children: _articles.length == 0
            ? []
            : List.generate(
                _articles.length,
                (index) => _buildArticle(index),
              ),
      ),
    );
  }

  _buildArticle(int index) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          padding: EdgeInsets.only(bottom: 10),
          height: duSetWidth(100),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WebViewPage(
                    url: _articles[index].url,
                    title: _articles[index].title ?? "详情",
                  ),
                ),
              );
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _articles[index].ossThumbFile.length == 0
                    ? Container()
                    : Container(
                        width: duSetWidth(120),
                        height: duSetWidth(100),
                        margin: EdgeInsets.only(right: 10),
                        child: imageCached(_articles[index].ossThumbFile[0],
                            width: 200, height: 100),
                      ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        _articles[index].title,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        _articles[index].intro,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                      )
                    ],
                  ),
                  flex: 1,
                )
              ],
            ),
          ),
        ),
        Divider(
          height: 1,
        )
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
