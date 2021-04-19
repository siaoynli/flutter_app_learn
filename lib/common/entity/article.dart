/*
 * @Author: 西瓜哥
 * @Github: https://github.com/siaoynli
 * @LastEditors: 西瓜哥
 * @Date: 2021-04-14 16:06:04
 * @LastEditTime: 2021-04-15 14:11:44
 * @Description:
 * @Copyright: (c) 2021 http://www.hangzhou.com.cn All rights reserved
 */

class ArticleResponse {
  List<ArticleModel> data = [];
  int state;

  ArticleResponse({this.data, this.state});

  ArticleResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      json['data'].forEach((v) {
        this.data.add(ArticleModel.fromJson(v));
      });
    }
    this.state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['state'] = this.state;
    return data;
  }
}

class ArticleModel {
  int id;
  String title;
  String thumbFile;
  String attribute;
  String type;
  String intro;
  String publishedAt;
  List<String> ossThumbFile;
  String url;
  String shareUrl;
  int allowComment;

  ArticleModel(
      {this.id,
      this.title,
      this.thumbFile,
      this.attribute,
      this.type,
      this.intro,
      this.publishedAt,
      this.ossThumbFile,
      this.url,
      this.shareUrl,
      this.allowComment});

  ArticleModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    thumbFile = json['thumb_file'];
    attribute = json['attribute'];
    type = json['type'];
    intro = json['intro'];
    publishedAt = json['published_at'];
    ossThumbFile = json['oss_thumb_file'].cast<String>();
    url = json['url'];
    shareUrl = json['share_url'];
    allowComment = json['allow_comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['thumb_file'] = this.thumbFile;
    data['attribute'] = this.attribute;
    data['type'] = this.type;
    data['intro'] = this.intro;
    data['published_at'] = this.publishedAt;
    data['oss_thumb_file'] = this.ossThumbFile;
    data['url'] = this.url;
    data['share_url'] = this.shareUrl;
    data['allow_comment'] = this.allowComment;
    return data;
  }
}
