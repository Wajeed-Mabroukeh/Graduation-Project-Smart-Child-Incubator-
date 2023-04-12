import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wajeed_s_application4/routes/app_routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'final_grad_proj',
            theme: ThemeData(
              visualDensity: VisualDensity.standard,
            ),
            initialRoute: AppRoutes.splashScreen,
            routes: AppRoutes.routes,
          );
        });
  }
}
