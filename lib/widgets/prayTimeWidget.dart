import 'package:flutter/material.dart';
import 'package:namaz_vakitleri_app/models/prayTimeModel.dart';
import 'package:namaz_vakitleri_app/screens/prayTimeDetailScreen.dart';
import 'package:namaz_vakitleri_app/widgets/prayTimeTextWidget.dart';
import 'package:namaz_vakitleri_app/widgets/timeWidget.dart';

class PrayTimeWidget extends StatelessWidget {
  final PrayTimeModel model;
  final bool buttonState;
  const PrayTimeWidget({Key key, this.model, this.buttonState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Theme.of(context).primaryColor,
          Theme.of(context).accentColor
        ]),
      ),
      child: Column(
        children: [
          PrayTimeText(
            text: model.miladiTarihUzun,
            fontSize: 35,
          ),
          SizedBox(
            height: 3,
          ),
          PrayTimeText(
            text: model.hicriTarihUzun,
            fontSize: 15,
          ),
          SizedBox(
            height: 15,
          ),
          Divider(
            color: Colors.white,
            thickness: 3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TimeWidget(
                time: model.imsak,
                timeText: "İMSAK",
              ),
              TimeWidget(
                time: model.gunes,
                timeText: "GÜNEŞ",
              ),
              TimeWidget(
                time: model.ogle,
                timeText: "ÖĞLE",
              ),
              TimeWidget(
                time: model.ikindi,
                timeText: "İKİNDİ",
              ),
              TimeWidget(
                time: model.aksam,
                timeText: "AKŞAM",
              ),
              TimeWidget(
                time: model.yatsi,
                timeText: "YATSI",
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          buttonState == false
              ? SizedBox(
                  height: 3,
                )
              : RaisedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PrayTimeDetailScreen(
                            model: model,
                            tag: model.miladiTarihUzunIso8601,
                          ),
                        ));
                  },
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  child: Text("DAHA FAZLA BİLGİ"),
                )
        ],
      ),
    );
  }
}
