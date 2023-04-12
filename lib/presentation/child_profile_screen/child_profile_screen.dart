import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:wajeed_s_application4/core/app_export.dart';
import 'package:wajeed_s_application4/widgets/app_bar/appbar_title.dart';
import 'package:wajeed_s_application4/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/custom_button.dart';
import '../main_screen/main_screen.dart';


class MyWidgetCP extends StatefulWidget {
  const MyWidgetCP({Key? key}) : super(key: key);

  @override
  State<MyWidgetCP> createState() => ChildProfileScreen();
}

class ChildProfileScreen extends State<MyWidgetCP> {

 static  int index = 0;
 

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //backgroundColor: ColorConstant.gray50066,
        body: Container(
          height: size.height,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: ColorConstant.whiteA700,
            image: DecorationImage(
              image: AssetImage(
                ImageConstant.profBackground,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  padding: EdgeInsets.only(
                    top: 15.h,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomAppBar(
                        height: (115.h),
                        title: Padding(
                          padding: EdgeInsets.only(
                            left: 12.w,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.imgRectangle109282x82,
                                height: (82),
                                width: (82),
                                radius: BorderRadius.circular(
                                  (41),
                                ),
                                alignment: Alignment.topLeft,
                                margin: EdgeInsets.only(
                                  left: 32.w,
                                  right: 49.h,
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top: 11.h,
                                  ),
                                  child: Text(
                                   MainScreen.userchilds[index].title,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style:
                                        AppStyle.txtRubikRomanMedium18WhiteA700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        actions: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: 25.w,
                              top: 3.h,
                              right: 25.w,
                              bottom: 1.h,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    right: 4.w,
                                  ),
                                  child: Row(
                                    children: [
                                      CustomImageView(
                                        svgPath: ImageConstant
                                            .imgIconsaxboldhospital,
                                        height: (24),
                                        width: (24),
                                        margin: EdgeInsets.only(
                                          bottom: 4.h,
                                        ),
                                      ),
                                      AppbarTitle(
                                        text: "F1/102",
                                        margin: EdgeInsets.only(
                                          left: 9.w,
                                          top: 5.h,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                AppbarTitle(
                                  text:  MainScreen.userchilds[index].condition,
                                  margin: EdgeInsets.only(
                                    left: 9.w,
                                    top: 15.h,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.only(
                    left: 28.w,
                    top: 11.h,
                    right: 28.w,
                    bottom: 11.h,
                  ),
                  decoration: AppDecoration.fillWhiteA700.copyWith(
                    borderRadius: BorderRadiusStyle.customBorderTL40,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: (8),
                          width: (30),
                          decoration: BoxDecoration(
                            color: ColorConstant.gray300,
                            borderRadius: BorderRadius.circular(
                              (4),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 18.h,
                        ),
                        child: Text(
                          "Display Name",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtRubikRomanBold16,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 4.w,
                          top: 6.h,
                        ),
                        child: Text(
                         MainScreen.userchilds[index].title,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtRubikRomanMedium18,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 8.h,
                        ),
                        child: Text(
                          "ID",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtRubikRomanBold16,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 4.w,
                          top: 2.h,
                        ),
                        child: Text(
                             MainScreen.userchilds[index].ID,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtRubikRomanMedium18,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 13.h,
                        ),
                        child: Text(
                          "Email ",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtRubikRomanBold14,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 4.w,
                          top: 8.h,
                        ),
                        child: Text(
                          MainScreen.userchilds[index].email,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtRubikRomanMedium18,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 24.h,
                        ),
                        child: Text(
                          "Address",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtRubikRomanBold14,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 4.w,
                          top: 7.h,
                        ),
                        child: Text(
                         MainScreen.userchilds[index].address,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtRubikRomanMedium18,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 28.h,
                        ),
                        child: Text(
                          "Phone  Number",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtRubikRomanBold14,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 4.w,
                          top: 6.h,
                        ),
                        child: Text(
                          MainScreen.userchilds[index].phone,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: AppStyle.txtRubikRomanMedium18,
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 1.w, top: 24.h, right: 9.w, bottom: 150.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Oxygen",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: AppStyle.txtRubikRomanBold14,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 4.w,
                                      top: 4.h,
                                    ),
                                    child: Text(
                                      MainScreen.userchilds[index].Ox,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtRubikRomanMedium18,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 30.w,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Temperature",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtRubikRomanBold14,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 4.w,
                                        top: 4.h,
                                      ),
                                      child: Text(
                                        MainScreen.userchilds[index].Te,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtRubikRomanMedium18,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 27.w,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Humidity",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtRubikRomanBold14,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 4.w,
                                        top: 5.h,
                                      ),
                                      child: Text(
                                        MainScreen.userchilds[index].Hu,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtRubikRomanMedium18,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 30.w,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Smoking",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: AppStyle.txtRubikRomanBold14,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 1.w,
                                        top: 5.h,
                                      ),
                                      child: Text(
                                        MainScreen.userchilds[index].So,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: AppStyle.txtRubikRomanMedium18,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              CustomImageView(
                svgPath: ImageConstant.imgIcons,
                height: (44),
                width: (275),
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(top: 145.h),
              ),
              CustomButton(
                alignment: Alignment.bottomCenter,
                height: (54.h),
                width: 200.w,
                text: "Controlling",
                margin: EdgeInsets.only(bottom: 80.h),
                onTap: () {
                  //checkLogin();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void previous_page() {
    Get.toNamed(Get.previousRoute);
  }
}
