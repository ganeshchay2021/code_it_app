import 'package:counter_app/utils/dio_connector.dart';
import 'package:dio/dio.dart';

class PrivacyAndPolicyServices {
  static Future<Response> fetchPrivacyAndPolicy()async{
    final responce= await DioConnector.dio.get("privacy");
    return responce;
  }
}