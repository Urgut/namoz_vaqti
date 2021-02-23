import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:namaz_vakitleri_app/main.dart';

class NotificationAlert extends StatefulWidget {
  @override
  _NotificationAlertState createState() => _NotificationAlertState();
}

class _NotificationAlertState extends State<NotificationAlert> {
  bool notifValue = preferences.getBool("notifications") == null
      ? true
      : preferences.getBool("notifications");
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        child: Row(
          children: [
            Text("Bildirimleri Aç/Kapa : "),
            SizedBox(
              width: 10,
            ),
            CupertinoSwitch(
              value: notifValue,
              onChanged: (value) {
                preferences.setBool("notifications", value);
                setState(() {
                  notifValue = value;
                });
              },
            )
          ],
        ),
      ),
      title: Text(
        "Bildirim Ayarları",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }
}
