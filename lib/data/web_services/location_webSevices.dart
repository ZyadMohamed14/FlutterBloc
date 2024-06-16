import 'package:dio/dio.dart';
import 'package:flutterbloc/constans/strings.dart';

class LocationWebServices {
  late Dio dio;

  LocationWebServices() {
    BaseOptions baseOptions = BaseOptions(
        baseUrl: baseurl,
        receiveDataWhenStatusError: true,
        connectTimeout: Duration(seconds: 20),
        receiveTimeout: Duration(seconds: 20));
    dio = Dio(baseOptions);
  }
  Future<List<dynamic>>getLocation() async{
    try {
      Response response = await dio.get('location');
      List<dynamic> results = response.data['results'];

      print('result is$results.length');

      return results;
    } catch (e) {
      print(e);
      return [];
    }
  }


}
