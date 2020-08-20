import 'package:corona_italy/features/infection_report/bloc/infection_report_bloc_state.dart';
import 'package:corona_italy/features/infection_report/model/national/national_report_vm.dart';

abstract class NationalReportState extends InfectionReportBlocState {}

class NationalReportIdle extends NationalReportState {}

class NationalReportLoading extends NationalReportState {}

class NationalReportLoaded extends NationalReportState {
  final NationalReportVm report;

  NationalReportLoaded(this.report);
}

class NationalReportLoadingError extends NationalReportState {
  final String reason;
  NationalReportLoadingError(this.reason);
}
