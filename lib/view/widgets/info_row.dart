
import 'package:flutter/material.dart';

class InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final String? boldText;
  final Color? textColor;
  final bool isItalic;

  const InfoRow({
    super.key,
    required this.icon,
    required this.text,
    this.boldText,
    this.textColor,
    this.isItalic = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18, color: textColor ?? Colors.grey[700]),
        const SizedBox(width: 10),
        RichText(
          text: TextSpan(
            style: TextStyle(
              color: textColor ?? Colors.black87,
              fontSize: 14,
              fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
            ),
            children: [
              TextSpan(text: text),
              if (boldText != null)
                TextSpan(
                  text: boldText,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
