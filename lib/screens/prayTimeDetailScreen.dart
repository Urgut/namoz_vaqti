import 'package:flutter/material.dart';
import 'package:namaz_vakitleri_app/models/prayTimeModel.dart';
import 'package:namaz_vakitleri_app/widgets/prayTimeTextWidget.dart';
import 'package:namaz_vakitleri_app/widgets/prayTimeWidget.dart';

class PrayTimeDetailScreen extends StatelessWidget {
  final PrayTimeModel model;

  final String tag;

  const PrayTimeDetailScreen({Key key, this.model, this.tag}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            }),
        centerTitle: true,
        title: Text(model.miladiTarihUzun),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).accentColor
          ])),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Hero(
                    tag: tag,
                    child: PrayTimeWidget(
                      buttonState: false,
                      model: model,
                    )),
                Container(
                  child: PrayTimeText(
                    text: "Ayın Şekli",
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Image.network(model.ayinSekliURL),
                SizedBox(
                  height: 15,
                ),
                PrayTimeText(
                  text: "Güneş Doğma Saati",
                  fontSize: 20,
                ),
                PrayTimeText(
                  text: model.gunesDogus,
                  fontSize: 17,
                ),
                SizedBox(
                  height: 15,
                ),
                PrayTimeText(
                  text: "Güneş Batış Saati",
                  fontSize: 20,
                ),
                PrayTimeText(
                  text: model.gunesBatis,
                  fontSize: 17,
                ),
                SizedBox(
                  height: 15,
                ),
                PrayTimeText(
                  text: "Kıble Saati",
                  fontSize: 20,
                ),
                PrayTimeText(
                  text: model.kibleSaati,
                  fontSize: 17,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
