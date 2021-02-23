import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:namaz_vakitleri_app/models/special_day_item.dart';
import 'package:url_launcher/url_launcher.dart';

class CalendarWidget extends StatelessWidget {
  final SpecialDayItem item;

  const CalendarWidget({Key key, this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat.yMMMMd();
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: ListTile(
        trailing: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25), color: Colors.white),
            child: CupertinoButton(
              child: Image.asset("assets/png/calendar-logo.png"),
              onPressed: () async {
                await launch(item.htmlLink);
              },
            )),
        title: BorderedText(
            child: Text(
              item.summary,
              style: TextStyle(color: Colors.white),
            ),
            strokeWidth: 2),
        subtitle: Column(
          children: [
            BorderedText(
                child: Text(
                  dateFormat.format(item.start),
                  style: TextStyle(color: Colors.white),
                ),
                strokeWidth: 1.5),
            BorderedText(
                child: Text(
                  dateFormat.format(item.end),
                  style: TextStyle(color: Colors.white),
                ),
                strokeWidth: 1.5)
          ],
        ),
        leading: CircleAvatar(
          backgroundColor: Colors.white,
          child: Text(
            item.start.day.toString(),
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
        ),
      ),
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).accentColor
          ]),
          borderRadius: BorderRadius.circular(15)),
    );
  }
}
