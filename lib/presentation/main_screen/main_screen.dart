import 'package:wajeed_s_application4/presentation/child_profile_screen/child_profile_screen.dart';
import 'package:wajeed_s_application4/presentation/main_screen/widgets/ListChild.dart';
import 'package:wajeed_s_application4/presentation/splash_screen/splash_screen.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/custom_floating_button.dart';
import '../../widgets/custom_text_form_field.dart';
import '../main_screen/widgets/main_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:wajeed_s_application4/core/app_export.dart';
import 'package:wajeed_s_application4/widgets/custom_search_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainScreen extends StatelessWidget {
  TextEditingController searchController = TextEditingController();

  GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();

  String name = "";
  String id = "";
  String condition = "";
  String location = "";
  String email = "";
  String address = "";
  String phone = "";

  static List<userchild> userchilds = [
    const userchild(
        title: "Wajeed",
        ID: "99964",
        condition: "bad",
        color: "red",
        Location: "F1/103",
        email: "wajeed.mabroukeh@gmail.com",
        address: "33 street west subidbazar,sylhet",
        phone: "059522",
        Ox: "99",
        Te: "2C",
        Hu: "12%",
        So: "10%"),
    const userchild(
        title: "ahmad",
        ID: "22554",
        condition: "Nurmal",
        color: "green",
        Location: "F1/103",
        email: "wajeed.mabroukeh@gmail.com",
        address: "33 street west subidbazar,sylhet",
        phone: "059522",
        Ox: "99",
        Te: "2C",
        Hu: "12%",
        So: "10%"),
    const userchild(
        title: "mohammad",
        ID: "3365",
        condition: "bad",
        color: "red",
        Location: "F1/103",
        email: "wajeed.mabroukeh@gmail.com",
        address: "33 street west subidbazar,sylhet",
        phone: "059522",
        Ox: "99",
        Te: "2C",
        Hu: "12%",
        So: "10%"),
    const userchild(
        title: "wajeed",
        ID: "1104",
        condition: "Nurmal",
        color: "green",
        Location: "F1/103",
        email: "wajeed.mabroukeh@gmail.com",
        address: "33 street west subidbazar,sylhet",
        phone: "059522",
        Ox: "99",
        Te: "2C",
        Hu: "12%",
        So: "10%"),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.green5007f,
        resizeToAvoidBottomInset: false,
        body: Container(
          height: size.height,
          width: double.maxFinite,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  padding: EdgeInsets.only(
                    left: 150.w,
                    top: 20.h,
                    right: 150.w,
                    bottom: 40.h,
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: fs.Svg(
                        ImageConstant.listBackground,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Children",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: AppStyle.txtRobotoMedium20,
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(
                    Icons.exit_to_app,
                    color: Colors.red,
                    size: 25,
                  ),
                  onPressed: () {
                    Exist(context);
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: (670.h),
                  width: double.maxFinite,
                  margin: EdgeInsets.only(
                    bottom: 3.h,
                  ),
                  decoration: BoxDecoration(
                    color: ColorConstant.whiteA700,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                        (40.r),
                      ),
                      topRight: Radius.circular(
                        (40.r),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 24.w,
                    top: 50.h,
                    right: 23.w,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomSearchView(
                        width: 400.w,
                        focusNode: FocusNode(),
                        controller: searchController,
                        hintText: "Search For Your Care",
                        prefix: Container(
                          margin: EdgeInsets.only(
                            left: 22.w,
                            top: 18.h,
                            right: 10.w,
                            bottom: 18.h,
                          ),
                          child: CustomImageView(
                            svgPath: ImageConstant.imgSearch,
                          ),
                        ),
                        prefixConstraints: BoxConstraints(
                          maxHeight: (50.h),
                        ),
                        suffix: Padding(
                          padding: EdgeInsets.only(
                            right: (15.w),
                          ),
                          child: IconButton(
                            onPressed: () {
                              searchController.clear();
                            },
                            icon: Icon(
                              Icons.clear,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 23.h,
                          right: 1.w,
                        ),
                        child: ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: (10.h),
                            );
                          },
                          itemCount: userchilds.length,
                          itemBuilder: (context, index) {
                            return MainItemWidget(index);
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: CustomFloatingButton(
              height: 40.h,
              width: 40.w,
              child: Center(
                child: IconButton(
                  icon: Icon(
                    Icons.add,
                    color: Colors.black,
                    size: 25,
                  ),
                  onPressed: () {
                    onPress_Add_Comment(context);
                  },
                ),
              ),
              onTap: () {
                onPress_Add_Comment(context);
              },
            )),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Exist(context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SplashScreen()));
  }

  onPress_Add_Comment(BuildContext context) {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(45.0), topRight: Radius.circular(45.0)),
        ),
        builder: (context) => Form(
            key: _formKey1,
            child: Container(
                width: size.width,
                height: 450.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45.0),
                      topRight: Radius.circular(45.0)),
                  color: Colors.white,
                ),
                child: Stack(alignment: Alignment.centerLeft, children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                          height: size.height,
                          width: size.width,
                          margin: EdgeInsets.only(bottom: 20.h),
                          child:
                              Stack(alignment: Alignment.bottomLeft, children: [
                            Align(
                                alignment: Alignment.bottomLeft,
                                child: Container(
                                    margin: EdgeInsets.only(
                                      top: 0,
                                    ),
                                    decoration: AppDecoration.fillWhiteA700
                                        .copyWith(
                                            borderRadius: BorderRadiusStyle
                                                .customBorderTL40),
                                    child: Expanded(
                                      child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            GestureDetector(
                                                child: Container(
                                                    height: 5.h,
                                                    width: 130.w,
                                                    margin: EdgeInsets.only(
                                                        left: 19.w,
                                                        top: 21.h,
                                                        right: 19.w),
                                                    decoration: BoxDecoration(
                                                        color: ColorConstant
                                                            .gray300,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular((2.71
                                                                    .r))))),
                                            Align(
                                                alignment: Alignment.centerLeft,
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 35.w,
                                                      top: 35.h,
                                                      right: 19.w),
                                                  child: Text("Sign up Child ",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      textAlign: TextAlign.left,
                                                      style: AppStyle
                                                          .txtRubikMedium24),
                                                )),
                                            Container(
                                              width: 287.w,
                                              margin: EdgeInsets.only(
                                                left: 1.w,
                                                top: 20.h,
                                                right: 20.w,
                                              ),
                                              child: Text("Name",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtRubikRegular14),
                                            ),
                                            CustomTextFormField(
                                                width: 335.w,
                                                focusNode: FocusNode(),
                                                hintText: "Write Name Child",
                                                margin: EdgeInsets.only(
                                                  left: 20.w,
                                                  top: 10.h,
                                                  right: 20.w,
                                                ),
                                                textInputAction:
                                                    TextInputAction.done,
                                                alignment: Alignment.center,
                                                validator: (value) {
                                                  name = value.toString();
                                                  return null;
                                                }),
                                            Container(
                                              width: 287.w,
                                              margin: EdgeInsets.only(
                                                left: 1.w,
                                                top: 20.h,
                                                right: 20.w,
                                              ),
                                              child: Text("ID",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtRubikRegular14),
                                            ),
                                            CustomTextFormField(
                                                width: 335.w,
                                                focusNode: FocusNode(),
                                                hintText: "Write ID Child",
                                                margin: EdgeInsets.only(
                                                  left: 20.w,
                                                  top: 10.h,
                                                  right: 20.w,
                                                ),
                                                textInputAction:
                                                    TextInputAction.done,
                                                alignment: Alignment.center,
                                                validator: (value) {
                                                  id = value.toString();
                                                  return null;
                                                }),
                                            Container(
                                              width: 287.w,
                                              margin: EdgeInsets.only(
                                                left: 1.w,
                                                top: 20.h,
                                                right: 20.w,
                                              ),
                                              child: Text("condition",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.left,
                                                  style: AppStyle
                                                      .txtRubikRegular14),
                                            ),
                                            CustomTextFormField(
                                                width: 335.w,
                                                focusNode: FocusNode(),
                                                hintText:
                                                    "Write condition Child",
                                                margin: EdgeInsets.only(
                                                  left: 20.w,
                                                  top: 10.h,
                                                  right: 20.w,
                                                ),
                                                textInputAction:
                                                    TextInputAction.done,
                                                alignment: Alignment.center,
                                                validator: (value) {
                                                  condition = value.toString();
                                                  return null;
                                                }),
                                            CustomButton(
                                                width: 295.w,
                                                height: 50.h,
                                                text: "login",
                                                margin: EdgeInsets.only(
                                                  left: 21.w,
                                                  top: 12.h,
                                                  right: 20.w,
                                                  bottom: 5.h,
                                                ),
                                                onTap: () => {
                                                      if (!_formKey1
                                                          .currentState!
                                                          .validate())
                                                        {
                                                          // Get.snackbar('Error', "Processing Data");
                                                          debugPrint("Error")
                                                        }
                                                      else
                                                        {debugPrint("Error")},
                                                    })
                                          ]),
                                    )))
                          ])))
                ]))));
  }
}
