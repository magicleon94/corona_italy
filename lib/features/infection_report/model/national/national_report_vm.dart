import 'package:corona_italy/features/infection_report/model/national/national_report_response.dart';

class NationalReportVm {
  final DateTime date;
  final String country;
  final int hospitalizedWithSymptoms;
  final int intensiveCare;
  final int totalHospitalized;
  final int homeIsolation;
  final int totalPositive;
  final int totalPositiveVariation;
  final int newPositive;
  final int dischargedHealed;
  final int deceased;
  final String diagnosticSuspicionCases;
  final String screeningCases;
  final int totalCases;
  final int tampons;
  final int testedCases;
  final String notes;

  NationalReportVm({
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

  factory NationalReportVm.fromDto(NationalReportResponse dto) {
    return NationalReportVm(
      date: dto.date,
      country: dto.country,
      hospitalizedWithSymptoms: dto.hospitalizedWithSymptoms,
      intensiveCare: dto.intensiveCare,
      totalHospitalized: dto.totalHospitalized,
      homeIsolation: dto.homeIsolation,
      totalPositive: dto.totalPositive,
      totalPositiveVariation: dto.totalPositiveVariation,
      newPositive: dto.newPositive,
      dischargedHealed: dto.dischargedHealed,
      deceased: dto.deceased,
      diagnosticSuspicionCases: dto.diagnosticSuspicionCases,
      screeningCases: dto.screeningCases,
      totalCases: dto.totalCases,
      tampons: dto.tampons,
      testedCases: dto.testedCases,
      notes: dto.notes,
    );
  }
}
