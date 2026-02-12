import 'package:counter_app/model/terms_and_conditions_model.dart';
import 'package:counter_app/services/terms_and_condition_services.dart';
import 'package:get/get.dart';

class TermsAndConditionController extends GetxController {
  var termsAndCondition = TermsAndConditionModel(data: null).obs;
  RxBool isLoading = false.obs;

  Future getTermsAndCondition() async {
    try {
      isLoading(true);
      final response = await TermsAndConditionServices.fetchTermsAndCondition();
      if (response.statusCode == 200) {
        final result = TermsAndConditionModel.fromJson(response.data);
        termsAndCondition.value = result;
        isLoading(false);
      }
    } finally {
      isLoading(false);
    }
  }
}
