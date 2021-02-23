import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:namaz_vakitleri_app/main.dart';
import 'package:namaz_vakitleri_app/screens/calendar_page.dart';
import 'package:namaz_vakitleri_app/screens/homepage.dart';
import 'package:namaz_vakitleri_app/screens/qiblah_compass_page.dart';
import 'package:namaz_vakitleri_app/widgets/notification_alert.dart';
import 'package:namaz_vakitleri_app/widgets/prayTimeTextWidget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            DrawerHeader(
              margin: EdgeInsets.all(0),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Theme.of(context).primaryColor,
                Theme.of(context).accentColor
              ])),
              child: Container(
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(
                        height: 80,
                        width: 80,
                        child: SvgPicture.asset(
                          "assets/svg/mosque.svg",
                          color: Colors.white,
                        )),
                    SizedBox(
                      height: 6,
                    ),
                    PrayTimeText(
                      fontSize: 30,
                      text: "Namaz Vakitleri",
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ));
              },
              title: Text("Namaz Vakitleri"),
              leading: CircleAvatar(
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: SvgPicture.asset(
                    "assets/svg/mosque.svg",
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CalendarPage(),
                    ));
              },
              title: Text("Özel Günler"),
              leading: CircleAvatar(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    "assets/svg/bayram.svg",
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QiblahCompassPage(),
                    ));
              },
              title: Text("Kıble Pusulası"),
              leading: CircleAvatar(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    "assets/svg/compass_icon.svg",
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              onTap: () async {
                await showDialog(
                  context: context,
                  builder: (context) {
                    return NotificationAlert();
                  },
                );
              },
              title: Text("Bildirim Ayarları"),
              leading: CircleAvatar(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.notifications,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              onTap: () async {
                await launch("mailto:brokbro052@gmail.com");
              },
              title: Text("Bize Ulaşın"),
              leading: CircleAvatar(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.mail,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "powered by",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "BeatiApp",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
