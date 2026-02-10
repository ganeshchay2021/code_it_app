import 'package:counter_app/controller/upcomming_class_controller.dart';
import 'package:counter_app/view/home/widgets/course_card.dart';
import 'package:counter_app/view/home/widgets/upcomming_class_card.dart';
import 'package:counter_app/widget/common_text_tile.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<UpcommingClassController>();
    return Scaffold(
      drawer: Drawer(),
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
                CommonTextTile(
                  firstTitle: "Explore All ",
                  secondtTitle: "Courses",
                  subTitle:
                      "Project-based learning • Lifetime access • Job-ready skills • New batches every month",
                ),
            
        
                GridView.builder(
                  padding: const EdgeInsets.all(12),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  // 2 columns as seen in your image
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio:
                        0.85, // Adjust this to fit your text perfectly
                  ),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return CourseCard();
                  },
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}
