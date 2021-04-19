/*
 * @Author: 西瓜哥
 * @Github: https://github.com/siaoynli
 * @LastEditors: 西瓜哥
 * @Date: 2021-04-15 10:31:50
 * @LastEditTime: 2021-04-15 10:33:30
 * @Description:
 * @Copyright: (c) 2021 http://www.hangzhou.com.cn All rights reserved
 */

class FocusResponse {
  List<FocusModel> data = [];
  int state;

  FocusResponse({this.data, this.state});

  FocusResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      json['data'].forEach((v) {
        this.data.add(FocusModel.fromJson(v));
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

class FocusModel {
  int id;
  String title;
  String thumbFile;
  List<String> ossThumbFile;
  String url;
  String shareUrl;
  Null allowComment;

  FocusModel(
      {this.id,
      this.title,
      this.thumbFile,
      this.ossThumbFile,
      this.url,
      this.shareUrl,
      this.allowComment});

  FocusModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    thumbFile = json['thumb_file'];
    ossThumbFile = json['oss_thumb_file'].cast<String>();
    url = json['url'];
    shareUrl = json['share_url'];
    allowComment = json['allow_comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['thumb_file'] = this.thumbFile;
    data['oss_thumb_file'] = this.ossThumbFile;
    data['url'] = this.url;
    data['share_url'] = this.shareUrl;
    data['allow_comment'] = this.allowComment;
    return data;
  }
}
