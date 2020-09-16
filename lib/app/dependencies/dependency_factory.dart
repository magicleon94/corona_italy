import 'package:corona_italy/app/config/app_config.dart';
import 'package:corona_italy/features/infection_report/bloc/national/national_report_bloc.dart';
import 'package:corona_italy/features/infection_report/bloc/provincial/provincial_report_bloc.dart';
import 'package:corona_italy/features/infection_report/bloc/regional/regional_report_bloc.dart';
import 'package:corona_italy/features/infection_report/service/infections_report_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef BlocCreator<T> = T Function(BuildContext context);

abstract class DependencyFactoryBase {
  Dio createDio(BuildContext context);
  InfectionsReportService createInfectionsReportService(BuildContext context);
  BlocCreator<NationalReportBloc> get nationalReportBlocCreator;
  BlocCreator<RegionalReportBloc> get regionalReportBlocCreator;
  BlocCreator<ProvincialReportBloc> get provincialReportBlocCreator;
}

class DependencyFactory extends DependencyFactoryBase {
  @override
  Dio createDio(BuildContext _) => Dio(
        BaseOptions(
            baseUrl: AppConfig.BASE_URL, contentType: 'application/json'),
      );

  @override
  InfectionsReportService createInfectionsReportService(BuildContext context) =>
      InfectionsReportService(context.repository<Dio>());

  @override
  BlocCreator<NationalReportBloc> get nationalReportBlocCreator =>
      (BuildContext context) =>
          NationalReportBloc(context.repository<InfectionsReportService>());

  @override
  BlocCreator<RegionalReportBloc> get regionalReportBlocCreator =>
      (BuildContext context) =>
          RegionalReportBloc(context.repository<InfectionsReportService>());

  @override
  BlocCreator<ProvincialReportBloc> get provincialReportBlocCreator =>
      (BuildContext context) =>
          ProvincialReportBloc(context.repository<InfectionsReportService>());
}
