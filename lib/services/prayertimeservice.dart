import 'package:dio/dio.dart';
import 'package:untitled/models/prayertimemodel.dart';

class PrayertimeService {
  static Dio dio = Dio();

  static Future<PrayertimeModel> getdata() async
  {
    try {
      Response response = await dio.get(
          "https://api.aladhan.com/v1/timingsByCity/09-11-2024?city=Giza&country=Egypt"
      );
      if (response.statusCode == 200) {
        return PrayertimeModel.fromjson(response.data);
      }
      else {
        throw Exception("Error");
      }
    }
    catch (ex) {
      throw Exception(ex);
    }
  }
}