import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Theme.dart' as s;


class Login extends StatelessWidget {


  @override
  Widget build(BuildContext context) {


    ScreenUtil.init(context, designSize: const Size(360, 690),minTextAdapt: true);

    TextTheme textTheme=Theme.of(context).textTheme;


    return Scaffold(

      body: ListView(
        children: [
          SizedBox(height: 30.h,),

          Image.asset("assets/images/ballons.png",height: 150.h,width: double.infinity,fit: BoxFit.fill,),

          SizedBox(height: 20.h,),

          Padding(
            padding:  EdgeInsets.only(left: 20.w),
            child: Text("Login",style: textTheme.headline1,),
          ),

          SizedBox(height: 15.h,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
            child: TextFormField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  hintText: "xyz@gmail.com",
                  labelText: 'Email',
                  labelStyle: textTheme.headline6,
                  hintStyle: textTheme.headline6,

                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue,),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Theme.of(context).hoverColor, ),
                  ),

                  prefixIcon: Icon(Icons.calendar_month, color: Theme.of(context).hoverColor,)
              ),
              minLines: 1,

            ),
          ),
          SizedBox(height: 15.h,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
            child: TextFormField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              decoration: InputDecoration(
                  hintText: "Password",
                  labelText: '********',
                  labelStyle: textTheme.headline6,
                  hintStyle: textTheme.headline6,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue,),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Theme.of(context).hoverColor, ),
                  ),

                  prefixIcon: Icon(Icons.calendar_month, color: Theme.of(context).hoverColor,)
              ),
              minLines: 1,

            ),
          ),
          Container(
            width: double.infinity,
            height: 90.h,
            padding:  EdgeInsets.all(20.w),
            child: ElevatedButton(
              onPressed: (){

              },
              child: Text("Sigin",style:GoogleFonts.roboto(
                  textStyle: textTheme.headline3,
                  color: Colors.black

              ) ,),
              style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shadowColor: Colors.black,

                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.r))
                  )
              ),

            ),
          )

        ],
      ),

    );
  }


}
