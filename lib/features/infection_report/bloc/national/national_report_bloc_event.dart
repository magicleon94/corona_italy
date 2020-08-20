import 'package:corona_italy/features/infection_report/bloc/infection_report_bloc_event.dart';

abstract class NationalReportBlocEvent extends InfectionReportBlocEvent {}

class NationalReportFetch extends NationalReportBlocEvent {}
