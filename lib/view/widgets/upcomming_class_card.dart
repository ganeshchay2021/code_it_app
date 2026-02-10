import 'package:counter_app/model/upcomming_class_model.dart';
import 'package:counter_app/view/widgets/info_row.dart';
import 'package:flutter/material.dart';

class UpCommingClassCard extends StatefulWidget {
  final UpcomingClass myClass;
  const UpCommingClassCard({super.key, required this.myClass});

  @override
  State<UpCommingClassCard> createState() => _UpCommingClassCardState();
}

class _UpCommingClassCardState extends State<UpCommingClassCard> {
  int discountPercent(var costPrice, var price) {
    final cp =
        double.tryParse(costPrice.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0.0;
    final sp = double.tryParse(price.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0.0;
    // if (cp <= 0) return 0;
    double discountAmount = cp - sp;
    int percentage = ((discountAmount / cp) * 100).toInt();
    debugPrint("CP: $cp and SP: $sp");
    return percentage.round();
  }

  int? discountPer;

  @override
  void initState() {
    super.initState();
    discountPer = discountPercent(
      widget.myClass.costPrice,
      widget.myClass.price,
    );
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("Discount $discountPer");
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: SizedBox(
        width: MediaQuery.of(context).size.width*0.93,
        child: Card(
          color: Colors.white,
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          clipBehavior: Clip.antiAlias,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Banner
              Container(
                width: double.infinity,
                color: const Color(0xFFFFF1EB), // Light peach background
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    const Icon(
                      Icons.video_camera_front,
                      color: Colors.green,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "Google Meet | Live + Recorded",
                      style: TextStyle(
                        color: Colors.brown[700],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
      
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${widget.myClass.courseName}",
                                maxLines: 1,
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 16),
      
                              // Date Row
                              InfoRow(
                                icon: Icons.calendar_today_outlined,
                                text: "Starts: ",
                                boldText: widget.myClass.duration,
                              ),
                              const SizedBox(height: 8),
      
                              // Duration Row
                              InfoRow(
                                icon: Icons.access_time,
                                text:
                                    "${widget.myClass.duration} | Sun-Fri ${widget.myClass.times[0].time}",
                              ),
                              const SizedBox(height: 8),
      
                              // Seats Row
                              const InfoRow(
                                icon: Icons.groups,
                                text: "Limited seats left",
                                textColor: Colors.deepOrange,
                                isItalic: true,
                              ),
                            ],
                          ),
                        ),
      
                        SizedBox(width: 10),
      
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadiusGeometry.circular(10),
                            child: Image.network(
                              "${widget.myClass.image}",
                              height: 70,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    ),
      
                    const SizedBox(height: 10),
      
                    // Bottom Pricing Section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Wrap(
                            runSpacing: 2,
                            spacing: 2,
                            children: [
                              Text(
                                "${widget.myClass.price} /-",
                                style: TextStyle(
                                  color: Color(0xFFD32F2F),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                "${widget.myClass.costPrice}",
                                style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFE0F2F1),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  "Save $discountPer%",
                                  style: TextStyle(
                                    color: Colors.teal,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
