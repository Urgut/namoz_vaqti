import 'package:flutter/material.dart';
import 'package:namaz_vakitleri_app/core/locator.dart';
import 'package:namaz_vakitleri_app/core/services/prayServices.dart';
import 'package:namaz_vakitleri_app/main.dart';
import 'package:namaz_vakitleri_app/models/city_model.dart';
import 'package:namaz_vakitleri_app/screens/selectTown.dart';
import 'package:namaz_vakitleri_app/widgets/selectTile.dart';

class SelectCity extends StatefulWidget {
  @override
  _SelectCityState createState() => _SelectCityState();
}

class _SelectCityState extends State<SelectCity> {
  var model = getIt<PrayServices>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Şehir Seçin"),
      ),
      body: Container(
        child: StreamBuilder<List<CityModel>>(
          stream: model
              .getCitiesByCountry(preferences.getString("country"))
              .asStream(),
          builder: (context, AsyncSnapshot<List<CityModel>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            List<CityModel> countryList = snapshot.data;
            return ListView.builder(
              itemCount: countryList.length,
              itemBuilder: (context, index) {
                var data = countryList[index];

                return SelectTile(
                  title: data.cityName,
                  onTap: () {
                    preferences.setString("city", data.cityId);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SelectTown(),
                        ));
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
