import 'package:get/get_connect/connect.dart';

class Provider extends GetConnect{

  Future<dynamic> getAnimalData() async{



    final response = await get('https://zoo-animal-api.herokuapp.com/animals/rand/10');
    if(response.status.hasError){

      return Future.error(response.statusText!);

    }
    else
    {
      return response.body;

    }
  }

}