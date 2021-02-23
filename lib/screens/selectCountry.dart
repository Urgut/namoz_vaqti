import 'package:flutter/material.dart';
import 'package:namaz_vakitleri_app/core/locator.dart';
import 'package:namaz_vakitleri_app/core/services/prayServices.dart';
import 'package:namaz_vakitleri_app/main.dart';
import 'package:namaz_vakitleri_app/models/country_model.dart';
import 'package:namaz_vakitleri_app/screens/selectCity.dart';
import 'package:namaz_vakitleri_app/widgets/selectTile.dart';

class SelectCountry extends StatefulWidget {
  @override
  _SelectCountryState createState() => _SelectCountryState();
}

class _SelectCountryState extends State<SelectCountry> {
  var model = getIt<PrayServices>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Ülke Seçin"),
      ),
      body: Container(
        child: StreamBuilder<List<CountryModel>>(
          stream: model.getCountries().asStream(),
          builder: (context, AsyncSnapshot<List<CountryModel>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            List<CountryModel> countryList = snapshot.data;
            return ListView.builder(
              itemCount: countryList.length,
              itemBuilder: (context, index) {
                var data = countryList[index];

                return SelectTile(
                  title: data.countryName,
                  onTap: () {
                    preferences.setString("country", data.countryId);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SelectCity(),
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
