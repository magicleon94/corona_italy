import 'package:corona_italy/common/helpers/location_helper.dart';
import 'package:corona_italy/features/infection_report/model/provincial/provincial_report_response.dart';
import 'package:latlong2/latlong.dart';

extension ListExtension<T> on List<T> {
  T removeFirstWhere(bool Function(T) predicate) {
    var index = 0;

    while (index < length) {
      if (predicate(this[index])) {
        return removeAt(index);
      }
    }

    return null;
  }
}

class ProvincialReportsVm {
  final List<ProvincialReportVm> reports;
  ProvincialReportsVm({
    this.reports,
  });

  factory ProvincialReportsVm.fromDto(
      ProvincialReportResponse dto, ProvincialReportResponse yesterdayDto) {
    final todayReports = List<ProvincialReport>.from(dto.reports);
    final yesterdayReports = List<ProvincialReport>.from(yesterdayDto.reports);

    final reports = <ProvincialReportVm>[];
    while (todayReports.isNotEmpty) {
      final today = todayReports.removeAt(0);
      final yesterday = yesterdayReports
          .removeFirstWhere((p) => p.provinceCode == today.provinceCode);
      reports.add(ProvincialReportVm.fromDto(today, yesterday));
    }

    return ProvincialReportsVm(reports: reports);
  }
}

class ProvincialReportVm {
  final DateTime date;
  final String country;
  final int regionCode;
  final String regionName;
  final int provinceCode;
  final String provinceName;
  final String provinceAbbreviation;
  final LatLng location;
  final int totalCases;
  final String notes;
  final int newPositive;

  ProvincialReportVm({
    this.date,
    this.country,
    this.regionCode,
    this.regionName,
    this.provinceCode,
    this.provinceName,
    this.provinceAbbreviation,
    this.location,
    this.totalCases,
    this.notes,
    this.newPositive,
  });

  factory ProvincialReportVm.fromDto(
      ProvincialReport dto, ProvincialReport yesterday) =>
      ProvincialReportVm(
        date: dto.date,
        country: dto.country,
        regionCode: dto.regionCode,
        regionName: dto.regionName,
        provinceCode: dto.provinceCode,
        provinceName: dto.provinceName,
        provinceAbbreviation: dto.provinceAbbreviation,
        location: LocationHelper.getLatLng(dto.latitude, dto.longitude),
        totalCases: dto.totalCases,
        notes: dto.notes,
        newPositive: dto.totalCases - (yesterday?.totalCases ?? dto.totalCases),
      );
}
