import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:namaz_vakitleri_app/core/services/local_notifications.dart';
import 'package:namaz_vakitleri_app/main.dart';
import 'package:namaz_vakitleri_app/models/city_model.dart';
import 'package:namaz_vakitleri_app/models/country_model.dart';
import 'package:http/http.dart' as http;
import 'package:namaz_vakitleri_app/models/prayTimeModel.dart';
import 'package:namaz_vakitleri_app/models/special_day_base_model.dart';
import 'package:namaz_vakitleri_app/models/townModel.dart';
import 'package:namaz_vakitleri_app/utilities.dart';

class PrayServices {
  String baseURL = "https://ezanvakti.herokuapp.com";
  String calendarBaseURL =
      "https://www.googleapis.com/calendar/v3/calendars/turkish__tr%40holiday.calendar.google.com/events?key=$calendarAPI";
  LocalNotifications localNotifications = LocalNotifications();

  Future<List<CountryModel>> getCountries() async {
    List<CountryModel> countries = [];
    String url = baseURL + "/ulkeler";
    http.Response data = await http.get(url);
    List mapData = jsonDecode(data.body);
    mapData.forEach((element) {
      countries.add(CountryModel.fromJson(element));
    });
    return countries;
  }

  Future<List<CityModel>> getCitiesByCountry(String countryId) async {
    List<CityModel> cities = [];
    String url = baseURL + "/sehirler/$countryId";
    http.Response data = await http.get(url);
    List mapData = jsonDecode(data.body);
    mapData.forEach((element) {
      cities.add(CityModel.fromJson(element));
    });
    return cities;
  }

  Future<List<TownModel>> getTownsByCity(String cityID) async {
    List<TownModel> towns = [];
    String url = baseURL + "/ilceler/$cityID";
    http.Response data = await http.get(url);
    List mapData = jsonDecode(data.body);
    mapData.forEach((element) {
      towns.add(TownModel.fromJson(element));
    });
    return towns;
  }

  Future<List<PrayTimeModel>> getPrayTimesByTown(BuildContext context) async {
    List<PrayTimeModel> prayTimes = [];
    String data = preferences.getString("prayTimes");
    List mapData = jsonDecode(data);
    mapData.forEach((element) {
      var data = PrayTimeModel.fromJson(element);
      var dateTime = data.miladiTarihUzunIso8601DateTime;
      localNotifications.showNotificationsAfterSecond(
          DateTime(dateTime.year, dateTime.month, dateTime.day,
              data.aksamDate.hour, data.aksamDate.minute),
          "Akşam Namazı",
          "Akşam Namazı vakti geldi");
      localNotifications.showNotificationsAfterSecond(
          DateTime(dateTime.year, dateTime.month, dateTime.day,
              data.aksamDate.hour, data.aksamDate.minute),
          "İmsak Vakti",
          "İmsak Vakti geldi");
      localNotifications.showNotificationsAfterSecond(
          DateTime(dateTime.year, dateTime.month, dateTime.day,
              data.ogleDate.hour, data.ogleDate.minute),
          "Öğle Namazı",
          "Öğle Namazı vakti geldi");
      localNotifications.showNotificationsAfterSecond(
          DateTime(dateTime.year, dateTime.month, dateTime.day,
              data.ikindiDate.hour, data.ikindiDate.minute),
          "İkindi Namazı",
          "İkindi Namazı vakti geldi");
      localNotifications.showNotificationsAfterSecond(
          DateTime(dateTime.year, dateTime.month, dateTime.day,
              data.yatsiDate.hour, data.yatsiDate.minute),
          "Yatsı Namazı",
          "Yatsı Namazı vakti geldi");
      prayTimes.add(data);
    });
    return prayTimes;
  }

  savePrayTimeJsonBody(String townID) async {
    String url = baseURL + "/vakitler/$townID";
    print(url);
    http.Response data = await http.get(url);
    preferences.setString("prayTimes", data.body);
  }

  Future<SpecialDayBaseModel> getSpecialDays() async {
    http.Response data = await http.get(calendarBaseURL);
    Map<String, dynamic> mapData = jsonDecode(data.body);
    SpecialDayBaseModel model = SpecialDayBaseModel.fromJson(mapData);
    return model;
  }
}
