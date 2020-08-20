import 'package:http_services/http_services.dart';
import 'package:json_annotation/json_annotation.dart';

part 'national_report_response.g.dart';

@JsonSerializable(createToJson: false)
class NationalReportResponse extends ResponseBase {
  @JsonKey(name: 'data')
  final DateTime date;

  @JsonKey(name: 'stato')
  final String country;
  @JsonKey(name: 'ricoverati_con_sintomi')
  final int hospitalizedWithSymptoms;
  @JsonKey(name: 'terapia_intensiva')
  final int intensiveCare;
  @JsonKey(name: 'totale_ospedalizzati')
  final int totalHospitalized;
  @JsonKey(name: 'isolamento_domiciliare')
  final int homeIsolation;
  @JsonKey(name: 'totale_positivi')
  final int totalPositive;
  @JsonKey(name: 'variazione_totale_positivi')
  final int totalPositiveVariation;
  @JsonKey(name: 'nuovi_positivi')
  final int newPositive;
  @JsonKey(name: 'dimessi_guariti')
  final int dischargedHealed;
  @JsonKey(name: 'deceduti')
  final int deceased;
  @JsonKey(name: 'casi_da_sospetto_diagnostico')
  final int diagnosticSuspicionCases;
  @JsonKey(name: 'casi_da_screening')
  final int screeningCases;
  @JsonKey(name: 'totale_casi')
  final int totalCases;
  @JsonKey(name: 'tamponi')
  final int tampons;
  @JsonKey(name: 'casi_testati')
  final int testedCases;
  @JsonKey(name: 'note')
  final String notes;

  NationalReportResponse({
    this.date,
    this.country,
    this.hospitalizedWithSymptoms,
    this.intensiveCare,
    this.totalHospitalized,
    this.homeIsolation,
    this.totalPositive,
    this.totalPositiveVariation,
    this.newPositive,
    this.dischargedHealed,
    this.deceased,
    this.diagnosticSuspicionCases,
    this.screeningCases,
    this.totalCases,
    this.tampons,
    this.testedCases,
    this.notes,
  });

  factory NationalReportResponse.fromJson(Map<String, dynamic> json) {
    return _$NationalReportResponseFromJson(json);
  }
}
