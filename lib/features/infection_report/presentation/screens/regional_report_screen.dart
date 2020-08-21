import 'package:corona_italy/app/dependencies/dependency_provider.dart';
import 'package:corona_italy/features/infection_report/bloc/provincial/provincial_report_bloc.dart';
import 'package:corona_italy/features/infection_report/bloc/provincial/provincial_report_bloc_event.dart';
import 'package:corona_italy/features/infection_report/model/regional/regional_report_vm.dart';
import 'package:corona_italy/features/infection_report/presentation/widgets/provinces_report_list.dart';
import 'package:corona_italy/features/infection_report/presentation/widgets/report_grid_tile.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegionalReportScreen extends StatefulWidget {
  final RegionalReportVm model;

  const RegionalReportScreen({Key key, @required this.model})
      : assert(model != null),
        super(key: key);

  @override
  _RegionalReportScreenState createState() => _RegionalReportScreenState();
}

class _RegionalReportScreenState extends State<RegionalReportScreen> {
  ProvincialReportBloc provincialReportBloc;
  @override
  void initState() {
    provincialReportBloc = ProvincialReportBloc(
      DependencyProvider.instance.infectionsReportService,
      regionCode: widget.model.regionCode,
    );
    provincialReportBloc.add(ProvincialReportFetch());
    super.initState();
  }

  @override
  void dispose() {
    provincialReportBloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.model.regionName),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: CustomScrollView(
          slivers: [
            SliverGrid.count(
              crossAxisCount: 2,
              childAspectRatio: 2,
              children: [
                ReportGridTile(
                  tr('hospitalized_with_symptoms'),
                  widget.model.hospitalizedWithSymptoms,
                ),
                ReportGridTile(
                  tr('intensive_care'),
                  widget.model.intensiveCare,
                ),
                ReportGridTile(
                  tr('total_hospitalized'),
                  widget.model.totalHospitalized,
                ),
                ReportGridTile(
                  tr('home_isolation'),
                  widget.model.homeIsolation,
                ),
                ReportGridTile(
                  tr('total_positive'),
                  widget.model.totalPositive,
                ),
                ReportGridTile(
                  tr('total_positive_variation'),
                  widget.model.totalPositiveVariation,
                ),
                ReportGridTile(
                  tr('new_positive'),
                  widget.model.newPositive,
                ),
                ReportGridTile(
                  tr('discharged_healed'),
                  widget.model.dischargedHealed,
                ),
                ReportGridTile(
                  tr('deceased'),
                  widget.model.deceased,
                ),
                ReportGridTile(
                  tr('diagnostic_suspicion_cases'),
                  widget.model.diagnosticSuspicionCases,
                ),
                ReportGridTile(
                  tr('screening_cases'),
                  widget.model.screeningCases,
                ),
                ReportGridTile(
                  tr('total_cases'),
                  widget.model.totalCases,
                ),
                ReportGridTile(
                  tr('tampons'),
                  widget.model.tampons,
                ),
                ReportGridTile(
                  tr('tested_cases'),
                  widget.model.testedCases,
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: BlocProvider<ProvincialReportBloc>.value(
                value: provincialReportBloc,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ProvincesReportList(
                    regionCode: widget.model.regionCode,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tr(
                        'notes',
                      ),
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    Text(
                      (widget.model.notes?.isNotEmpty ?? false)
                          ? widget.model.notes
                          : tr('no_notes'),
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
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
                    namedArgs: {
                      'lastUpdate': DateFormat().format(widget.model.date)
                    },
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
