// ignore: unused_import
import 'package:cached_network_image/cached_network_image.dart';
import 'package:counter_app/controller/popular_course_controller.dart';
import 'package:counter_app/controller/upcomming_class_controller.dart';
import 'package:counter_app/view/all_popular_course_view.dart';
import 'package:counter_app/view/widgets/drawer_widget.dart';
import 'package:counter_app/view/widgets/popular_course_card.dart';
import 'package:counter_app/view/widgets/upcomming_class_card.dart';
import 'package:counter_app/widget/common_text_tile.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<UpcommingClassController>();
    final popularCourseController = Get.find<PopularCourseController>();

    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(title: Text("Home"), backgroundColor: Colors.amber),
      body: Obx(() {
        if (controller.isLoading.value == true) {
          return Center(child: CircularProgressIndicator());
        }

        //Access the data INSIDE
        final classes = controller.upCommingClass.value.upcomingClasses;

        if (classes.isEmpty) {
          return Center(child: Text("Data Not Find"));
        } else {
          return SingleChildScrollView(
            child: Column(
              children: [
                CommonTextTile(
                  firstTitle: "Upcoming Classes in ",
                  secondtTitle: "Google Meet  ",
                  subTitle:
                      "No worries if you miss a live class—recorded videos will be provided for every session",
                  iconImage: "assets/google_meet.png",
                ),

                Gap(10),

                SizedBox(
                  height: 250,
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    itemCount: classes.length,
                    itemBuilder: (context, index) {
                      return UpCommingClassCard(myClass: classes[index]);
                    },
                  ),
                ),
                Gap(10),

                popularCourseController.isLoading.isTrue
                    ? Center(child: CircularProgressIndicator())
                    : Column(
                        children: [
                          CommonTextTile(
                            firstTitle: "Explore All ",
                            secondtTitle: "Courses",
                            subTitle:
                                "Project-based learning • Lifetime access • Job-ready skills • New batches every month",
                          ),
                          Gap(10),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              overlayColor: Colors.red.withOpacity(0.2),
                              elevation: 0,
                              minimumSize: Size(100, 40),
                              maximumSize: Size(200, 50),
                              backgroundColor: Colors.white,
                              side: BorderSide(color: Colors.red),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusGeometry.circular(10),
                              ),
                            ),
                            onPressed: () {
                              Get.to(AllPopularCourseView());
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "View All Courses",
                                  style: TextStyle(color: Colors.red),
                                ),
                                Gap(5),
                                Icon(
                                  Icons.arrow_forward_rounded,
                                  color: Colors.red,
                                ),
                              ],
                            ),
                          ),
                          Gap(10),

                          GridView.builder(
                            padding: const EdgeInsets.all(12),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 15,
                                  mainAxisSpacing: 15,
                                  childAspectRatio: 0.75,
                                ),
                            itemCount: 6,
                            itemBuilder: (context, index) {
                              return PopularCourseCard(
                                course: popularCourseController
                                    .popularCourses
                                    .value
                                    .data[index],
                                offerDay: index * 3,
                              );
                            },
                          ),
                        ],
                      ),
              ],
            ),
          );
        }
      }),
    );
  }
}
