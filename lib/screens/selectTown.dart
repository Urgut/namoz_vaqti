import 'package:flutter/material.dart';
import 'package:namaz_vakitleri_app/core/locator.dart';
import 'package:namaz_vakitleri_app/core/services/prayServices.dart';
import 'package:namaz_vakitleri_app/main.dart';
import 'package:namaz_vakitleri_app/models/townModel.dart';
import 'package:namaz_vakitleri_app/screens/homepage.dart';
import 'package:namaz_vakitleri_app/widgets/selectTile.dart';

class SelectTown extends StatefulWidget {
  @override
  _SelectTownState createState() => _SelectTownState();
}

class _SelectTownState extends State<SelectTown> {
  var model = getIt<PrayServices>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("İlçe Seçin"),
      ),
      body: Container(
        child: StreamBuilder<List<TownModel>>(
          stream:
              model.getTownsByCity(preferences.getString("city")).asStream(),
          builder: (context, AsyncSnapshot<List<TownModel>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            List<TownModel> countryList = snapshot.data;
            return ListView.builder(
              itemCount: countryList.length,
              itemBuilder: (context, index) {
                var data = countryList[index];

                return SelectTile(
                  title: data.townName,
                  onTap: () {
                    print(data.townId);
                    preferences.setString("town", data.townId);
                    preferences.setBool("selectedInfo", true);
                    model.savePrayTimeJsonBody(data.townId);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(
                            title: "Namaz Vakti Uygulaması",
                          ),
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
