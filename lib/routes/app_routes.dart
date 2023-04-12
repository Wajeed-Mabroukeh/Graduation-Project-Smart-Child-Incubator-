import 'package:flutter/material.dart';
import 'package:wajeed_s_application4/presentation/splash_screen/splash_screen.dart';
import 'package:wajeed_s_application4/presentation/login_screena_screen/login_screena_screen.dart';
import 'package:wajeed_s_application4/presentation/main_screen/main_screen.dart';
import 'package:wajeed_s_application4/presentation/child_profile_screen/child_profile_screen.dart';
import 'package:wajeed_s_application4/presentation/child_livea_screen/child_livea_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String loginScreenaScreen = '/login_screena_screen';

  static const String mainScreen = '/main_screen';

  static const String childProfileScreen = '/child_profile_screen';

  static const String childLiveaScreen = '/child_livea_screen';



  static Map<String, WidgetBuilder> routes = {
    splashScreen: (context) => SplashScreen(),
    loginScreenaScreen: (context) => LoginScreenaScreen(),
    mainScreen: (context) => MainScreen(),
    childProfileScreen: (context) => MyWidgetCP(),
    childLiveaScreen: (context) => ChildLiveaScreen(),
  };
}
