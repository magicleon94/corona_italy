import 'package:corona_italy/features/infection_report/bloc/infection_report_bloc_state.dart';
import 'package:corona_italy/features/infection_report/model/regional/regional_report_vm.dart';

abstract class RegionalReportState extends InfectionReportBlocState {}

class RegionalReportIdle extends RegionalReportState {}

class RegionalReportLoading extends RegionalReportState {}

class RegionalReportLoaded extends RegionalReportState {
  final RegionalReportsVm report;

  RegionalReportLoaded(this.report);
}

class RegionalReportLoadingError extends RegionalReportState {
  final String reason;

  RegionalReportLoadingError(this.reason);
}
