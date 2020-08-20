import 'package:corona_italy/app/config/app_config.dart';
import 'package:corona_italy/common/closable_bloc.dart';
import 'package:corona_italy/features/infection_report/bloc/national/national_report_bloc.dart';
import 'package:corona_italy/features/infection_report/bloc/national/national_report_bloc_state.dart';
import 'package:corona_italy/features/infection_report/service/national_report_service.dart';
import 'package:dio/dio.dart';
import 'package:http_services/http_services.dart';

class DependencyProvider {
  static DependencyProvider _instance;

  DependencyProvider._internal();

  static DependencyProvider get instance {
    _instance ??= DependencyProvider._internal();
    return _instance;
  }

  Dio _dio;

  Dio get dio {
    _dio ??= Dio(
      BaseOptions(baseUrl: AppConfig.BASE_URL, contentType: 'application/json'),
    );
    return _dio;
  }

  NationalReportService _nationalReportService;

  NationalReportService get nationalReportService {
    if (_serviceNeedsBuild(_nationalReportService)) {
      _nationalReportService ??= NationalReportService(dio);
    }
    return _nationalReportService;
  }

  NationalReportBloc _nationalReportBloc;

  NationalReportBloc getNationalReportBloc({NationalReportState initialState}) {
    if (_blocNeedsBuild(_nationalReportBloc)) {
      _nationalReportBloc =
          NationalReportBloc(nationalReportService, initialState: initialState);
    }
    return _nationalReportBloc;
  }

  bool _blocNeedsBuild(ClosableBloc bloc) => bloc == null || bloc.closed;
  bool _serviceNeedsBuild(HttpServiceBase service) =>
      service == null || service.disposed;
}
