import 'package:corona_italy/features/infection_report/model/national/national_report_vm.dart';
import 'package:corona_italy/features/infection_report/presentation/screens/national_report_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:route_handler/route_handler.dart';

class NationalReportHandler extends RouteHandler<NationalReportVm> {
  NationalReportHandler(RouteSettings settings, NationalReportVm model)
      : super(
          settings,
          routeExtra: model,
        );

  @override
  Route getRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => NationalReportScreen(
        model: routeExtra,
      ),
    );
  }
}
