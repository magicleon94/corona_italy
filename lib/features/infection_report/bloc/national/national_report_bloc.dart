import 'package:corona_italy/common/closable_bloc.dart';
import 'package:corona_italy/features/infection_report/bloc/national/national_report_bloc_event.dart';
import 'package:corona_italy/features/infection_report/bloc/national/national_report_bloc_state.dart';
import 'package:corona_italy/features/infection_report/model/national/national_report_request.dart';
import 'package:corona_italy/features/infection_report/model/national/national_report_vm.dart';
import 'package:corona_italy/features/infection_report/service/national_report_service.dart';

class NationalReportBloc
    extends ClosableBloc<NationalReportBlocEvent, NationalReportState> {
  NationalReportService service;
  NationalReportBloc(this.service, {NationalReportState initialState})
      : super(initialState ?? NationalReportIdle());

  @override
  Stream<NationalReportState> mapEventToState(
      NationalReportBlocEvent event) async* {
    switch (event.runtimeType) {
      case NationalReportFetch:
        try {
          yield NationalReportLoading();
          final model = await _fetchNationalReport();
          yield NationalReportLoaded(model);
        } catch (e) {
          yield NationalReportLoadingError(e.toString());
        }
        break;
      default:
        throw UnsupportedError('Event not supported');
        break;
    }
  }

  Future<NationalReportVm> _fetchNationalReport() async {
    final response = await service.getNationalResponse(NationalReportRequest());
    return NationalReportVm.fromDto(response);
  }

  @override
  Future<void> close() {
    service.dispose();
    return super.close();
  }
}
