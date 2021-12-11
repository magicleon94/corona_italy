import 'package:corona_italy/features/infection_report/bloc/national/national_report_bloc_event.dart';
import 'package:corona_italy/features/infection_report/bloc/national/national_report_bloc_state.dart';
import 'package:corona_italy/features/infection_report/model/national/national_report_request.dart';
import 'package:corona_italy/features/infection_report/model/national/national_report_vm.dart';
import 'package:corona_italy/features/infection_report/service/infections_report_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NationalReportBloc
    extends Bloc<NationalReportBlocEvent, NationalReportState> {
  InfectionsReportService service;
  NationalReportBloc(this.service, {NationalReportState initialState})
      : super(initialState ?? NationalReportIdle()) {

    on<NationalReportFetch>((event, emit) async {
      try {
        emit(NationalReportLoading());
        final model = await _fetchNationalReport();
        emit(NationalReportLoaded(model));
      } catch (e) {
        emit(NationalReportLoadingError(e.toString()));
      }
    });
  }

  Future<NationalReportVm> _fetchNationalReport() async {
    final response = await service.getNationalReport(NationalReportRequest());
    return NationalReportVm.fromDto(response);
  }

  @override
  Future<void> close() {
    service.dispose();
    return super.close();
  }
}
