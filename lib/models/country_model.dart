import 'dart:convert';

class CountryModel {
  final String countryName;
  final String countryNameEn;
  final String countryId;

  CountryModel({this.countryName, this.countryNameEn, this.countryId});

  factory CountryModel.fromJson(Map data) {
    return CountryModel(
      countryName: data['UlkeAdi'],
      countryId: data['UlkeID'],
      countryNameEn: data['UlkeAdiEn'],
    );
  }
}
