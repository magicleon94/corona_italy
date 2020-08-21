import 'package:corona_italy/features/infection_report/model/regional/regional_report_vm.dart';
import 'package:corona_italy/features/infection_report/presentation/screens/regional_report_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:route_handler/route_handler.dart';

class RegionalReportHandler extends RouteHandler<RegionalReportVm> {
  RegionalReportHandler(RouteSettings settings, RegionalReportVm routeExtra)
      : super(settings, routeExtra: routeExtra);

  @override
  Route getRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => RegionalReportScreen(model: routeExtra),
    );
  }
}
