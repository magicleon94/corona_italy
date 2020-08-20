import 'package:corona_italy/features/infection_report/bloc/national/national_report_bloc.dart';
import 'package:corona_italy/features/infection_report/bloc/national/national_report_bloc_state.dart';
import 'package:corona_italy/features/infection_report/model/national/national_report_vm.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NationalReportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NationalReportBloc, NationalReportState>(
      buildWhen: (previous, current) => current is NationalReportLoaded,
      builder: (context, state) {
        switch (state.runtimeType) {
          case NationalReportLoading:
            return Center(
              child: CircularProgressIndicator(),
            );
          case NationalReportLoaded:
            final casted = state as NationalReportLoaded;
            return _NationalReportScreenBody(model: casted.report);
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

class _NationalReportScreenBody extends StatelessWidget {
  final NationalReportVm model;

  const _NationalReportScreenBody({Key key, @required this.model})
      : assert(model != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tr('national_report')),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: CustomScrollView(
          slivers: [
            SliverGrid.count(
              crossAxisCount: 2,
              childAspectRatio: 2,
              children: [
                _NationalReportGridTile(
                  tr('hospitalized_with_symptoms'),
                  model.hospitalizedWithSymptoms,
                ),
                _NationalReportGridTile(
                  tr('intensive_care'),
                  model.intensiveCare,
                ),
                _NationalReportGridTile(
                  tr('total_hospitalized'),
                  model.totalHospitalized,
                ),
                _NationalReportGridTile(
                  tr('home_isolation'),
                  model.homeIsolation,
                ),
                _NationalReportGridTile(
                  tr('total_positive'),
                  model.totalPositive,
                ),
                _NationalReportGridTile(
                  tr('total_positive_variation'),
                  model.totalPositiveVariation,
                ),
                _NationalReportGridTile(
                  tr('new_positive'),
                  model.newPositive,
                ),
                _NationalReportGridTile(
                  tr('discharged_healed'),
                  model.dischargedHealed,
                ),
                _NationalReportGridTile(
                  tr('deceased'),
                  model.deceased,
                ),
                _NationalReportGridTile(
                  tr('diagnostic_suspicion_cases'),
                  model.diagnosticSuspicionCases,
                ),
                _NationalReportGridTile(
                  tr('screening_cases'),
                  model.screeningCases,
                ),
                _NationalReportGridTile(
                  tr('total_cases'),
                  model.totalCases,
                ),
                _NationalReportGridTile(
                  tr('tampons'),
                  model.tampons,
                ),
                _NationalReportGridTile(
                  tr('tested_cases'),
                  model.testedCases,
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tr(
                        'notes',
                      ),
                    ),
                    Text((model.notes?.isNotEmpty ?? false)
                        ? model.notes
                        : tr('no_notes')),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  tr(
                    'last_update',
                    namedArgs: {'lastUpdate': DateFormat().format(model.date)},
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NationalReportGridTile extends StatelessWidget {
  final String title;
  final dynamic value;

  const _NationalReportGridTile(this.title, this.value);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Expanded(
              child: Center(
                child: Text(value?.toString()),
              ),
            )
          ],
        ),
      ),
    );
  }
}
