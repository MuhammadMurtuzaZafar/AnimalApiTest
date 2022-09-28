import 'dart:convert';

import 'package:animalinfoapp/Controller/DashboardController.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Controller/Controller.dart';
import '../Model/Models.dart';
import '../Theme.dart' as s;
import 'package:animalinfoapp/Views/Home.dart';
import 'package:animalinfoapp/Views/Login.dart';
import 'package:animalinfoapp/Views/Setting.dart';
class Dashboard extends StatelessWidget {
  var isdarkMode = false.obs;
  List screen=[Login(),Home(),Setting()];

  @override
  Widget build(BuildContext context) {

    ScreenUtil.init(context, designSize: const Size(360, 690));
    TextTheme textTheme = Theme.of(context).textTheme;

    DashboardController dashboardController=Get.put( DashboardController());
    return Scaffold(

      appBar: AppBar(
        title: Text("Get Api testing",),
        centerTitle: true,

        actions: [
          IconButton(onPressed: (){
            openBottomSheet(textTheme);
          }, icon: Icon(Icons.settings))
        ],
      ),

      bottomNavigationBar: Obx(() => BottomNavigationBar(
        elevation: 5,
        onTap: (i)
        {
          Get.find<DashboardController>().changeScreen(i);
        },
        currentIndex:dashboardController.currentPage.value ,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.login),
            label: "Login",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "Home"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              label: "Setting"
          )

        ],

      )),

      body:Obx(() => screen[dashboardController.currentPage.value])

    );


  }
  void openBottomSheet(TextTheme textTheme) {

    Get.bottomSheet(
      Obx(() => Container(
        decoration: BoxDecoration(
            color: isdarkMode.value?Color(0xd5353b3d):Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))

        ),
        child: Column(
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
        ),
      )),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
      ),
    );
  }

}
