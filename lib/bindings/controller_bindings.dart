import 'package:counter_app/controller/popular_course_controller.dart';
import 'package:counter_app/controller/upcomming_class_controller.dart';
import 'package:get/get.dart';

class ControllerBindings extends Bindings{
  @override
  void dependencies() {
    Get.put<UpcommingClassController>(UpcommingClassController(), permanent: true);
    Get.put<PopularCourseController>(PopularCourseController(), permanent: true);

  }
}