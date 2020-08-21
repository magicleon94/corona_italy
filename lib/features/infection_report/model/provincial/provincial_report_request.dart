import 'package:http_services/http_services.dart';

class ProvincialReportRequest extends RequestBase {
  final DateTime day;

  ProvincialReportRequest({this.day});
  @override
  String get endpoint {
    if (day == null) {
      return '/dati-json/dpc-covid19-ita-province-latest.json';
    } else {
      return '/dati-province/dpc-covid19-ita-province-${day.year}${day.month.toString().padLeft(2, '0')}${day.day.toString().padLeft(2, '0')}.csv';
    }
  }

  @override
  Map<String, dynamic> toJson() => {};
}
