import 'package:corona_italy/app/dependencies/dependency_factory.dart';
import 'package:corona_italy/features/infection_report/bloc/national/national_report_bloc.dart';
import 'package:corona_italy/features/infection_report/bloc/provincial/provincial_report_bloc.dart';
import 'package:corona_italy/features/infection_report/bloc/regional/regional_report_bloc.dart';
import 'package:corona_italy/features/infection_report/service/infections_report_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DependencyProvider extends StatelessWidget {
  final Widget child;
  final DependencyFactory dependencyFactory;

  const DependencyProvider({
    Key key,
    this.child,
    this.dependencyFactory,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<Dio>(create: dependencyFactory.createDio),
        RepositoryProvider<InfectionsReportService>(
            create: dependencyFactory.createInfectionsReportService),
        RepositoryProvider<BlocCreator<NationalReportBloc>>(
            create: (_) => dependencyFactory.nationalReportBlocCreator),
        RepositoryProvider<BlocCreator<RegionalReportBloc>>(
            create: (_) => dependencyFactory.regionalReportBlocCreator),
        RepositoryProvider<BlocCreator<ProvincialReportBloc>>(
            create: (_) => dependencyFactory.provincialReportBlocCreator),
      ],
      child: Builder(
        builder: (context) => child,
      ),
    );
  }
}
