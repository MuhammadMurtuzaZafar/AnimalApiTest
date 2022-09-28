import 'dart:convert';

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

class Home extends GetView<DataController>{
  var isdarkMode = false.obs;

  @override
  Widget build(BuildContext context) {

    ScreenUtil.init(context, designSize: const Size(360, 690));
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
        body: controller.obx(
                (data) {

              List<Model> anmalList = modelFromJson(jsonEncode(data));
              return    ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: anmalList.length,
                  itemBuilder: (context, index) {
                    return animalCard(anmalList,index,textTheme);
                  }

              );

                }



        )

    );


  }

  Widget animalCard(List<Model> anmalList, int index,textTheme) {

    return Container(
      width: double.infinity,
      height: 290.h,
      margin: EdgeInsets.symmetric(vertical: 20.w,horizontal: 10.w),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


            ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
              child: CachedNetworkImage(imageUrl: "${anmalList[index].imageLink}",
                width: double.infinity,height:110.h,fit: BoxFit.fill,
                placeholder: (context, url) => CupertinoActivityIndicator(),
              ),
            ),

            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${anmalList[index].name}",style: textTheme.headline2,),
                      Text("${anmalList[index].animalType}",style: textTheme.headline2,),
                    ],
                  ),
                  SizedBox(height: 10.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Max Weight ${anmalList[index].weightMax} kg",style: GoogleFonts.roboto(
                          textStyle: textTheme.headline3,
                          color: Colors.grey,
                          fontSize: 16.sp
                      ),),
                      Text("Min Weight ${anmalList[index].weightMin} kg",style: GoogleFonts.roboto(
                          textStyle: textTheme.headline3,
                          color: Colors.grey,
                          fontSize: 16.sp
                      ),),
                    ],
                  ),
                  SizedBox(height: 10.h,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text("LifeSpan ${anmalList[index].lifespan} year",style: textTheme.headline4,textAlign: TextAlign.left),


                    ],
                  ),
                  Text("Diet ${anmalList[index].diet}",style:GoogleFonts.roboto(
                      textStyle: textTheme.headline6,
                      color: Colors.grey,
                      fontSize: 12.sp
                  ),textAlign: TextAlign.left),
                  SizedBox(height: 10.h,),

                  Text("Geo Range: ${anmalList[index].geoRange} ",style: textTheme.headline6,textAlign: TextAlign.left),


                ],
              ),
            )

          ],
        ),
      ),
    );
  }


}
