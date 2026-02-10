import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {
  // final dynamic course; // Replace with your model
  const CourseCard({super.key});

  @override
  Widget build(BuildContext context) {
    // // Parsing logic for the discount badge
    // final cp = double.tryParse(course.costPrice.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0.0;
    // final sp = double.tryParse(course.price.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0.0;
    // int discount = cp > 0 ? (((cp - sp) / cp) * 100).toInt() : 0;

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
                borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                child: Image.asset("assets/google_meet.png", height: 100, width: double.infinity, fit: BoxFit.cover),
              ),
              Positioned(
                top: 8, left: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(color: Colors.orange.withOpacity(0.9), borderRadius: BorderRadius.circular(4)),
                  child: const Text("Offer Ends in 12 Days", style: TextStyle(color: Colors.white, fontSize: 10)),
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
                Text("course.title", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14), maxLines: 1),
                const SizedBox(height: 4),
                Text("course.subtitle", style: const TextStyle(color: Colors.grey, fontSize: 11), maxLines: 2),
                const SizedBox(height: 8),
                
                // 3. Price and Discount Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(text: "Rs.25000 ", style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 14)),
                          TextSpan(text: "Rs. 1500", style: const TextStyle(color: Colors.grey, decoration: TextDecoration.lineThrough, fontSize: 10)),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(4),
                      color: Colors.green.shade50,
                      child: Text("Save 87%", style: const TextStyle(color: Colors.green, fontSize: 10, fontWeight: FontWeight.bold)),
                    )
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