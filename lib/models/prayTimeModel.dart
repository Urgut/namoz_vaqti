import 'package:intl/intl.dart';

class PrayTimeModel {
  String aksam;
  String ayinSekliURL;
  String gunes;
  String gunesBatis;
  String gunesDogus;
  String hicriTarihKisa;
  Null hicriTarihKisaIso8601;
  String hicriTarihUzun;
  Null hicriTarihUzunIso8601;
  String ikindi;
  String imsak;
  DateTime imsakDate;
  DateTime ogleDate;
  DateTime aksamDate;
  DateTime ikindiDate;
  DateTime yatsiDate;
  String kibleSaati;
  String miladiTarihKisa;
  String miladiTarihKisaIso8601;
  String miladiTarihUzun;
  String miladiTarihUzunIso8601;
  DateTime miladiTarihUzunIso8601DateTime;
  String ogle;
  String yatsi;

  PrayTimeModel(
      {this.aksam,
      this.ayinSekliURL,
      this.gunes,
      this.gunesBatis,
      this.aksamDate,
      this.ikindiDate,
      this.imsakDate,
      this.ogleDate,
      this.miladiTarihUzunIso8601DateTime,
      this.yatsiDate,
      this.gunesDogus,
      this.hicriTarihKisa,
      this.hicriTarihKisaIso8601,
      this.hicriTarihUzun,
      this.hicriTarihUzunIso8601,
      this.ikindi,
      this.imsak,
      this.kibleSaati,
      this.miladiTarihKisa,
      this.miladiTarihKisaIso8601,
      this.miladiTarihUzun,
      this.miladiTarihUzunIso8601,
      this.ogle,
      this.yatsi});

  PrayTimeModel.fromJson(Map<String, dynamic> json) {
    DateFormat dateFormat = DateFormat("HH:mm");
    print(dateFormat.parse(json['Aksam']).hour.toString() +
        ":" +
        dateFormat.parse(json['Aksam']).minute.toString());
    aksam = json['Aksam'];
    aksamDate = dateFormat.parse(json['Aksam']);
    ikindiDate = dateFormat.parse(json['Ikindi']);
    ogleDate = dateFormat.parse(json['Ogle']);
    imsakDate = dateFormat.parse(json['Imsak']);
    yatsiDate = dateFormat.parse(json['Yatsi']);
    ayinSekliURL = json['AyinSekliURL'];
    gunes = json['Gunes'];
    gunesBatis = json['GunesBatis'];
    gunesDogus = json['GunesDogus'];
    hicriTarihKisa = json['HicriTarihKisa'];
    hicriTarihKisaIso8601 = json['HicriTarihKisaIso8601'];
    hicriTarihUzun = json['HicriTarihUzun'];
    hicriTarihUzunIso8601 = json['HicriTarihUzunIso8601'];
    ikindi = json['Ikindi'];
    imsak = json['Imsak'];
    kibleSaati = json['KibleSaati'];
    miladiTarihKisa = json['MiladiTarihKisa'];
    miladiTarihKisaIso8601 = json['MiladiTarihKisaIso8601'];
    miladiTarihUzun = json['MiladiTarihUzun'];
    miladiTarihUzunIso8601 = json['MiladiTarihUzunIso8601'];
    miladiTarihUzunIso8601DateTime =
        DateTime.parse(json['MiladiTarihUzunIso8601']);
    ogle = json['Ogle'];
    yatsi = json['Yatsi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Aksam'] = this.aksam;
    data['AyinSekliURL'] = this.ayinSekliURL;
    data['Gunes'] = this.gunes;
    data['GunesBatis'] = this.gunesBatis;
    data['GunesDogus'] = this.gunesDogus;
    data['HicriTarihKisa'] = this.hicriTarihKisa;
    data['HicriTarihKisaIso8601'] = this.hicriTarihKisaIso8601;
    data['HicriTarihUzun'] = this.hicriTarihUzun;
    data['HicriTarihUzunIso8601'] = this.hicriTarihUzunIso8601;
    data['Ikindi'] = this.ikindi;
    data['Imsak'] = this.imsak;
    data['KibleSaati'] = this.kibleSaati;
    data['MiladiTarihKisa'] = this.miladiTarihKisa;
    data['MiladiTarihKisaIso8601'] = this.miladiTarihKisaIso8601;
    data['MiladiTarihUzun'] = this.miladiTarihUzun;
    data['MiladiTarihUzunIso8601'] = this.miladiTarihUzunIso8601;
    data['Ogle'] = this.ogle;
    data['Yatsi'] = this.yatsi;
    return data;
  }
}
