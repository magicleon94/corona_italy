import 'package:corona_italy/features/infection_report/bloc/provincial/provincial_report_bloc.dart';
import 'package:corona_italy/features/infection_report/bloc/provincial/provincial_report_bloc_state.dart';
import 'package:corona_italy/features/infection_report/presentation/widgets/province_report_tile.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProvincesReportList extends StatelessWidget {
  final int regionCode;

  const ProvincesReportList({Key key, this.regionCode}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProvincialReportBloc, ProvincialReportBlocState>(
      listenWhen: (previous, current) =>
          current is ProvincialReportLoadingError,
      listener: (context, state) {
        if (state is ProvincialReportLoadingError) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text(
                tr('error', namedArgs: {'reason': state.reason}),
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case ProvincialReportIdle:
          case ProvincialReportLoading:
            return Center(
              child: CircularProgressIndicator(),
            );
          case ProvincialReportLoaded:
            final casted = state as ProvincialReportLoaded;
            final reports = casted.report.reports
                .where((province) => province.regionCode == regionCode)
                .toList();
            if (reports.isEmpty) {
              return Text(tr('no_provinces_data'));
            }
            return Column(
              children: [
                Text(
                  tr('provinces_list'),
                  style: Theme.of(context).textTheme.headline5,
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final province = casted.report.reports[index];
                    return ProvinceReportTile(
                      title: province.provinceName,
                      newPositive: province.newPositive,
                    );
                  },
                  separatorBuilder: (_, __) => Divider(),
                  itemCount: reports.length,
                )
              ],
            );
          default:
            return Text(tr('no_provinces_data'));
        }
      },
    );
  }
}
