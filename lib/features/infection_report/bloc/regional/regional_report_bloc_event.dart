import 'package:corona_italy/features/infection_report/bloc/infection_report_bloc_event.dart';

abstract class RegionalReportBlocEvent extends InfectionReportBlocEvent {}

class RegionalReportFetch extends RegionalReportBlocEvent {}
