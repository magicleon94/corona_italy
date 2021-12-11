import 'package:corona_italy/common/helpers/location_helper.dart';
import 'package:corona_italy/features/infection_report/model/regional/regional_report_response.dart';
import 'package:latlong2/latlong.dart';

class RegionalReportVm {
  final DateTime date;
  final String country;
  final int regionCode;
  final String regionName;
  final LatLng location;
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

  RegionalReportVm({
    this.date,
    this.country,
    this.regionCode,
    this.regionName,
    this.location,
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

  factory RegionalReportVm.fromDto(RegionalReport dto) => RegionalReportVm(
    date: dto.date,
    country: dto.country,
    regionCode: dto.regionCode,
    regionName: dto.regionName,
    location: LocationHelper.getLatLng(dto.latitude, dto.longitude),
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

class RegionalReportsVm {
  final List<RegionalReportVm> reports;
  RegionalReportsVm({
    this.reports,
  });

  factory RegionalReportsVm.fromDto(RegionalReportResponse dto) =>
      RegionalReportsVm(
        reports: dto.reports.map((d) => RegionalReportVm.fromDto(d)).toList(),
      );
}
