import 'package:flutter/material.dart';
import 'package:wajeed_s_application4/core/app_export.dart';
import 'package:wajeed_s_application4/presentation/main_screen/main_screen.dart';
import 'package:wajeed_s_application4/presentation/main_screen/main_screen.dart';
import 'package:wajeed_s_application4/widgets/custom_button.dart';
import 'package:wajeed_s_application4/widgets/custom_text_form_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../child_profile_screen/child_profile_screen.dart';
import '../main_screen/main_screen.dart';
import 'package:wajeed_s_application4/core/app_export.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoginScreenaScreen extends StatefulWidget {
  const LoginScreenaScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreenaScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<LoginScreenaScreen> {
  TextEditingController emailController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController password1 = TextEditingController();

  static String email = "";
  static String pass = "";

  static bool value1 = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        backgroundColor: ColorConstant.whiteA700,
        resizeToAvoidBottomInset: false,
        body: Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            color: ColorConstant.whiteA700,
            image: DecorationImage(
              image: AssetImage(
                ImageConstant.loginBackground,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Form(
            key: _formKey,
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.only(
                left: 20.w,
                top: 46.h,
                right: 20.w,
                bottom: 46.h,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 79.h,
                    ),
                    child: Text(
                      "Welcome back",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtRubikMedium24,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 11.h,
                    ),
                    child: Text(
                      "Your care awaits you",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtRubikRegular14,
                    ),
                  ),
                  CustomImageView(
                    imagePath: ImageConstant.imgScreenshot2023170x262,
                    height: (170.h),
                    width: (262.w),
                    margin: EdgeInsets.only(
                      top: 2.h,
                    ),
                  ),
                  CustomTextFormField(
                      focusNode: FocusNode(),
                      controller: emailController,
                      hintText: "wajeed.gradution@gmail.com",
                      margin: EdgeInsets.only(
                        top: 22.h,
                      ),
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.emailAddress,
                      suffix: Container(
                          margin: EdgeInsets.only(
                            left: 30.w,
                            top: 21.h,
                            right: 25.h,
                            bottom: 21.w,
                          ),
                          child: Container(
                              margin: EdgeInsets.only(
                                  left: 5.w, top: 0.h, right: 5.w, bottom: 0.h),
                              child: Icon(
                                Icons.check,
                              ))),
                      suffixConstraints: BoxConstraints(
                        maxHeight: (54.h),
                      ),
                      validator: (value) {
                        email = value.toString();
                        if (value == "") {
                          return "Please enter valid email";
                        }
                        return null;
                      }),
                  Expanded(
                    child: CustomTextFormField(
                      focusNode: FocusNode(),
                      controller: password1,
                      hintText: "Password",
                      margin: EdgeInsets.only(top: 15.h),
                      textInputAction: TextInputAction.done,
                      suffix: InkWell(
                          onTap: () {
                            setState(() {
                              value1 = !value1;
                            });
                          },
                          child: Container(
                              margin: EdgeInsets.only(
                                  left: 20.w,
                                  top: 20.h,
                                  right: 20.w,
                                  bottom: 20.h),
                              child: Icon(
                                value1
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                              ))),
                      suffixConstraints:
                          BoxConstraints(minWidth: 16, minHeight: 14),
                      isObscureText: value1,
                      validator: (value) {
                        pass = value.toString();
                        if (value == "") {
                          return "Please enter valid email";
                        }
                        return null;
                      }
                    ),
                  ),
                  CustomButton(
                    height: (54.h),
                    text: "Login",
                    margin: EdgeInsets.only(
                      left: 20.w,
                      top: 32.h,
                      right: 20.w,
                    ),
                    onTap: checkLogin,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 20.h,
                    ),
                    child: Text(
                      "Forgot password",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtRubikRegular14,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "Don’t have an account? Join us",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: AppStyle.txtRubikRegular14,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  checkLogin()  {
    if (!_formKey.currentState!.validate()) {
      Get.snackbar('Error', "Processing Data");
    }
    else if (email == "w" && pass == "1"){
    //  EasyLoading.show(status: 'loading....');
    // await Future.delayed(Duration(seconds: 1));
    // EasyLoading.dismiss();

     Navigator.push(
           context, MaterialPageRoute(builder: (context) => MainScreen()));
      debugPrint(email + pass);

    }
    else{
      debugPrint(" Your Email or Passwored incorrect");
    }
    
  }
}
