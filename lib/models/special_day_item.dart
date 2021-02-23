class SpecialDayItem {
  final String kind;
  final String etag;
  final String id;
  final String status;
  final String htmlLink;
  final String created;
  final String updated;
  final String summary;
  final DateTime start;
  final DateTime end;

  SpecialDayItem(
      {this.kind,
      this.etag,
      this.id,
      this.status,
      this.htmlLink,
      this.created,
      this.updated,
      this.summary,
      this.start,
      this.end});

  factory SpecialDayItem.fromJson(Map<String, dynamic> data) {
    DateTime start = DateTime.parse(data['start']['date']);
    DateTime end = DateTime.parse(data['end']['date']);

    return SpecialDayItem(
        created: data['created'],
        end: end,
        start: start,
        etag: data['etag'],
        htmlLink: data['htmlLink'],
        id: data['id'],
        kind: data['kind'],
        status: data['status'],
        summary: data['summary'],
        updated: data['updated']);
  }
}
