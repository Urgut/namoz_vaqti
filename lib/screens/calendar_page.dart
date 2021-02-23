import 'package:flutter/material.dart';
import 'package:namaz_vakitleri_app/core/locator.dart';
import 'package:namaz_vakitleri_app/core/services/advert_services.dart';
import 'package:namaz_vakitleri_app/core/services/prayServices.dart';
import 'package:namaz_vakitleri_app/models/special_day_base_model.dart';
import 'package:namaz_vakitleri_app/models/special_day_item.dart';
import 'package:namaz_vakitleri_app/widgets/calendar_widget.dart';
import 'package:namaz_vakitleri_app/widgets/drawer.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  PrayServices services = getIt<PrayServices>();
  AdvertService advertService = AdvertService.instance;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SpecialDayBaseModel>(
        stream: services.getSpecialDays().asStream(),
        builder: (context, AsyncSnapshot<SpecialDayBaseModel> snapshot) {
          var data = snapshot.data;
          List<SpecialDayItem> items = data.items;
          return Scaffold(
            drawer: DrawerWidget(),
            appBar: AppBar(
              centerTitle: true,
              title: Text(data.summary),
            ),
            body: Container(
              child: ListView(
                children: [
                  advertService.showNativeAd(
                      150, MediaQuery.of(context).size.width * 0.7)
                ]..addAll(items.map<Widget>(
                    (specialDayitem) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      SpecialDayItem specialDayItem = specialDayitem;
                      return CalendarWidget(
                        item: specialDayItem,
                      );
                    },
                  )),
              ),
            ),
          );
        });
  }
}
