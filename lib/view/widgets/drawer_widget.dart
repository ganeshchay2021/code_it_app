import 'package:cached_network_image/cached_network_image.dart';
import 'package:counter_app/controller/pricavy_and_policy_controller.dart';
import 'package:counter_app/controller/terms_and_condition_controller.dart';
import 'package:counter_app/view/privacy_and_policy_view.dart';
import 'package:counter_app/view/terms_and_condition_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final termsAndConditionController = Get.find<TermsAndConditionController>();
    final privacyAndPolicyController = Get.find<PricavyAndPolicyController>();

    return Drawer(
      backgroundColor: Colors.amber[50],
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
            child: CachedNetworkImage(
              height: 150,
              fit: BoxFit.contain,
              imageUrl:
                  "https://codeit.com.np/storage/01KE9MC5P5YCRYWVW7HQ7JVDEK.png",
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(color: Colors.grey.shade200),
                    child: Center(
                      child: CircularProgressIndicator(
                        value: downloadProgress.progress,
                        color: Colors.red.shade300,
                      ),
                    ),
                  ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Divider(color: Colors.grey.shade300),
          ),

          CommonListTile(
            onTap: () {
              if (termsAndConditionController.termsAndCondition.value.data ==
                  null) {
                termsAndConditionController.getTermsAndCondition();
              }
              Get.back();
              Get.to(TermsAndConditionView());
            },
            icon: Icons.file_present_outlined,
            text: "Terms and Conditions",
          ),
          CommonListTile(
            onTap: () {
              Get.back();
              if (privacyAndPolicyController.privacyAndPolicy.value.data ==
                  null) {
                privacyAndPolicyController.getPrivacyAndPolicy();
              }
              Get.to(PrivacyAndPolicyView());
            },
            icon: Icons.privacy_tip,
            text: "Privacy and Policy",
          ),
        ],
      ),
    );
  }
}

class CommonListTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;
  const CommonListTile({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon),
      title: Text(
        text,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
    );
  }
}
