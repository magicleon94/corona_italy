import 'package:corona_italy/app/routes/routes.dart';
import 'package:corona_italy/features/infection_report/bloc/regional/regional_report_bloc.dart';
import 'package:corona_italy/features/infection_report/bloc/regional/regional_report_bloc_state.dart';
import 'package:corona_italy/features/infection_report/model/regional/regional_report_vm.dart';
import 'package:corona_italy/features/infection_report/presentation/widgets/report_preview_list_tile.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegionsReportList extends StatelessWidget {
  final ScrollController scrollController;

  const RegionsReportList({Key key, this.scrollController}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegionalReportBloc, RegionalReportState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case RegionalReportIdle:
          case RegionalReportLoading:
            return Center(
              child: CircularProgressIndicator(),
            );
          case RegionalReportLoaded:
            final casted = state as RegionalReportLoaded;
            return _Body(model: casted.report);
          case RegionalReportLoadingError:
          default:
            final casted = state as RegionalReportLoadingError;
            return Column(
              children: [
                Text(
                  tr(
                    'error',
                    namedArgs: {'reason': casted.reason},
                  ),
                ),
              ],
            );
        }
      },
    );
  }
}

class _Body extends StatelessWidget {
  final RegionalReportsVm model;
  final ScrollController scrollController;

  const _Body({Key key, @required this.model, this.scrollController})
      : assert(model != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            tr('regions_list'),
            style: Theme.of(context).textTheme.headline5,
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                final report = model.reports[index];
                return ReportPreviewListTile(
                    onTap: () => Navigator.of(context).pushNamed(
                          Routes.regionDetail,
                          arguments: report,
                        ),
                    title: report.regionName,
                    totalPositive: report.totalPositive,
                    newPositive: report.newPositive);
              },
              separatorBuilder: (_, __) => Divider(),
              itemCount: model.reports.length,
            ),
          )
        ],
      ),
    );
  }
}
