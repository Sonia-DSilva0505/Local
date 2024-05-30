import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class HtmlRenderer extends StatelessWidget {
  final String htmlContent;

  const HtmlRenderer({super.key, required this.htmlContent});

  @override
  Widget build(BuildContext context) {
    return Html(data: htmlContent, style: {
      "body": Style(
          padding: HtmlPaddings.zero,
          margin: Margins.zero, 
          alignment: Alignment.center,
          )
    });
  }
}
