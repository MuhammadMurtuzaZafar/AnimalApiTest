import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../Theme.dart' as s;

class Setting extends StatelessWidget {
  var isdarkMode = false.obs;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 690));
    TextTheme textTheme = Theme.of(context).textTheme;

    return  Column(
      children: [
         SizedBox(height: 20),
         Center(
          child: Text(
            'Setting',
            style: textTheme.headline1,
          ),
        ),

         SizedBox(height: 40),

         Center(
          child: Text(
            'Change Theme',
            style: textTheme.headline3,

          ),
        ),

        Expanded(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => GestureDetector(
                onTap: (){
                  //
                  Get.changeTheme(isdarkMode.value ? s.Theme().lightTheme: s.Theme().dartTheme);
                  isdarkMode.value = !isdarkMode.value;
                  print(isdarkMode.value);
                },
                child: isdarkMode.value == false ?
                Image.asset(
                  "assets/images/moon.png",
                  width: 100.w,
                  height: 100.w,
                )
                    :
                Image.asset(
                  "assets/images/sun.png",
                  width: 100.w,
                  height: 100.w,
                )
            ))
          ],
        ))

      ],
    );
  }
}
