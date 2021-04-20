/*
 * @Author: 西瓜哥
 * @Github: https://github.com/siaoynli
 * @LastEditors: 西瓜哥
 * @Date: 2021-04-09 10:32:10
 * @LastEditTime: 2021-04-20 16:40:01
 * @Description:
 * @Copyright: (c) 2021 http://www.hangzhou.com.cn All rights reserved
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hangzhoutong/common/api/apis.dart';
import 'package:hangzhoutong/common/entity/entitys.dart';
import 'package:hangzhoutong/common/utils/utils.dart';
import 'package:hangzhoutong/common/values/values.dart';
import 'package:hangzhoutong/common/widgets/button.dart';
import 'package:hangzhoutong/common/widgets/input.dart';
import 'package:hangzhoutong/common/widgets/toast.dart';
import 'package:hangzhoutong/global.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  Widget _buildLogo() {
    return Container(
      width: 110.w,
      height: 140.w,
      margin: EdgeInsets.only(top: 84.h),
      child: Column(
        children: [
          Container(
            width: 76.w,
            height: 76.w,
            decoration: BoxDecoration(
              color: AppColors.primaryBackground,
              shape: BoxShape.circle,
              boxShadow: [
                Shadows.primaryShadow,
              ],
            ),
            child: Image(
              image: AssetImage(
                "assets/images/logo.png",
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15.h),
            child: Text(
              "SECTOR",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w600,
                fontSize: 24.sp,
                height: 1,
              ),
            ),
          ),
          Text(
            "news",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primaryText,
              fontFamily: "Avenir",
              fontWeight: FontWeight.w400,
              fontSize: 16.sp,
              height: 1,
            ),
          ),
        ],
      ),
    );
  }

  // 登录表单
  Widget _buildInputForm() {
    return Container(
      width: duSetWidth(300),
      child: Column(
        children: [
          inputTextEdit(
            controller: _emailController,
            hintText: "Email",
            keyboardType: TextInputType.emailAddress,
          ),
          inputTextEdit(
            controller: _passController,
            hintText: "Password",
            isPassword: true,
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                btnTextButtonWidget(
                  title: "Sign Up",
                  height: duSetHeight(50),
                  gbColor: AppColors.thirdElement,
                  onPressed: _handleNavSignUp,
                ),
                btnTextButtonWidget(
                  title: "Sign In",
                  height: duSetHeight(50),
                  onPressed: _handleSignIn,
                ),
              ],
            ),
          ),
          Container(
            height: duSetHeight(30),
            margin: EdgeInsets.only(top: duSetHeight(20)),
            child: TextButton(
              onPressed: () => {},
              child: Text(
                "Fogot password?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.secondaryElementText,
                  fontFamily: "Avenir",
                  fontWeight: FontWeight.w400,
                  fontSize: duSetFontSize(16),
                  height: 1, // 设置下行高，否则字体下沉
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 第三方登录
  Widget _buildThirdPartyLogin() {
    return Container(
      width: duSetWidth(295),
      margin: EdgeInsets.only(bottom: duSetHeight(40)),
      child: Column(
        children: <Widget>[
          // title
          Text(
            "Or sign in with social networks",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primaryText,
              fontFamily: "Avenir",
              fontWeight: FontWeight.w400,
              fontSize: duSetFontSize(16),
            ),
          ),
          // 按钮
          Padding(
            padding: EdgeInsets.only(top: duSetHeight(20)),
            child: Row(
              children: <Widget>[
                btnTextButtonBorderOnlyWidget(
                  onPressed: () {},
                  width: 88,
                  iconFileName: "twitter",
                ),
                Spacer(),
                btnTextButtonBorderOnlyWidget(
                  onPressed: () {},
                  width: 88,
                  iconFileName: "google",
                ),
                Spacer(),
                btnTextButtonBorderOnlyWidget(
                  onPressed: () {},
                  width: 88,
                  iconFileName: "facebook",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 注册按钮
  Widget _buildSignupButton() {
    return Container(
      margin: EdgeInsets.only(bottom: duSetHeight(30)),
      child: btnTextButtonWidget(
        onPressed: () {
          Navigator.pushNamed(context, '/sign-up');
        },
        width: 294,
        gbColor: AppColors.secondaryElement,
        fontColor: AppColors.primaryText,
        title: "Sign up",
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: 1.sw,
        height: 1.sh,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              _buildLogo(),
              _buildInputForm(),
              // Spacer(),
              _buildThirdPartyLogin(),
              _buildSignupButton(),
            ],
          ),
        ),
      ),
    );
  }

  _handleSignIn() async {
    // return;

    if (!duIsEmail(_emailController.value.text)) {
      toastInfo(msg: '请正确输入邮件地址', backgroundColor: Colors.red);
      return;
    }
    if (!duCheckStringLength(_passController.value.text, 6)) {
      toastInfo(msg: '密码不能小于6位', backgroundColor: Colors.red);
      return;
    }

    UserRequestEntity params = UserRequestEntity(
        email: _emailController.value.text,
        password: _passController.value.text);

    print("login...");

    UserAPI.login(params: params).then((UserResponseEntity token) {
      Global.saveToken(token);
      print("token:$token");

      UserAPI.authenticate(context: context).then((UserModel user) {
        Global.saveProfile(user);
        Navigator.pushNamed(context, '/app');
      }).onError((error, stackTrace) {
        throw error;
      });
    }).onError((error, stackTrace) {
      toastInfo(msg: error.toString(), backgroundColor: Colors.red);
    });
  }

  void _handleNavSignUp() {
    Navigator.pushNamed(context, '/sign-up');
  }
}
