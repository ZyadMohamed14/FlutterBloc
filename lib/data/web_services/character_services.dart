import 'package:dio/dio.dart';
import 'package:flutterbloc/constans/strings.dart';
import 'package:flutterbloc/data/model/Character.dart';

class CharacterWebServices {
  late Dio dio;

  CharacterWebServices() {
    BaseOptions options = BaseOptions(
        baseUrl: baseurl,
        receiveDataWhenStatusError: true,
        connectTimeout: Duration(seconds: 20),
        receiveTimeout: Duration(seconds: 20));
    dio = Dio(options);
  }

  Future<List<dynamic>> getAllCharacters() async {
    try {
      Response response = await dio.get('character');
  List<dynamic> results = response.data['results'];

   //   print('result is$results.length');

      return results;
    } catch (e) {
      print(e);
      return [];
    }
  }
}


