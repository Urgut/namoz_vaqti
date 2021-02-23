import 'package:flutter/material.dart';
import 'package:namaz_vakitleri_app/widgets/prayTimeTextWidget.dart';

class TimeWidget extends StatelessWidget {
  const TimeWidget({Key key, this.timeText, this.time}) : super(key: key);
  final String timeText;
  final String time;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          PrayTimeText(
            text: timeText.toUpperCase(),
            fontSize: 15,
          ),
          SizedBox(
            height: 5,
          ),
          PrayTimeText(
            fontSize: 13,
            text: time,
          )
        ],
      ),
    );
  }
}
