import 'package:counter_app/model/privacy_and_policy_model.dart';
import 'package:counter_app/services/privacy_and_policy_services.dart';
import 'package:get/get.dart';

class PricavyAndPolicyController extends GetxController{
  var privacyAndPolicy= PrivacyAndPolicyModel(data: null).obs;
  RxBool isLoading=false.obs;

  Future getPrivacyAndPolicy()async{
    try{
      isLoading(true);
      final result= await PrivacyAndPolicyServices.fetchPrivacyAndPolicy();

      if(result.statusCode==200){
        final responce= PrivacyAndPolicyModel.fromJson(result.data);
        privacyAndPolicy.value=responce;
        isLoading(false);
      }

    }finally{
      isLoading(false);
    }

  }
}