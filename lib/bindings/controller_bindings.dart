import 'package:counter_app/controller/popular_course_controller.dart';
import 'package:counter_app/controller/pricavy_and_policy_controller.dart';
import 'package:counter_app/controller/terms_and_condition_controller.dart';
import 'package:counter_app/controller/upcomming_class_controller.dart';
import 'package:get/get.dart';

class ControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<UpcommingClassController>(
      UpcommingClassController(),
      permanent: true,
    );
    Get.put<PopularCourseController>(
      PopularCourseController(),
      permanent: true,
    );
    Get.put<TermsAndConditionController>(
      TermsAndConditionController(),
      permanent: false,
    );
    Get.put<PricavyAndPolicyController>(
      PricavyAndPolicyController(),
      permanent: false,
    );
  }
}
