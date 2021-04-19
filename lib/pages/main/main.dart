/*
 * @Author: 西瓜哥
 * @Github: https://github.com/siaoynli
 * @LastEditors: 西瓜哥
 * @Date: 2021-04-14 16:34:31
 * @LastEditTime: 2021-04-15 13:39:45
 * @Description:
 * @Copyright: (c) 2021 http://www.hangzhou.com.cn All rights reserved
 */

import 'package:flutter/material.dart';
import 'package:hangzhoutong/common/api/apis.dart';
import 'package:hangzhoutong/common/api/category.dart';
import 'package:hangzhoutong/common/entity/category.dart';
import 'package:hangzhoutong/common/utils/screen.dart';
import 'package:hangzhoutong/common/values/color.dart';
import 'package:hangzhoutong/common/widgets/index.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  TabController _tabController;

  List<CategoryModel> _catgories = [];

  bool hasLoad = false;

  @override
  void initState() {
    super.initState();
    _loadData();
    _tabController = TabController(length: _catgories.length, vsync: this);
  }

  _loadData() async {
    try {
      CategoryResponse categoryResult = await CategoryApi.getAll();
      if (mounted) {
        setState(() {
          hasLoad = true;
          _catgories = categoryResult.data;
          _tabController =
              TabController(length: _catgories.length, vsync: this);
        });
      }
    } catch (e) {
      print("e _loadData:$e");
    }
  }

  // 分类菜单
  Widget _buildCategories() {
    return Container(
      height: duSetHeight(40),
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: hasLoad == false
          ? Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: Colors.black.withOpacity(0.1),
              ),
            )
          : TabBar(
              controller: _tabController,
              indicatorColor: Colors.grey,
              labelColor: AppColors.primaryText,
              unselectedLabelColor: Colors.red,
              unselectedLabelStyle: TextStyle(fontSize: 16),
              labelStyle: TextStyle(fontSize: 16),
              isScrollable: true,
              onTap: (int index) {
                print('Selected......$index');
              },
              tabs: List.generate(
                _catgories.length,
                (index) {
                  return _catgories.length == 0
                      ? Container()
                      : Text(_catgories[index].title);
                },
              ),
            ),
    );
  }
  // 抽取前先实现业务

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _buildCategories(),
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TabBarView(
                  children: _buildPages(),
                  controller: _tabController,
                ),
              ))
        ],
      ),
    );
  }

  _buildPages() {
    List<Widget> pages = [];
    for (var item in _catgories) {
      pages.add(IndexPage(categoryModel: item));
    }
    return pages;
  }
}
