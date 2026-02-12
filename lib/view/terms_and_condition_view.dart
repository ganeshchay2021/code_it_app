import 'package:counter_app/controller/terms_and_condition_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

class TermsAndConditionView extends GetView<TermsAndConditionController> {
  const TermsAndConditionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Terms and Condition")),
      body: Obx(() {
        if (controller.isLoading.isTrue) {
          return Center(child: CircularProgressIndicator.adaptive());
        } else {
          return ListView(
            children: [
              Html(
                data:
                    """
       ${controller.termsAndCondition.value.data!.description}
        """,
                extensions: [
                  TagExtension(
                    tagsToExtend: {"flutter"},
                    child: const FlutterLogo(),
                  ),
                ],
                style: {
                  "p.fancy": Style(
                    fontSize: FontSize(30),
                    textAlign: TextAlign.center,
                    backgroundColor: Colors.grey,
                    margin: Margins(
                      left: Margin(50, Unit.px),
                      right: Margin.auto(),
                    ),
                    width: Width(300, Unit.px),
                    fontWeight: FontWeight.bold,
                  ),
                },
              ),
            ],
          );
        }
      }),
    );
  }
}
