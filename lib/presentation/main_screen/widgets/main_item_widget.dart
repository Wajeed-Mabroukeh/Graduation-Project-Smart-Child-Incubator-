import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wajeed_s_application4/core/app_export.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wajeed_s_application4/presentation/main_screen/main_screen.dart';

import '../../child_profile_screen/child_profile_screen.dart';

// ignore: must_be_immutable
class MainItemWidget extends StatelessWidget {
  int index = 0;
  MainItemWidget(index, {this.onTapRowtime}) {
    this.index = index;
  }

  VoidCallback? onTapRowtime;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: GestureDetector(
            onTap: () {
              ChildProfileScreen.index = index;
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyWidgetCP()));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgRectangle1092,
                  height: (52.h),
                  width: (52.w),
                  radius: BorderRadius.circular(
                    (26.r),
                  ),
                  margin: EdgeInsets.only(
                    bottom: 13.w,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 12.w,
                    top: 8.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        MainScreen.userchilds[index].title,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtRubikRomanMedium20,
                      ),
                      Text(
                        MainScreen.userchilds[index].ID,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtRubikRomanLight12,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 2.h,
                        ),
                        child: Text(
                          MainScreen.userchilds[index].condition,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtRubikRomanLight12,
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                CustomImageView(
                  svgPath: MainScreen.userchilds[index].color == "red"
                      ? ImageConstant.imgred
                      : ImageConstant.imggreen,
                  height: (22.h),
                  width: (22.w),
                  margin: EdgeInsets.only(
                    top: 12.h,
                    bottom: 31.h,
                  ),
                ),
              ],
            )));
  }
}
