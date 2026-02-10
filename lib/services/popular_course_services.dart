import 'package:counter_app/utils/dio_connector.dart';
import 'package:dio/dio.dart';

class PopularCourseServices {
  static Future<Response> fetchPopularCourses()async{
    final response= await DioConnector.dio.get("popular-courses");
    return response;
  }
}