import 'package:corona_italy/features/infection_report/bloc/national/national_report_bloc.dart';
import 'package:corona_italy/features/infection_report/bloc/national/national_report_bloc_event.dart';
import 'package:corona_italy/features/infection_report/bloc/regional/regional_report_bloc.dart';
import 'package:corona_italy/features/infection_report/bloc/regional/regional_report_bloc_event.dart';
import 'package:corona_italy/features/infection_report/presentation/widgets/home_panel.dart';
import 'package:corona_italy/features/infection_report/presentation/widgets/infections_map.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<NationalReportBloc>(context).add(NationalReportFetch());
      BlocProvider.of<RegionalReportBloc>(context).add(RegionalReportFetch());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tr('infection_report')),
      ),
      body: SlidingUpPanel(
        minHeight: MediaQuery.of(context).size.height * 0.2,
        maxHeight: MediaQuery.of(context).size.height * 0.7,
        defaultPanelState: PanelState.CLOSED,
        parallaxEnabled: true,
        panel: HomePanel(),
        body: InfectionsMap(),
      ),
    );
  }
}
