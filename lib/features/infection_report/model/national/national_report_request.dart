import 'package:http_services/http_services.dart';

class NationalReportRequest extends RequestBase {
  @override
  String get endpoint =>
      '/dati-json/dpc-covid19-ita-andamento-nazionale-latest.json';

  @override
  Map<String, String> toJson() => {};
}
