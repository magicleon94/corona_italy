// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'national_report_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NationalReportResponse _$NationalReportResponseFromJson(
    Map<String, dynamic> json) {
  return NationalReportResponse(
    date: json['data'] == null ? null : DateTime.parse(json['data'] as String),
    country: json['stato'] as String,
    hospitalizedWithSymptoms: json['ricoverati_con_sintomi'] as int,
    intensiveCare: json['terapia_intensiva'] as int,
    totalHospitalized: json['totale_ospedalizzati'] as int,
    homeIsolation: json['isolamento_domiciliare'] as int,
    totalPositive: json['totale_positivi'] as int,
    totalPositiveVariation: json['variazione_totale_positivi'] as int,
    newPositive: json['nuovi_positivi'] as int,
    dischargedHealed: json['dimessi_guariti'] as int,
    deceased: json['deceduti'] as int,
    diagnosticSuspicionCases: json['casi_da_sospetto_diagnostico'] as int,
    screeningCases: json['casi_da_screening'] as int,
    totalCases: json['totale_casi'] as int,
    tampons: json['tamponi'] as int,
    testedCases: json['casi_testati'] as int,
    notes: json['note'] as String,
  );
}
