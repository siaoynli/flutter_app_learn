/*
 * @Author: 西瓜哥
 * @Github: https://github.com/siaoynli
 * @LastEditors: 西瓜哥
 * @Date: 2021-04-08 15:59:04
 * @LastEditTime: 2021-04-20 10:16:59
 * @Description:
 * @Copyright: (c) 2021 http://www.hangzhou.com.cn All rights reserved
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hangzhoutong/common/utils/screen.dart';
import 'package:hangzhoutong/common/utils/utils.dart';
import 'package:hangzhoutong/common/values/values.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
    StorageUtil().setBool(STORAGE_DEVICE_ALREADY_OPEN_KEY, false);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: () => Scaffold(
        body: Container(
          width: 1.sw,
          height: 1.sh,
          child: Column(
            children: [
              _buildPageTitle(),
              _buildPageTitleDetail(),
              _buildPageList(),
              Spacer(),
              _buildStartButton(),
            ],
          ),
        ),
      ),
    );
  }

  _buildPageTitle() {
    return Container(
      margin: EdgeInsets.only(top: duSetHeight(60)),
      child: Text(
        "Features",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.primaryText,
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w600,
          fontSize: duSetFontSize(24),
        ),
      ),
    );
  }

  _buildPageTitleDetail() {
    return Container(
      margin: EdgeInsets.only(top: duSetHeight(14)),
      width: duSetWidth(242),
      height: duSetHeight(70),
      child: Text(
        'The best of news channels all in one place. Trusted sources and personalized news for you.',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.primaryText,
          fontFamily: "Avenir",
          fontSize: duSetFontSize(16),
          height: 1.3,
        ),
      ),
    );
  }

  _buildPageList() {
    return Container(
      width: duSetWidth(295),
      padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
      child: Column(
        children: [
          _buildFeatureItem(
            "feature-1",
            "Compelling photography and typography provide a beautiful reading",
          ),
          _buildFeatureItem(
            "feature-2",
            "Sector news never shares your personal data with advertisers or publishers",
          ),
          _buildFeatureItem(
            "feature-3",
            "You can get Premium to unlock hundreds of publications",
          ),
        ],
      ),
    );
  }

  _buildStartButton() {
    return Container(
      width: duSetWidth(295),
      height: duSetHeight(44),
      margin: EdgeInsets.only(bottom: duSetHeight(20)),
      child: TextButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(
              //StadiumBorder()
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.w),
              ),
            ),
            //这里设置文字不起作用
            // textStyle: MaterialStateProperty.all(
            //   TextStyle(
            //     fontSize: 18,
            //     color: Colors.white,
            //   ),
            // ),
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              return AppColors.primaryElement;
            })),
        child: Text(
          'Get started',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/sign-in');
        },
      ),
    );
  }

  _buildFeatureItem(String imageName, String intro) {
    return Container(
      height: duSetHeight(80),
      margin: EdgeInsets.only(top: duSetHeight(20)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: duSetWidth(80),
            height: duSetWidth(80),
            margin: EdgeInsets.only(right: 20.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.w),
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/$imageName.png",
                ),
                fit: BoxFit.cover,
              ),
            ),
            // child: ClipRRect(
            //   borderRadius: BorderRadius.circular(10.w),
            //   child: Image.asset(
            //     "assets/images/$imageName.png",
            //     fit: BoxFit.cover,
            //   ),
            // ),
          ),
          Expanded(
            child: Text(
              intro,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: "Avenir",
                fontWeight: FontWeight.normal,
                fontSize: duSetFontSize(16),
              ),
            ),
            flex: 1,
          )
        ],
      ),
    );
  }
}
