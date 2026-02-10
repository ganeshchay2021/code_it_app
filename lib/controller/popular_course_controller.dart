import 'package:counter_app/model/popular_course_model.dart';
import 'package:counter_app/services/popular_course_services.dart';
import 'package:get/get.dart';

class PopularCourseController extends GetxController {
  var popularCourses = PopularCourseModel(data: []).obs;
  RxBool isLoading = false.obs;

  Future getPopularCourses() async {
    try {
      isLoading(true);
      var response = await PopularCourseServices.fetchPopularCourses();

      if (response.statusCode == 200) {
        popularCourses.value = PopularCourseModel.fromJson(response.data);
        isLoading(false);
      }
    } catch (e) {
      Exception(e);
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getPopularCourses();
  }
}
