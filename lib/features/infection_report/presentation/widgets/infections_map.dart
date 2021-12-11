import 'dart:ui';

import 'package:corona_italy/features/infection_report/bloc/regional/regional_report_bloc.dart';
import 'package:corona_italy/features/infection_report/bloc/regional/regional_report_bloc_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class InfectionsMap extends StatefulWidget {
  @override
  _InfectionsMapState createState() => _InfectionsMapState();
}

class _InfectionsMapState extends State<InfectionsMap> {
  final center = LatLng(13.12, 42.41);
  final bounds = LatLngBounds(LatLng(47.1, 13.9), LatLng(36.7, 6.62));
  final mapController = MapController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegionalReportBloc, RegionalReportState>(
      // buildWhen: (previous, current) => current is RegionalReportLoaded,
      listenWhen: (previous, current) => current is RegionalReportLoadingError,
      listener: (context, state) {
        if (state is RegionalReportLoadingError) {
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
        final markers = <Marker>[];
        if (state is RegionalReportLoaded) {
          markers.addAll(
            state.report.reports.map(
                  (region) => Marker(
                point: region.location,
                width: 200,
                builder: (context) => Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Container(
                      color: Colors.white,
                      child: Text(
                        region.totalPositive.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }
        return FlutterMap(
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
            interactiveFlags: InteractiveFlag.all,
          ),
          layers: [
            TileLayerOptions(
              urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
              subdomains: ['a', 'b', 'c'],
            ),
            MarkerLayerOptions(
              markers: markers,
            ),
          ],
        );
      },
    );
  }
}
