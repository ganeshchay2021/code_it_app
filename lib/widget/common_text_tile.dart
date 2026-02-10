import 'package:flutter/material.dart';

class CommonTextTile extends StatelessWidget {
  final String? iconImage;
  final String firstTitle;
  final String secondtTitle;
  final String subTitle;

  const CommonTextTile({
    super.key,
    this.iconImage,
    required this.firstTitle,
    required this.secondtTitle,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      titleAlignment: ListTileTitleAlignment.center,
      title: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.w500,
            height: 0,
          ),
          children: [
            TextSpan(text: firstTitle),
            TextSpan(
              text: secondtTitle,
              style: TextStyle(color: Colors.red),
            ),
            iconImage == null
                ? WidgetSpan(child: SizedBox())
                : WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: Image.asset(
                      height: 18,
                      fit: BoxFit.fitHeight,
                      "$iconImage",
                    ),
                  ),
          ],
        ),
      ),
      subtitle: Padding(
        padding: EdgeInsets.only(top: 5),
        child: Text(
          textAlign: TextAlign.center,
          subTitle,
          style: TextStyle(
            fontSize: 15,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
