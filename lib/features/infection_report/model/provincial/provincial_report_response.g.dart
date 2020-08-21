// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provincial_report_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProvincialReportResponse _$ProvincialReportResponseFromJson(
    Map<String, dynamic> json) {
  return ProvincialReportResponse(
    reports: (json['data'] as List)
            ?.map((e) => e == null
                ? null
                : ProvincialReport.fromJson(e as Map<String, dynamic>))
            ?.toList() ??
        [],
  );
}

ProvincialReport _$ProvincialReportFromJson(Map<String, dynamic> json) {
  try {
    return ProvincialReport(
      date:
          json['data'] == null ? null : DateTime.parse(json['data'] as String),
      country: json['stato'] as String,
      regionCode: json['codice_regione'] as int,
      regionName: json['denominazione_regione'] as String,
      provinceCode: json['codice_provincia'] as int,
      provinceName: json['denominazione_provincia'] as String,
      provinceAbbreviation: json['sigla_provincia'] as String,
      latitude: (json['lat'] as num)?.toDouble(),
      longitude: (json['long'] as num)?.toDouble(),
      totalCases: json['totale_casi'] as int,
      notes: json['note'] as String,
    );
  } catch (e) {
    rethrow;
  }
}
