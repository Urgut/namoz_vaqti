import 'package:flutter/material.dart';
import 'package:namaz_vakitleri_app/core/locator.dart';
import 'package:namaz_vakitleri_app/core/services/advert_services.dart';
import 'package:namaz_vakitleri_app/models/prayTimeModel.dart';
import 'package:namaz_vakitleri_app/widgets/drawer.dart';
import 'package:namaz_vakitleri_app/core/services/prayServices.dart';
import 'package:namaz_vakitleri_app/widgets/prayTimeWidget.dart';
import 'package:namaz_vakitleri_app/main.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var service = getIt<PrayServices>();
  AdvertService advertService = AdvertService.instance;
  @override
  void initState() {
    advertService.showIntersitial();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () async {
              advertService.showIntersitial();
              await service.savePrayTimeJsonBody(preferences.getString("town"));
              setState(() {});
            },
          )
        ],
        title: Text(
          "Namaz Vakitleri",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(12),
        child: FutureBuilder(
            future: service.getPrayTimesByTown(context),
            builder: (context, AsyncSnapshot<List<PrayTimeModel>> snapshot) {
              print(preferences.getString("prayTimes"));
              List<PrayTimeModel> prayTimeList = snapshot.data;
              return ListView(
                children: [
                  advertService.showNativeAd(
                      150, MediaQuery.of(context).size.width * 0.8)
                ]..addAll(prayTimeList.map<Widget>((data) => Column(
                      children: [
                        Hero(
                          tag: data.miladiTarihUzunIso8601,
                          child: PrayTimeWidget(
                            model: data,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        )
                      ],
                    ))),
              );
            }),
      ),
    );
  }
}
