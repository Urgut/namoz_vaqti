import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:namaz_vakitleri_app/core/services/advert_services.dart';
import 'package:namaz_vakitleri_app/widgets/drawer.dart';
import 'package:namaz_vakitleri_app/widgets/loading_indicator.dart';
import 'package:namaz_vakitleri_app/widgets/qiblah_compass.dart';

class QiblahCompassPage extends StatefulWidget {
  @override
  _QiblahCompassState createState() => _QiblahCompassState();
}

class _QiblahCompassState extends State<QiblahCompassPage> {
  final _deviceSupport = FlutterQiblah.androidDeviceSensorSupport();
  AdvertService advertService = AdvertService.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
          advertService.showNativeAd(100, MediaQuery.of(context).size.width),
      drawer: DrawerWidget(),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Kıble Pusulası"),
      ),
      body: FutureBuilder(
        future: _deviceSupport,
        builder: (_, AsyncSnapshot<bool> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(
              child: LoadingIndicator(),
            );
          if (snapshot.hasError)
            return Center(
              child: Text("Error: ${snapshot.error.toString()}"),
            );

          if (snapshot.data)
            return QiblahCompass();
          else
            return Container();
        },
      ),
    );
  }
}
