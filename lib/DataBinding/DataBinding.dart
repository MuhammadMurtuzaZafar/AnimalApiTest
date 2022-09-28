import 'package:animalinfoapp/Controller/Controller.dart';
import 'package:get/get.dart';

class DataBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    
    Get.lazyPut(() => DataController());
  }
}