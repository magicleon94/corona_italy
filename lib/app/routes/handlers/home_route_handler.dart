import 'package:corona_italy/app/dependencies/dependency_provider.dart';
import 'package:corona_italy/features/infection_report/bloc/national/national_report_bloc.dart';
import 'package:corona_italy/features/infection_report/bloc/regional/regional_report_bloc.dart';
import 'package:corona_italy/features/infection_report/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_handler/route_handler.dart';

class HomeRouteHandler extends RouteHandler {
  HomeRouteHandler(RouteSettings settings) : super(settings);

  @override
  Route getRoute(BuildContext context) => MaterialPageRoute(
        settings: settings,
        builder: (_) => MultiBlocProvider(
          providers: [
            BlocProvider<NationalReportBloc>(
              create: (_) =>
                  DependencyProvider.instance.getNationalReportBloc(),
            ),
            BlocProvider<RegionalReportBloc>(
              create: (_) =>
                  DependencyProvider.instance.getRegionalReportBloc(),
            )
          ],
          child: HomeScreen(),
        ),
      );
}
