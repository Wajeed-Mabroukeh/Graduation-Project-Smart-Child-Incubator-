import 'package:flutter/material.dart';
import 'package:wajeed_s_application4/core/app_export.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../login_screena_screen/login_screena_screen.dart';

 import 'package:wajeed_s_application4/core/app_export.dart';

class SplashScreen extends StatelessWidget {

    

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        backgroundColor: ColorConstant.whiteA700,
        body: Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            color: ColorConstant.whiteA700,
            image: DecorationImage(
              image: AssetImage(
                ImageConstant.imgSplashscreen,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: (745.h),
                  width: double.maxFinite,
                  child: Stack(
                    alignment: Alignment.topLeft,
                    
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 35.w,
                            top: 230.h,
                          ),
                          child: InkWell(
                              onTap: () {
                                onTap(context);
                              },
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.start,
                            
                            children: [
                             
                              CustomImageView(
                                
                                imagePath: ImageConstant.imgScreenshot2023,
                                height: (200.h),
                                width: (270.w),
                             // onTap: onTap,
                              ),
                              Container(
                                width: (161.w),
                                margin: EdgeInsets.only(
                                  top: 20.h,
                                  right: 40.w,
                                ),
                                child: Text(
                                  "Smart Child Incubator ",
                                  maxLines: null,
                                  textAlign: TextAlign.center,
                                  style: AppStyle.txtMetamorphous25,
                                ),
                              ),
                            ],
                          ),
                        )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  onTap(context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginScreenaScreen()));
  }
 
}
