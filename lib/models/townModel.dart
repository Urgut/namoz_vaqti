class TownModel {
  final String townName;
  final String townNameEn;
  final String townId;

  TownModel({this.townName, this.townNameEn, this.townId});

  factory TownModel.fromJson(Map<String, dynamic> data) {
    return TownModel(
      townName: data['IlceAdi'],
      townId: data['IlceID'],
      townNameEn: data['IlceAdiEn'],
    );
  }
}
