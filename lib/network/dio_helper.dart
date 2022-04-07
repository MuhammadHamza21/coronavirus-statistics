import 'package:coronavirus_statistics/shared/constants.dart';
import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;
  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required url,
  }) async {
    return await dio!.get(
      url,
    );
  }
}
