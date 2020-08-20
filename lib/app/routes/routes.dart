import 'package:corona_italy/app/routes/handlers/home_route_handler.dart';
import 'package:corona_italy/app/routes/handlers/national_report_handler.dart';
import 'package:flutter/material.dart';

class Routes {
  static const home = 'home';
  static const nationDetail = '$home/nation';
  static const regionDetail = '$home/region';
  static const provinceDetail = '$regionDetail/provinceDetail';

  static Route onGenerateRoute(RouteSettings settings, BuildContext context) {
    var route = settings.name.split('?').first;

    if (route.startsWith('/')) {
      route = route.substring(1);
    }

    switch (route) {
      case nationDetail:
        return NationalReportHandler(settings).getRoute(context);
      default:
        return HomeRouteHandler(settings).getRoute(context);
    }
  }
}
