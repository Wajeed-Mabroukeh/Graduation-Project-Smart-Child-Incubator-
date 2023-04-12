import 'package:flutter/material.dart';
import 'package:wajeed_s_application4/core/app_export.dart';

// ignore: must_be_immutable
class AppbarSubtitle extends StatelessWidget {
  AppbarSubtitle({required this.text, this.margin, this.onTap});

  String text;

  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: Container(
          width: getHorizontalSize(
            168,
          ),
          child: Text(
            text,
            maxLines: null,
            textAlign: TextAlign.center,
            style: AppStyle.txtRubikRomanBold18.copyWith(
              color: ColorConstant.red900,
            ),
          ),
        ),
      ),
    );
  }
}
