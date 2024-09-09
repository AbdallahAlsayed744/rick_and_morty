import 'package:dio/dio.dart';
import 'package:rick_and_morty/costants/Routes.dart';

class Charactres_api{

  late Dio dio;

  Charactres_api(){

    BaseOptions options =BaseOptions(
      baseUrl: baseurl,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
      receiveDataWhenStatusError: true 

    );

    dio =Dio(options);
  }

  Future<List<dynamic>> getCharacters() async {
    try {
      Response response =
          await dio.get('character');
      print(response.data["results"][0].toString());
      return response.data["results"];
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  
}



