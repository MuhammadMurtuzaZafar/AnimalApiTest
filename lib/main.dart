import 'dart:convert';
import 'dart:ui';

import 'package:animalinfoapp/Controller/Controller.dart';
import 'package:animalinfoapp/DataBinding/DataBinding.dart';
import 'package:animalinfoapp/Model/Models.dart';
import 'package:animalinfoapp/Views/Dashboard.dart';
import 'package:animalinfoapp/Views/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'Theme.dart' as s;

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 690),minTextAdapt: true);

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,

          home: child,
          initialBinding: DataBinding(),

          theme: s.Theme().lightTheme,
          darkTheme: s.Theme().dartTheme,

        );
      },
      child: Dashboard(),

    );
    // return GetMaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: Test(),
    //  initialBinding: DataBinding(),
    //   theme: s.Theme().lightTheme,
    //   darkTheme: s.Theme().dartTheme,
    //   // themeMode: ThemeMode.dark,
    //   // scrollBehavior: AppScrollBehavior(),
    // );
  }
}
// class AppScrollBehavior extends MaterialScrollBehavior {
//   @override
//   Set<PointerDeviceKind> get dragDevices => {
//     PointerDeviceKind.touch,
//     PointerDeviceKind.mouse,
//   };
// }
class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}




