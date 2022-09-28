import 'package:animalinfoapp/Api/Services.dart';
import 'package:get/get.dart';

import '../Model/Models.dart';

class DataController extends GetxController with StateMixin<dynamic>{

  @override
  void onInit() {
    super.onInit();
    Provider().getAnimalData().then((value) {


      change(value, status: RxStatus.success());


    },
        onError: (error){

      change(null,status: RxStatus.error(error.toString()));
    });
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}