import 'package:corona_italy/features/infection_report/bloc/infection_report_bloc_state.dart';
import 'package:corona_italy/features/infection_report/model/provincial/provincial_report_vm.dart';

class ProvincialReportBlocState extends InfectionReportBlocState {}

class ProvincialReportIdle extends ProvincialReportBlocState {}

class ProvincialReportLoading extends ProvincialReportBlocState {}

class ProvincialReportLoaded extends ProvincialReportBlocState {
  final ProvincialReportsVm report;

  ProvincialReportLoaded(this.report);
}

class ProvincialReportLoadingError extends ProvincialReportBlocState {
  final String reason;
  ProvincialReportLoadingError(this.reason);
}
