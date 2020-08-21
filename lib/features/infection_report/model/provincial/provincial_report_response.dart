import 'package:http_services/http_services.dart';
import 'package:json_annotation/json_annotation.dart';

part 'provincial_report_response.g.dart';

@JsonSerializable(createToJson: false)
class ProvincialReportResponse extends ResponseBase {
  @JsonKey(name: 'data', defaultValue: <ProvincialReport>[])
  final List<ProvincialReport> reports;
  ProvincialReportResponse({
    this.reports,
  });

  factory ProvincialReportResponse.fromJson(Map<String, dynamic> json) =>
      _$ProvincialReportResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class ProvincialReport {
  @JsonKey(name: 'data')
  final DateTime date;

  @JsonKey(name: 'stato')
  final String country;

  @JsonKey(name: 'codice_regione')
  final int regionCode;

  @JsonKey(name: 'denominazione_regione')
  final String regionName;

  @JsonKey(name: 'codice_provincia')
  final int provinceCode;

  @JsonKey(name: 'denominazione_provincia')
  final String provinceName;

  @JsonKey(name: 'sigla_provincia')
  final String provinceAbbreviation;

  @JsonKey(name: 'lat')
  final double latitude;

  @JsonKey(name: 'long')
  final double longitude;

  @JsonKey(name: 'totale_casi')
  final int totalCases;

  @JsonKey(name: 'note', defaultValue: '')
  final String notes;
  ProvincialReport({
    this.date,
    this.country,
    this.regionCode,
    this.regionName,
    this.provinceCode,
    this.provinceName,
    this.provinceAbbreviation,
    this.latitude,
    this.longitude,
    this.totalCases,
    this.notes,
  });
  factory ProvincialReport.fromJson(Map<String, dynamic> json) =>
      _$ProvincialReportFromJson(json);
}
