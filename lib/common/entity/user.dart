/*
 * @Author: 西瓜哥
 * @Github: https://github.com/siaoynli
 * @LastEditors: 西瓜哥
 * @Date: 2021-04-09 16:24:54
 * @LastEditTime: 2021-04-20 10:13:21
 * @Description:
 * @Copyright: (c) 2021 http://www.hangzhou.com.cn All rights reserved
 */

import 'package:flutter/foundation.dart';

class UserRequestEntity {
  final String email;
  final String password;

  UserRequestEntity({
    @required this.email,
    @required this.password,
  });

  factory UserRequestEntity.fromJson(Map<String, dynamic> json) =>
      UserRequestEntity(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}

// 登录返回
class UserResponseEntity {
  String accessToken;
  String tokenType;
  int expiresIn;
  int state;

  UserResponseEntity({
    this.accessToken,
    this.tokenType,
    this.expiresIn,
    this.state,
  });

  Map<String, dynamic> toJson() => {
        'accessToken': accessToken,
        'tokenType': tokenType,
        'expiresIn': expiresIn,
        'state': state,
      };

  //这里是返回数据的真实格式
  factory UserResponseEntity.fromJson(Map<String, dynamic> map) =>
      UserResponseEntity(
        accessToken: map['access_token'],
        tokenType: map['token_type'],
        expiresIn: map['expires_in'],
        state: map['state'],
      );
}

class UserModel {
  int id;
  String userName;
  String email;
  String phone;
  String avatar;
  String realName;
  String nickName;
  int sex;
  String loginIp;
  Null qq;
  Null address;
  int loginCount;
  int loginErrorCount;
  String loginTime;
  int status;
  Null remarks;
  int roleId;
  int departmentId;
  Null emailVerifiedAt;
  bool phoneVerifiedAt;
  String wallpaper;
  Null wxOpenid;
  Null qqOpenid;
  Null iosOpenid;
  int openComment;
  Null inviteCode;
  int hasInvite;

  UserModel(
      {this.id,
      this.userName,
      this.email,
      this.phone,
      this.avatar,
      this.realName,
      this.nickName,
      this.sex,
      this.loginIp,
      this.qq,
      this.address,
      this.loginCount,
      this.loginErrorCount,
      this.loginTime,
      this.status,
      this.remarks,
      this.roleId,
      this.departmentId,
      this.emailVerifiedAt,
      this.phoneVerifiedAt,
      this.wallpaper,
      this.wxOpenid,
      this.qqOpenid,
      this.iosOpenid,
      this.openComment,
      this.inviteCode,
      this.hasInvite});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['user_name'];
    email = json['email'];
    phone = json['phone'];
    avatar = json['avatar'];
    realName = json['real_name'];
    nickName = json['nick_name'];
    sex = json['sex'];
    loginIp = json['login_ip'];
    qq = json['qq'];
    address = json['address'];
    loginCount = json['login_count'];
    loginErrorCount = json['login_error_count'];
    loginTime = json['login_time'];
    status = json['status'];
    remarks = json['remarks'];
    roleId = json['role_id'];
    departmentId = json['department_id'];
    emailVerifiedAt = json['email_verified_at'];
    phoneVerifiedAt = json['phone_verified_at'];
    wallpaper = json['wallpaper'];
    wxOpenid = json['wx_openid'];
    qqOpenid = json['qq_openid'];
    iosOpenid = json['ios_openid'];
    openComment = json['open_comment'];
    inviteCode = json['invite_code'];
    hasInvite = json['has_invite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_name'] = this.userName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['avatar'] = this.avatar;
    data['real_name'] = this.realName;
    data['nick_name'] = this.nickName;
    data['sex'] = this.sex;
    data['login_ip'] = this.loginIp;
    data['qq'] = this.qq;
    data['address'] = this.address;
    data['login_count'] = this.loginCount;
    data['login_error_count'] = this.loginErrorCount;
    data['login_time'] = this.loginTime;
    data['status'] = this.status;
    data['remarks'] = this.remarks;
    data['role_id'] = this.roleId;
    data['department_id'] = this.departmentId;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['phone_verified_at'] = this.phoneVerifiedAt;
    data['wallpaper'] = this.wallpaper;
    data['wx_openid'] = this.wxOpenid;
    data['qq_openid'] = this.qqOpenid;
    data['ios_openid'] = this.iosOpenid;
    data['open_comment'] = this.openComment;
    data['invite_code'] = this.inviteCode;
    data['has_invite'] = this.hasInvite;
    return data;
  }
}
