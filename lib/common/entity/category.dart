/*
 * @Author: 西瓜哥
 * @Github: https://github.com/siaoynli
 * @LastEditors: 西瓜哥
 * @Date: 2021-04-14 16:50:42
 * @LastEditTime: 2021-04-14 17:33:18
 * @Description:
 * @Copyright: (c) 2021 http://www.hangzhou.com.cn All rights reserved
 */

class CategoryResponse {
  List<CategoryModel> data = [];
  int state;

  CategoryResponse({this.data, this.state});

  CategoryResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      json['data'].forEach((v) {
        this.data.add(CategoryModel.fromJson(v));
      });
    }
    this.state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['state'] = this.state;
    return data;
  }
}

class CategoryModel {
  int id;
  String title;
  String description;
  String intro;

  CategoryModel({this.id, this.title, this.description, this.intro});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    intro = json['intro'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['intro'] = this.intro;
    return data;
  }
}
