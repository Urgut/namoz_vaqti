import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';

class PrayTimeText extends StatelessWidget {
  final String text;
  final double fontSize;
  const PrayTimeText({Key key, this.text, this.fontSize}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: BorderedText(
        strokeWidth: 2,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontStyle: FontStyle.normal,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}
