import 'dart:convert';

class CityModel {
  final String cityName;
  final String cityNameEn;
  final String cityId;

  CityModel({this.cityName, this.cityNameEn, this.cityId});

  factory CityModel.fromJson(Map<String, dynamic> data) {
    return CityModel(
      cityName: data['SehirAdi'],
      cityId: data['SehirID'],
      cityNameEn: data['SehirAdiEN'],
    );
  }
}
