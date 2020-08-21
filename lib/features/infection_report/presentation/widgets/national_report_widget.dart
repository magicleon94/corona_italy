import 'package:corona_italy/app/routes/routes.dart';
import 'package:corona_italy/features/infection_report/bloc/national/national_report_bloc.dart';
import 'package:corona_italy/features/infection_report/bloc/national/national_report_bloc_state.dart';
import 'package:corona_italy/features/infection_report/model/national/national_report_vm.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NationalReportWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NationalReportBloc, NationalReportState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case NationalReportIdle:
          case NationalReportLoading:
            return Center(
              child: CircularProgressIndicator(),
            );
          case NationalReportLoaded:
            final casted = state as NationalReportLoaded;
            return _NationalReportCard(model: casted.report);
          case NationalReportLoadingError:
          default:
            final casted = state as NationalReportLoadingError;
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

class _NationalReportCard extends StatelessWidget {
  final NationalReportVm model;

  const _NationalReportCard({Key key, @required this.model})
      : assert(model != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            tr(
              'national_report_update',
              namedArgs: {'lastUpdate': DateFormat.yMMMMd().format(model.date)},
            ),
            style: Theme.of(context).textTheme.bodyText1,
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Wrap(
              alignment: WrapAlignment.spaceAround,
              children: [
                _NationalReportChip(
                  tr('total_positive'),
                  model.totalPositive.toString(),
                ),
                _NationalReportChip(
                  tr('daily_variation'),
                  model.totalPositiveVariation.toString(),
                ),
              ],
            ),
          ),
          Center(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => Navigator.of(context)
                  .pushNamed(Routes.nationDetail, arguments: model),
              child: Text(
                tr('full_report'),
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _NationalReportChip extends StatelessWidget {
  final String title;
  final String value;

  const _NationalReportChip(this.title, this.value);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: Theme.of(context).textTheme.subtitle2),
        Text(value, style: Theme.of(context).textTheme.bodyText1),
      ],
    );
  }
}
