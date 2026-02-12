import 'package:counter_app/utils/dio_connector.dart';
import 'package:dio/dio.dart';

class TermsAndConditionServices {
  static Future<Response> fetchTermsAndCondition() async {
    final response = await DioConnector.dio.get("term");
    return response;
  }
}
