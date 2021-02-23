import 'package:namaz_vakitleri_app/models/special_day_item.dart';

class SpecialDayBaseModel {
  final String kind;
  final String etag;
  final String summary;
  final String updated;
  final String timeZone;
  final String nextSyncToken;
  final List<SpecialDayItem> items;

  SpecialDayBaseModel(
      {this.kind,
      this.etag,
      this.summary,
      this.updated,
      this.timeZone,
      this.nextSyncToken,
      this.items});

  factory SpecialDayBaseModel.fromJson(Map<String, dynamic> data) {
    print(data);
    List itemDataList = data['items'];
    List<SpecialDayItem> items = [];
    itemDataList.forEach((element) {
      SpecialDayItem specialDayItem = SpecialDayItem.fromJson(element);
      items.add(specialDayItem);
    });

    return SpecialDayBaseModel(
      etag: data['etag'],
      kind: data['kind'],
      summary: data['summary'],
      nextSyncToken: data['nextSyncToken'],
      timeZone: data['timeZone'],
      updated: data['updated'],
      items: items,
    );
  }
}
