import 'package:counter_app/utils/dio_connector.dart';
import 'package:dio/dio.dart';

class UpcommingClassServices {
  static Future<Response> fetchUpCommingClass()async{
    final response= await DioConnector.dio.get("online-upcoming-classes");
    return response;
  }
}