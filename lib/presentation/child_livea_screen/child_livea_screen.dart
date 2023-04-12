import 'package:flutter/material.dart';
import 'package:wajeed_s_application4/core/app_export.dart';
import 'package:wajeed_s_application4/widgets/app_bar/appbar_iconbutton.dart';
import 'package:wajeed_s_application4/widgets/app_bar/appbar_subtitle.dart';
import 'package:wajeed_s_application4/widgets/app_bar/custom_app_bar.dart';

class ChildLiveaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            appBar: CustomAppBar(
                height: size.height,
                leadingWidth: 48,
                leading: AppbarIconbutton(
                    svgPath: ImageConstant.imgArrowleft,
                    margin: getMargin(left: 18, top: 31, bottom: 751),
                    onTap: () => onTapArrowleft(context)),
                title: AppbarSubtitle(
                    text: "Cameera Live\n\nWajeed Mabroukeh",
                    margin: getMargin(left: 132, top: 38, bottom: 720))),
            body: CustomImageView(
                imagePath: ImageConstant.imgRectangle509,
                height: getVerticalSize(825),
                width: getHorizontalSize(375))));
  }

  onTapArrowleft(BuildContext context) {
    Navigator.pop(context);
  }
}
