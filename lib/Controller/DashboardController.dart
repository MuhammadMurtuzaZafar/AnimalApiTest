

import 'package:get/get.dart';

class DashboardController extends GetxController{

  var currentPage=0.obs;

  changeScreen(int i)
  {
    currentPage.value=i;
    update();
  }

}