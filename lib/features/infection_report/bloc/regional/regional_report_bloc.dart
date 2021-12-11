import 'package:corona_italy/features/infection_report/bloc/regional/regional_report_bloc_event.dart';
import 'package:corona_italy/features/infection_report/bloc/regional/regional_report_bloc_state.dart';
import 'package:corona_italy/features/infection_report/model/regional/regional_report_request.dart';
import 'package:corona_italy/features/infection_report/model/regional/regional_report_vm.dart';
import 'package:corona_italy/features/infection_report/service/infections_report_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegionalReportBloc
    extends Bloc<RegionalReportBlocEvent, RegionalReportState> {
  final InfectionsReportService service;
  RegionalReportBloc(this.service, {RegionalReportState initialState})
      : super(initialState ?? RegionalReportIdle()){

    on<RegionalReportFetch>((event, emit) async {
      try {
        emit(RegionalReportLoading());
        final model = await _fetchRegionalReport();
        emit(RegionalReportLoaded(model));
      } catch (e) {
        emit(RegionalReportLoadingError(e.toString()));
      }
    });
  }

  Future<RegionalReportsVm> _fetchRegionalReport() async {
    final response = await service.getRegionalReport(RegionalReportRequest());
    final model = RegionalReportsVm.fromDto(response);
    return model;
  }
}
