import 'package:http_services/http_services.dart';

class RegionalReportRequest extends RequestBase {
  @override
  String get endpoint => '/dati-json/dpc-covid19-ita-regioni-latest.json';
  @override
  Map<String, String> toJson() => {};
}
