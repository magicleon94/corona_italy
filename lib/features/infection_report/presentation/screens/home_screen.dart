import 'package:corona_italy/features/infection_report/bloc/national/national_report_bloc.dart';
import 'package:corona_italy/features/infection_report/bloc/national/national_report_bloc_event.dart';
import 'package:corona_italy/features/infection_report/presentation/widgets/home_panel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final center = LatLng(13.12, 42.41);
  final bounds = LatLngBounds(LatLng(47.1, 13.9), LatLng(36.7, 6.62));
  final mapController = MapController();

  void onPositionChanged(MapPosition newPosition) {}

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<NationalReportBloc>(context).add(NationalReportFetch());
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
        body: FlutterMap(
          options: MapOptions(
            controller: mapController,
            center: center,
            bounds: bounds,
            zoom: 5,
            minZoom: 5.5,
            screenSize: MediaQuery.of(context).size,
            slideOnBoundaries: true,
            swPanBoundary: bounds.southWest,
            nePanBoundary: bounds.northEast,
            interactive: true,
            onPositionChanged: (position, _) => onPositionChanged(position),
          ),
          layers: [
            TileLayerOptions(
              urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
              subdomains: ['a', 'b', 'c'],
            ),
            MarkerLayerOptions(
              markers: [],
            ),
          ],
        ),
      ),
    );
  }
}
