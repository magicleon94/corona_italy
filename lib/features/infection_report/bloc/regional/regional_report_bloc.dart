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
      : super(initialState ?? RegionalReportIdle());

  @override
  Stream<RegionalReportState> mapEventToState(
      RegionalReportBlocEvent event) async* {
    switch (event.runtimeType) {
      case RegionalReportFetch:
        try {
          yield RegionalReportLoading();
          final model = await _fetchRegionalReport();
          yield RegionalReportLoaded(model);
        } catch (e) {
          yield RegionalReportLoadingError(e.toString());
        }
        break;
      default:
        throw UnsupportedError('Event not supported');
        break;
    }
  }

  Future<RegionalReportsVm> _fetchRegionalReport() async {
    final response = await service.getRegionalReport(RegionalReportRequest());
    final model = RegionalReportsVm.fromDto(response);
    return model;
  }
}
