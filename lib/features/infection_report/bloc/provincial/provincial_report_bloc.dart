import 'package:corona_italy/features/infection_report/bloc/provincial/provincial_report_bloc_event.dart';
import 'package:corona_italy/features/infection_report/bloc/provincial/provincial_report_bloc_state.dart';
import 'package:corona_italy/features/infection_report/model/provincial/provincial_report_request.dart';
import 'package:corona_italy/features/infection_report/model/provincial/provincial_report_vm.dart';
import 'package:corona_italy/features/infection_report/service/infections_report_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProvincialReportBloc
    extends Bloc<ProvincialReportBlocEvent, ProvincialReportBlocState> {
  final InfectionsReportService service;
  final int regionCode;
  ProvincialReportBloc(this.service,
      {ProvincialReportBlocState initialState, this.regionCode})
      : super(initialState ?? ProvincialReportIdle()){

    on<ProvincialReportFetch>((event, emit) async {
      try {
        emit(ProvincialReportLoading());
        final model = await _fetchProvincialReport();
        emit(ProvincialReportLoaded(model));
      } catch (e) {
        emit(ProvincialReportLoadingError(e.toString()));
      }
    });
  }

  Future<ProvincialReportsVm> _fetchProvincialReport() async {
    final response =
    await service.getProvincialReport(ProvincialReportRequest());

    final yesterdayResponse = await service.getProvincialReport(
      ProvincialReportRequest(
        day: response.reports.first.date.add(
          Duration(days: -1),
        ),
      ),
    );

    if (regionCode != null) {
      response.reports.removeWhere((r) => r.regionCode != regionCode);
      yesterdayResponse.reports.removeWhere((r) => r.regionCode != regionCode);
    }

    final model = ProvincialReportsVm.fromDto(response, yesterdayResponse);

    return model;
  }
}
