import 'package:counter_app/model/popular_course_model.dart';
import 'package:flutter/material.dart';

class PopularCourseCard extends StatelessWidget {
  final PopularCourse course;
  final int offerDay;
  const PopularCourseCard({
    super.key,
    required this.course,
    required this.offerDay,
  });

  @override
  Widget build(BuildContext context) {
    final cp =
        double.tryParse(course.costPrice!.replaceAll(RegExp(r'[^0-9]'), '0')) ??
        0.0;
    final sp =
        double.tryParse(course.price!.replaceAll(RegExp(r'[^0-9]'), '0')) ??
        0.0;
    int discount = cp > 0 ? (((cp - sp) / cp) * 100).toInt() : 0;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(8),
                ),
                child: Image.network(
                  "${course.featured}",
                  height: 130,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                left: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.orange.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: offerDay == 0
                      ? Text(
                          "Offer Ends in yesterday Days",
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        )
                      : Text(
                          "Offer Ends in $offerDay Days",
                          style: TextStyle(color: Colors.white, fontSize: 10),
                        ),
                ),
              ),
            ],
          ),

          // 2. Content Section
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "${course.courseName}",

                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        maxLines: 1,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 18),
                        Text(
                          "(${course.rating})",
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  "${course.courseSlug}",
                  style: const TextStyle(color: Colors.grey, fontSize: 11),
                  maxLines: 1,
                ),
                const SizedBox(height: 8),

                // 3. Price and Discount Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "${course.costPrice}",
                            style: const TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          WidgetSpan(child: SizedBox(width: 5)),
                          TextSpan(
                            text: "${course.price}",
                            style: const TextStyle(
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(4),
                      color: Colors.green.shade50,
                      child: Text(
                        "Save $discount%",
                        style: const TextStyle(
                          color: Colors.green,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
