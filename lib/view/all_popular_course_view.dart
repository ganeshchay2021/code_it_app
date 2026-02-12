import 'package:counter_app/controller/popular_course_controller.dart';
import 'package:counter_app/view/widgets/popular_course_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllPopularCourseView extends GetView<PopularCourseController> {
  const AllPopularCourseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.amber, centerTitle: true, title: Text("All Popular Courses"),),
      body:Obx((){
        if(controller.isLoading.isTrue){
          return Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }else{
          return  GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          childAspectRatio: 0.75,
        ),
        itemCount: controller.popularCourses.value.data.length,
        itemBuilder: (context, index) {
          return PopularCourseCard(
            course: controller.popularCourses.value.data[index],
            offerDay: index * 3,
          );
        },
      );
        }
      })
    );
  }
}
