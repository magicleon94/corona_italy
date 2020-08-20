import 'package:corona_italy/app/dependencies/dependency_provider.dart';
import 'package:corona_italy/features/infection_report/presentation/screens/national_report_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_handler/route_handler.dart';

class NationalReportHandler extends RouteHandler {
  NationalReportHandler(RouteSettings settings) : super(settings);

  @override
  Route getRoute(BuildContext context) {
    return MaterialPageRoute(
      builder: (_) => BlocProvider.value(
        value: DependencyProvider.instance.getNationalReportBloc(),
        child: NationalReportScreen(),
      ),
    );
  }
}
