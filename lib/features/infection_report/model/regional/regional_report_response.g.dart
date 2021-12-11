// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'regional_report_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegionalReportResponse _$RegionalReportResponseFromJson(
    Map<String, dynamic> json) {
  return RegionalReportResponse(
    reports: (json['data'] as List)
            ?.map((e) => e == null
                ? null
                : RegionalReport.fromJson(e as Map<String, dynamic>))
            ?.toList() ??
        [],
  );
}

RegionalReport _$RegionalReportFromJson(Map<String, dynamic> json) {
  return RegionalReport(
    date: json['data'] == null ? null : DateTime.parse(json['data'] as String),
    country: json['stato'] as String,
    regionCode: json['codice_regione'] as int,
    regionName: json['denominazione_regione'] as String,
    latitude: (json['lat'] as num)?.toDouble(),
    longitude: (json['long'] as num)?.toDouble(),
    hospitalizedWithSymptoms: json['ricoverati_con_sintomi'] as int,
    intensiveCare: json['terapia_intensiva'] as int,
    totalHospitalized: json['totale_ospedalizzati'] as int,
    homeIsolation: json['isolamento_domiciliare'] as int,
    totalPositive: json['totale_positivi'] as int,
    totalPositiveVariation: json['variazione_totale_positivi'] as int,
    newPositive: json['nuovi_positivi'] as int,
    dischargedHealed: json['dimessi_guariti'] as int,
    deceased: json['deceduti'] as int,
    diagnosticSuspicionCases:
        json['casi_da_sospetto_diagnostico'] as String ?? 'n.a.',
    screeningCases: json['casi_da_screening'] as String ?? 'n.a.',
    totalCases: json['totale_casi'] as int,
    tampons: json['tamponi'] as int,
    testedCases: json['casi_testati'] as int,
    notes: json['note'] as String ?? '',
  );
}
