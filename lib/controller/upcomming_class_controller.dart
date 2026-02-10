import 'package:counter_app/model/upcomming_class_model.dart';
import 'package:counter_app/services/upcomming_class_services.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class UpcommingClassController extends GetxController {
  var upCommingClass = UpCommingClassModel(total: 0, upcomingClasses: []).obs;
  RxBool isLoading = false.obs;

  Future getUpCommingClass() async {
    try {
      isLoading(true);
      var responses = await UpcommingClassServices.fetchUpCommingClass();
      if (responses.statusCode == 200) {
        upCommingClass.value = UpCommingClassModel.fromJson(responses.data);
        isLoading(false);
      }
    }catch(e){
      debugPrint("Error: $e");
    } 
  }

  @override
  void onInit() {
    super.onInit();
    getUpCommingClass();
  }
}
