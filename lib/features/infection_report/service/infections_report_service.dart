import 'dart:convert';

import 'package:corona_italy/features/infection_report/model/national/national_report_request.dart';
import 'package:corona_italy/features/infection_report/model/national/national_report_response.dart';
import 'package:corona_italy/features/infection_report/model/regional/regional_report_request.dart';
import 'package:corona_italy/features/infection_report/model/regional/regional_report_response.dart';
import 'package:dio/src/dio.dart';
import 'package:http_services/http_services.dart';

class InfectionsReportService extends HttpServiceBase {
  InfectionsReportService(Dio dioInstance) : super(dioInstance);
  Future<NationalReportResponse> getNationalResponse(
      NationalReportRequest request) {
    return getQuery(
        request: request,
        mapper: (json) => NationalReportResponse.fromJson(json),
        orElse: (data) {
          final decoded = jsonDecode(data);
          final json = decoded.first;
          return NationalReportResponse.fromJson(json);
        });
  }

  Future<RegionalReportResponse> getRegionalResponse(
      RegionalReportRequest request) {
    return getQuery(
        request: request,
        mapper: (json) => RegionalReportResponse.fromJson(json),
        orElse: (data) {
          final decoded = jsonDecode(data);
          return RegionalReportResponse.fromJson({'data': decoded});
        });
  }
}
